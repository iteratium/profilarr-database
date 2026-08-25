# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## What this repo is

A **Profilarr Compliant Database (PCD)** — the custom Radarr/Sonarr quality
profile database consumed by the Profilarr instance on the `mediacenter` host.
It contains no application code. It is data expressed as SQL.

## Migration state (read first)

This repo is mid-rewrite from Profilarr v1 to v2. The two formats share nothing.

- **`main`** — the v1 database: flat YAML in `custom_formats/`, `profiles/`,
  `regex_patterns/`, `media_management/`, `templates/`, plus `scripts/tierCreator.py`.
  Still the source material for the translation; read it with `git show main:<path>`.
- **`v2-migration`** — the v2 rewrite. Currently only `pcd.json`. The v1
  directories were deleted here deliberately; do not restore them.

`ops/` does not exist yet. Creating it *is* the outstanding work: translating the
v1 YAML into v2 SQL operations. Until then this branch builds an empty database.

## The PCD model

The stored artifact is **how to build the state, not the state**. A PCD is an
ordered, append-only sequence of SQL operations replayed to produce the database.
The upstream spec calls this Operational SQL (OSQL) and the workflow
Change-Driven Development (CDD).

Three rules follow, and they drive everything else:

1. **Append-only.** Once an op file is committed, never edit or delete it. A
   mistake is corrected by appending a new op that overrides it — the same way
   the upstream database has 290 ops including explicit reverts
   (`120.revert-exception.sql`).
2. **Ordered.** Files are `<N>.<kebab-case-description>.sql` with `N` a
   sequential integer from 0. Later ops override earlier ones.
3. **No DDL here.** Tables come from the `Dictionarry-Hub/schema` dependency
   declared in `pcd.json`. This repo only ever inserts/updates/deletes rows.

Layers apply in order: Schema → Dependencies (unused in 2.0) → Base → Tweaks →
User Ops. An optional `tweaks/` folder holds opt-in adjustments (`ban-megusta.sql`);
upstream ships none and we have none.

## Critical conventions

**Ops are normally exported from the Profilarr UI, not hand-written.** All 290
upstream ops carry the same generated header:

```sql
-- @operation: export
-- @entity: batch
-- @name: Boost Extended Edition Scoring
-- @exportedAt: 2026-03-11T21:51:38.621Z
-- @opIds: 2949, 2950, ...
```

with each statement wrapped in `-- --- BEGIN op <id> ( <verb> <entity> "<name>" )`
/ `-- --- END op <id>`. Prefer making changes in the Profilarr UI and exporting
them. If you must hand-write an op, do not fabricate `@opIds` or `@exportedAt`.

**Entities are referenced by name, never by ID.** Foreign keys are
`custom_format_name`, `quality_profile_name`, `regular_expression_name`,
`tag_name`. Renaming an entity is an `UPDATE` that cascades (`ON UPDATE CASCADE`).

**The upstream `docs/structure.md` shows `qp('...')` / `cf('...')` helper
functions. These do not exist** — the schema defines no SQL functions. Real ops
use the name columns directly. Do not copy that idiom from the docs.

**Updates carry an expected-value guard.** This is the conflict-detection
mechanism, not decoration:

```sql
update "regular_expressions" set "pattern" = '<new>'
where "name" = 'Extended' and "pattern" = '<old>';
```

**Inserts are idempotent.** Tags use `on conflict ("name") do nothing`; profile
links use `INSERT ... SELECT ... WHERE NOT EXISTS (...)`.

**`arr_type` splits Radarr from Sonarr** (`'radarr'`, `'sonarr'`, `'all'`) on
conditions and profile-format links, so the same format can score differently per
app. v1 expressed this as separate `custom_formats_radarr` / `custom_formats_sonarr`
YAML keys.

**Dialect is SQLite** (`INTEGER PRIMARY KEY AUTOINCREMENT`, `TEXT` timestamps,
booleans as `0`/`1`).

## Entity graph

The chain that defines a scored format, and the order ops must build it in:

```
regular_expressions ──┐
                      ├─→ condition_patterns ─→ custom_format_conditions ─→ custom_formats
tags ─────────────────┘                                                          │
                                                                                 ↓
quality_profiles ──→ quality_profile_custom_formats (arr_type, score) ───────────┘
             └─→ quality_groups → quality_group_members → quality_profile_qualities
```

Condition types in use upstream, by frequency: `release_group`, `release_title`,
`source`, `resolution`, `language`, `indexer_flag`, `release_type`,
`quality_modifier`, `edition`. Each gets its own `condition_*` side table.

Also present: `radarr_naming` / `sonarr_naming`, `radarr_quality_definitions` /
`sonarr_quality_definitions`, `radarr_media_settings` / `sonarr_media_settings`,
`delay_profiles`, and `custom_format_tests` + `test_entities` / `test_releases`
(v1 embedded its tests inline in each format's YAML).

## v1 → v2 translation map

| v1 (`main`) | v2 |
| --- | --- |
| `regex_patterns/*.yml` | `regular_expressions` rows + `regular_expression_tags` |
| `custom_formats/*.yml` → `conditions:` | `custom_formats` + `custom_format_conditions` + `condition_patterns` |
| `custom_formats/*.yml` → `tests:` | `custom_format_tests` |
| `profiles/*.yml` → `custom_formats{,_radarr,_sonarr}:` | `quality_profile_custom_formats` rows split by `arr_type` |
| `profiles/*.yml` → `qualities:` (nested `id: -1` groups) | `quality_groups` + `quality_group_members` + `quality_profile_qualities` |
| `profiles/*.yml` → `upgradesAllowed`, `minCustomFormatScore`, `upgradeUntilScore`, `minScoreIncrement` | `quality_profiles` columns `upgrades_allowed`, `minimum_custom_format_score`, `upgrade_until_score`, `upgrade_score_increment` |
| `media_management/*.yml` | `*_naming`, `*_quality_definitions`, `*_media_settings` |
| v1 `tags: [radarr, sonarr]` | **not** tags in v2 — this is the `arr_type` column |

Note the last row: in v1, `radarr`/`sonarr` were literal tag strings. In v2 tags
are descriptive only (`Banned`, `HDR`, `Release Group`); app targeting moved to
`arr_type` columns.

## Verifying changes

There is no build, lint, or test suite — nothing to compile and no package
manager. The `sqlite3` CLI is **not** installed; use Python's stdlib module.

Replay the schema plus this repo's ops into a throwaway in-memory database:

```bash
python3 - <<'PY'
import sqlite3, glob, re, os
SCHEMA = os.path.expanduser('~/projects/scratch/profilarr-v2-schema/ops')
db = sqlite3.connect(':memory:')
db.executescript(open(f'{SCHEMA}/0.schema.sql').read())
for d in (SCHEMA, 'ops'):
    for f in sorted(glob.glob(f'{d}/*.sql'),
                    key=lambda p: int(re.match(r'(\d+)', os.path.basename(p)).group(1))):
        if f.endswith('0.schema.sql'):
            continue
        db.executescript(open(f).read())
print('custom_formats:', db.execute('select count(*) from custom_formats').fetchone()[0])
PY
```

Caveat, verified: naively replaying **upstream's** ops this way fails at
`88.add-rarbg-to-efficient-ban-seperate-compact-efficient-banned.sql` with a
`condition_patterns` UNIQUE violation. Profilarr's apply logic does more than
sequential `executescript`, so a clean replay is a useful smoke test for our own
ops but is not an authority on validity — Profilarr itself is.

## Reference checkouts

Not vendored. `~/projects/scratch/` is disposable, so re-clone as needed:

```bash
git clone --depth 1 https://github.com/Dictionarry-Hub/schema.git   ~/projects/scratch/profilarr-v2-schema
git clone --depth 1 https://github.com/Dictionarry-Hub/database.git ~/projects/scratch/profilarr-v2-reference
```

- **schema** — `ops/0.schema.sql` is the authoritative table definitions;
  `docs/structure.md` (PCD/OSQL/CDD spec) and `docs/manifest.md` (`pcd.json` spec).
- **database** — the official Dictionarry PCD, and the best worked example of op
  style. It uses `stable`/`dev` branches; we use `main`/`v2-migration`.

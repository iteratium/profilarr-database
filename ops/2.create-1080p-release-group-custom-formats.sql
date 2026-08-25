-- Hand-written (not exported from the Profilarr UI): translation of v1
-- custom_formats/1080p *.yml (main branch) into the v2 schema.
--
-- Each v1 file has a `resolution: 1080p` condition plus one release_title/
-- release_group condition whose `pattern` field is an inline literal (e.g.
-- "BiOMA") rather than a reference to the regex_patterns library. v2's
-- condition_patterns has no inline-pattern field -- it is a hard FK to
-- regular_expressions(name) -- so each pattern condition here is pointed at
-- the matching named regex from 1.create-regex-patterns.sql instead.
--
-- v1 tags [radarr, sonarr] / [radarr] / [] on these formats are dropped, per
-- CLAUDE.md: that's not what tags mean in v2, and custom_formats has no
-- arr_type column to translate them to -- app targeting only exists on
-- custom_format_conditions and quality_profile_custom_formats, and every
-- condition below applies to both apps regardless of what the v1 tags said
-- (cross-checked against profiles/1080p.yml, where e.g. Chivaman is split
-- radarr/sonarr despite carrying no v1 tags at all, so the CF-level tags
-- don't actually track that).
--
-- v1 inline per-condition tests are carried over into custom_format_tests
-- (movie/series inferred from each test's release title).
--
-- Profile score links (quality_profile_custom_formats) remain deferred, as
-- noted in 0.create-1080p-profile.sql, to a later op.

insert into "custom_formats" ("name", "description") values ('1080p BiOMA', '');

INSERT INTO custom_format_conditions (custom_format_name, name, type, arr_type, negate, required) VALUES ('1080p BiOMA', '1080p', 'resolution', 'all', 0, 1);
INSERT INTO condition_resolutions (custom_format_name, condition_name, resolution) VALUES ('1080p BiOMA', '1080p', '1080p');

INSERT INTO custom_format_conditions (custom_format_name, name, type, arr_type, negate, required) VALUES ('1080p BiOMA', 'BiOMA', 'release_title', 'all', 0, 1);
INSERT INTO condition_patterns (custom_format_name, condition_name, regular_expression_name) VALUES ('1080p BiOMA', 'BiOMA', 'BiOMA');

insert into "custom_formats" ("name", "description") values ('1080p Chivaman', '');

INSERT INTO custom_format_conditions (custom_format_name, name, type, arr_type, negate, required) VALUES ('1080p Chivaman', '1080p', 'resolution', 'all', 0, 1);
INSERT INTO condition_resolutions (custom_format_name, condition_name, resolution) VALUES ('1080p Chivaman', '1080p', '1080p');

INSERT INTO custom_format_conditions (custom_format_name, name, type, arr_type, negate, required) VALUES ('1080p Chivaman', 'Chivaman', 'release_title', 'all', 0, 1);
INSERT INTO condition_patterns (custom_format_name, condition_name, regular_expression_name) VALUES ('1080p Chivaman', 'Chivaman', 'Chivaman');

insert into "custom_formats" ("name", "description") values ('1080p ELiTE', '');

INSERT INTO custom_format_conditions (custom_format_name, name, type, arr_type, negate, required) VALUES ('1080p ELiTE', '1080p', 'resolution', 'all', 0, 1);
INSERT INTO condition_resolutions (custom_format_name, condition_name, resolution) VALUES ('1080p ELiTE', '1080p', '1080p');

INSERT INTO custom_format_conditions (custom_format_name, name, type, arr_type, negate, required) VALUES ('1080p ELiTE', 'ELiTE', 'release_title', 'all', 0, 1);
INSERT INTO condition_patterns (custom_format_name, condition_name, regular_expression_name) VALUES ('1080p ELiTE', 'ELiTE', 'ELiTE');

INSERT INTO custom_format_tests (custom_format_name, title, type, should_match, description) VALUES ('1080p ELiTE', 'Pluribus S01E09 1080p x265-ELiTE ', 'series', 1, NULL);
INSERT INTO custom_format_tests (custom_format_name, title, type, should_match, description) VALUES ('1080p ELiTE', 'House of Cards 2013 Season 1-3 S01-S03 1080p BluRay x264-ROVERS', 'series', 0, 'Different release group must not match');

insert into "custom_formats" ("name", "description") values ('1080p Lootera', '');

INSERT INTO custom_format_conditions (custom_format_name, name, type, arr_type, negate, required) VALUES ('1080p Lootera', '1080p', 'resolution', 'all', 0, 1);
INSERT INTO condition_resolutions (custom_format_name, condition_name, resolution) VALUES ('1080p Lootera', '1080p', '1080p');

INSERT INTO custom_format_conditions (custom_format_name, name, type, arr_type, negate, required) VALUES ('1080p Lootera', 'Lootera', 'release_title', 'all', 0, 1);
INSERT INTO condition_patterns (custom_format_name, condition_name, regular_expression_name) VALUES ('1080p Lootera', 'Lootera', 'Lootera');

INSERT INTO custom_format_tests (custom_format_name, title, type, should_match, description) VALUES ('1080p Lootera', 'The Family Man S03 1080p WebRip EAC3 5 1 x265-Lootera', 'series', 1, NULL);

insert into "custom_formats" ("name", "description") values ('1080p MeGusta', '');

INSERT INTO custom_format_conditions (custom_format_name, name, type, arr_type, negate, required) VALUES ('1080p MeGusta', '1080p', 'resolution', 'all', 0, 1);
INSERT INTO condition_resolutions (custom_format_name, condition_name, resolution) VALUES ('1080p MeGusta', '1080p', '1080p');

INSERT INTO custom_format_conditions (custom_format_name, name, type, arr_type, negate, required) VALUES ('1080p MeGusta', 'MeGusta', 'release_title', 'all', 0, 1);
INSERT INTO condition_patterns (custom_format_name, condition_name, regular_expression_name) VALUES ('1080p MeGusta', 'MeGusta', 'MeGusta');

INSERT INTO custom_format_tests (custom_format_name, title, type, should_match, description) VALUES ('1080p MeGusta', 'Kimora Back in the Fab Lane S01E08 1080p HEVC x265-MeGusta', 'series', 1, NULL);
INSERT INTO custom_format_tests (custom_format_name, title, type, should_match, description) VALUES ('1080p MeGusta', 'The Family Man S03 1080p WebRip EAC3 5 1 x265-Lootera', 'series', 0, 'Lootera release must not match MeGusta');

insert into "custom_formats" ("name", "description") values ('1080p PSA', '');

INSERT INTO custom_format_conditions (custom_format_name, name, type, arr_type, negate, required) VALUES ('1080p PSA', '1080p', 'resolution', 'all', 0, 1);
INSERT INTO condition_resolutions (custom_format_name, condition_name, resolution) VALUES ('1080p PSA', '1080p', '1080p');

INSERT INTO custom_format_conditions (custom_format_name, name, type, arr_type, negate, required) VALUES ('1080p PSA', 'psa', 'release_group', 'all', 0, 1);
INSERT INTO condition_patterns (custom_format_name, condition_name, regular_expression_name) VALUES ('1080p PSA', 'psa', 'PSA');

INSERT INTO custom_format_tests (custom_format_name, title, type, should_match, description) VALUES ('1080p PSA', 'Mickey.17.2025.2160p.HDR10Plus.DV.WEBRip.DDP5 1.Atmos.X265.HEVC-PSA ', 'movie', 1, NULL);
INSERT INTO custom_format_tests (custom_format_name, title, type, should_match, description) VALUES ('1080p PSA', 'Dune - Part Two (2024) (2160p BluRay x265 HEVC 10bit HDR AAC 7.1 Tigole) [QxR] ', 'movie', 0, 'QxR release must not match PSA');

insert into "custom_formats" ("name", "description") values ('1080p QXR', '');

INSERT INTO custom_format_conditions (custom_format_name, name, type, arr_type, negate, required) VALUES ('1080p QXR', '1080p', 'resolution', 'all', 0, 1);
INSERT INTO condition_resolutions (custom_format_name, condition_name, resolution) VALUES ('1080p QXR', '1080p', '1080p');

INSERT INTO custom_format_conditions (custom_format_name, name, type, arr_type, negate, required) VALUES ('1080p QXR', 'qxr', 'release_group', 'all', 0, 1);
INSERT INTO condition_patterns (custom_format_name, condition_name, regular_expression_name) VALUES ('1080p QXR', 'qxr', 'QxR');

INSERT INTO custom_format_tests (custom_format_name, title, type, should_match, description) VALUES ('1080p QXR', 'Dune - Part Two (2024) (2160p BluRay x265 HEVC 10bit HDR AAC 7.1 Tigole) [QxR] ', 'movie', 1, NULL);
INSERT INTO custom_format_tests (custom_format_name, title, type, should_match, description) VALUES ('1080p QXR', 'Mickey.17.2025.2160p.HDR10Plus.DV.WEBRip.DDP5 1.Atmos.X265.HEVC-PSA ', 'movie', 0, 'PSA release must not match QXR');

insert into "custom_formats" ("name", "description") values ('1080p TAoE', '');

INSERT INTO custom_format_conditions (custom_format_name, name, type, arr_type, negate, required) VALUES ('1080p TAoE', '1080p', 'resolution', 'all', 0, 1);
INSERT INTO condition_resolutions (custom_format_name, condition_name, resolution) VALUES ('1080p TAoE', '1080p', '1080p');

INSERT INTO custom_format_conditions (custom_format_name, name, type, arr_type, negate, required) VALUES ('1080p TAoE', 'TAoE', 'release_title', 'all', 0, 1);
INSERT INTO condition_patterns (custom_format_name, condition_name, regular_expression_name) VALUES ('1080p TAoE', 'TAoE', 'TAoE');

INSERT INTO custom_format_tests (custom_format_name, title, type, should_match, description) VALUES ('1080p TAoE', 'Avatar (2009) Extended Collector''s Edition (1080p BDRip x265 10bit EAC3 5 1 - WEM)[TAoE]', 'movie', 1, NULL);

insert into "custom_formats" ("name", "description") values ('1080p Vyndros', '');

INSERT INTO custom_format_conditions (custom_format_name, name, type, arr_type, negate, required) VALUES ('1080p Vyndros', '1080p', 'resolution', 'all', 0, 1);
INSERT INTO condition_resolutions (custom_format_name, condition_name, resolution) VALUES ('1080p Vyndros', '1080p', '1080p');

INSERT INTO custom_format_conditions (custom_format_name, name, type, arr_type, negate, required) VALUES ('1080p Vyndros', 'Vyndros', 'release_title', 'all', 0, 1);
INSERT INTO condition_patterns (custom_format_name, condition_name, regular_expression_name) VALUES ('1080p Vyndros', 'Vyndros', 'Vyndros');

insert into "custom_formats" ("name", "description") values ('1080p YTS', '');

INSERT INTO custom_format_conditions (custom_format_name, name, type, arr_type, negate, required) VALUES ('1080p YTS', '1080p', 'resolution', 'all', 0, 1);
INSERT INTO condition_resolutions (custom_format_name, condition_name, resolution) VALUES ('1080p YTS', '1080p', '1080p');

INSERT INTO custom_format_conditions (custom_format_name, name, type, arr_type, negate, required) VALUES ('1080p YTS', 'YTS', 'release_title', 'all', 0, 1);
INSERT INTO condition_patterns (custom_format_name, condition_name, regular_expression_name) VALUES ('1080p YTS', 'YTS', 'YTS');

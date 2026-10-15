-- @operation: export
-- @entity: batch
-- @name: av1
-- @exportedAt: 2026-10-15T07:15:35.779Z
-- @opIds: 331, 332, 333, 334, 335, 336, 337, 338, 339, 340, 341, 342

-- --- BEGIN op 331 ( create regular_expression "Vialle" )
insert into "regular_expressions" ("name", "pattern", "description", "regex101_id") values ('Vialle', '(?<=^|[\s.-])Vialle\b', 'Matches "Vialle" when preceded by whitespace, a hyphen or dot', NULL);

insert into "tags" ("name") values ('Release Group') on conflict ("name") do nothing;

INSERT INTO regular_expression_tags (regular_expression_name, tag_name) VALUES ('Vialle', 'Release Group');
-- --- END op 331

-- --- BEGIN op 332 ( create custom_format "1080p Vialle" )
insert into "custom_formats" ("name", "description") values ('1080p Vialle', '');
-- --- END op 332

-- --- BEGIN op 333 ( update custom_format "1080p Vialle" )
INSERT INTO custom_format_conditions (custom_format_name, name, type, arr_type, negate, required)
VALUES ('1080p Vialle', '1080p', 'resolution', 'all', 0, 1);

INSERT INTO condition_resolutions (custom_format_name, condition_name, resolution) VALUES ('1080p Vialle', '1080p', '1080p');
-- --- END op 333

-- --- BEGIN op 334 ( update custom_format "1080p Vialle" )
INSERT INTO custom_format_conditions (custom_format_name, name, type, arr_type, negate, required)
VALUES ('1080p Vialle', 'Vialle', 'release_group', 'all', 0, 1);

INSERT INTO condition_patterns (custom_format_name, condition_name, regular_expression_name) VALUES ('1080p Vialle', 'Vialle', 'Vialle');
-- --- END op 334

-- --- BEGIN op 335 ( update quality_profile "1080p" )
INSERT INTO quality_profile_custom_formats (quality_profile_name, custom_format_name, arr_type, score)
SELECT '1080p', '1080p Vialle', 'radarr', 150
WHERE NOT EXISTS (
  SELECT 1 FROM quality_profile_custom_formats
  WHERE quality_profile_name = '1080p'
    AND custom_format_name = '1080p Vialle'
    AND arr_type = 'radarr'
);
-- --- END op 335

-- --- BEGIN op 336 ( update quality_profile "1080p" )
INSERT INTO quality_profile_custom_formats (quality_profile_name, custom_format_name, arr_type, score)
SELECT '1080p', '1080p Vialle', 'sonarr', 150
WHERE NOT EXISTS (
  SELECT 1 FROM quality_profile_custom_formats
  WHERE quality_profile_name = '1080p'
    AND custom_format_name = '1080p Vialle'
    AND arr_type = 'sonarr'
);
-- --- END op 336

-- --- BEGIN op 337 ( create custom_format "1080p AV1" )
insert into "custom_formats" ("name", "description") values ('1080p AV1', '');
-- --- END op 337

-- --- BEGIN op 338 ( update custom_format "1080p AV1" )
INSERT INTO custom_format_conditions (custom_format_name, name, type, arr_type, negate, required)
VALUES ('1080p AV1', 'AV1', 'release_title', 'all', 0, 1);

INSERT INTO condition_patterns (custom_format_name, condition_name, regular_expression_name) VALUES ('1080p AV1', 'AV1', 'AV1');
-- --- END op 338

-- --- BEGIN op 339 ( update custom_format "1080p AV1" )
INSERT INTO custom_format_conditions (custom_format_name, name, type, arr_type, negate, required)
VALUES ('1080p AV1', '1080p', 'resolution', 'all', 0, 1);

INSERT INTO condition_resolutions (custom_format_name, condition_name, resolution) VALUES ('1080p AV1', '1080p', '1080p');
-- --- END op 339

-- --- BEGIN op 340 ( update quality_profile "1080p" )
INSERT INTO quality_profile_custom_formats (quality_profile_name, custom_format_name, arr_type, score)
SELECT '1080p', '1080p AV1', 'radarr', 180
WHERE NOT EXISTS (
  SELECT 1 FROM quality_profile_custom_formats
  WHERE quality_profile_name = '1080p'
    AND custom_format_name = '1080p AV1'
    AND arr_type = 'radarr'
);
-- --- END op 340

-- --- BEGIN op 341 ( update quality_profile "1080p" )
INSERT INTO quality_profile_custom_formats (quality_profile_name, custom_format_name, arr_type, score)
SELECT '1080p', '1080p AV1', 'sonarr', 180
WHERE NOT EXISTS (
  SELECT 1 FROM quality_profile_custom_formats
  WHERE quality_profile_name = '1080p'
    AND custom_format_name = '1080p AV1'
    AND arr_type = 'sonarr'
);
-- --- END op 341

-- --- BEGIN op 342 ( update quality_profile "1080p" )
update "quality_profiles" set "upgrade_until_score" = 100 where "name" = '1080p' and "upgrade_until_score" = 75;
-- --- END op 342

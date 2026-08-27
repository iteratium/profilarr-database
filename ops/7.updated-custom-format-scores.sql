-- @operation: export
-- @entity: batch
-- @name: Updated Custom Format Scores
-- @exportedAt: 2026-08-27T01:42:47.382Z
-- @opIds: 326, 327, 328, 329

-- --- BEGIN op 326 ( update quality_profile "1080p" )
INSERT INTO quality_profile_custom_formats (quality_profile_name, custom_format_name, arr_type, score)
SELECT '1080p', '1080p Vyndros', 'radarr', 100
WHERE NOT EXISTS (
  SELECT 1 FROM quality_profile_custom_formats
  WHERE quality_profile_name = '1080p'
    AND custom_format_name = '1080p Vyndros'
    AND arr_type = 'radarr'
);
-- --- END op 326

-- --- BEGIN op 327 ( update quality_profile "1080p" )
INSERT INTO quality_profile_custom_formats (quality_profile_name, custom_format_name, arr_type, score)
SELECT '1080p', '1080p Vyndros', 'sonarr', 100
WHERE NOT EXISTS (
  SELECT 1 FROM quality_profile_custom_formats
  WHERE quality_profile_name = '1080p'
    AND custom_format_name = '1080p Vyndros'
    AND arr_type = 'sonarr'
);
-- --- END op 327

-- --- BEGIN op 328 ( update quality_profile "1080p" )
DELETE FROM quality_profile_custom_formats
WHERE quality_profile_name = '1080p'
  AND custom_format_name = '1080p Vyndros'
  AND arr_type = 'all'
  AND score = 100;
-- --- END op 328

-- --- BEGIN op 329 ( update quality_profile "1080p" )
UPDATE quality_profile_custom_formats
SET score = 150
WHERE quality_profile_name = '1080p'
  AND custom_format_name = '1080p Vyndros'
  AND arr_type = 'sonarr'
  AND score = 100;
-- --- END op 329

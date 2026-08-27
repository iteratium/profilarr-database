-- @operation: export
-- @entity: batch
-- @name: Updated prefered quality definition
-- @exportedAt: 2026-08-27T01:36:35.229Z
-- @opIds: 305, 306, 307, 308, 309, 310, 311, 312, 313, 314, 315, 316, 317, 318, 319, 320, 321, 322, 323, 324

-- --- BEGIN op 305 ( update radarr_quality_definitions "default" )
update "radarr_quality_definitions" set "min_size" = 0, "max_size" = 0, "preferred_size" = 7 where "name" = 'default' and "quality_name" = 'Bluray-1080p' and "min_size" = 0 and "max_size" = 2000 and "preferred_size" = 1990;
-- --- END op 305

-- --- BEGIN op 306 ( update radarr_quality_definitions "default" )
update "radarr_quality_definitions" set "min_size" = 0, "max_size" = 0, "preferred_size" = 1990 where "name" = 'default' and "quality_name" = 'Bluray-2160p' and "min_size" = 0 and "max_size" = 2000 and "preferred_size" = 1990;
-- --- END op 306

-- --- BEGIN op 307 ( update radarr_quality_definitions "default" )
update "radarr_quality_definitions" set "min_size" = 0, "max_size" = 0, "preferred_size" = 7 where "name" = 'default' and "quality_name" = 'HDTV-1080p' and "min_size" = 0 and "max_size" = 2000 and "preferred_size" = 1990;
-- --- END op 307

-- --- BEGIN op 308 ( update radarr_quality_definitions "default" )
update "radarr_quality_definitions" set "min_size" = 0, "max_size" = 0, "preferred_size" = 1990 where "name" = 'default' and "quality_name" = 'HDTV-2160p' and "min_size" = 0 and "max_size" = 2000 and "preferred_size" = 1990;
-- --- END op 308

-- --- BEGIN op 309 ( update radarr_quality_definitions "default" )
update "radarr_quality_definitions" set "min_size" = 0, "max_size" = 0, "preferred_size" = 7 where "name" = 'default' and "quality_name" = 'Remux-1080p' and "min_size" = 0 and "max_size" = 2000 and "preferred_size" = 1990;
-- --- END op 309

-- --- BEGIN op 310 ( update radarr_quality_definitions "default" )
update "radarr_quality_definitions" set "min_size" = 0, "max_size" = 0, "preferred_size" = 1990 where "name" = 'default' and "quality_name" = 'Remux-2160p' and "min_size" = 0 and "max_size" = 2000 and "preferred_size" = 1990;
-- --- END op 310

-- --- BEGIN op 311 ( update radarr_quality_definitions "default" )
update "radarr_quality_definitions" set "min_size" = 0, "max_size" = 0, "preferred_size" = 7 where "name" = 'default' and "quality_name" = 'WEBDL-1080p' and "min_size" = 0 and "max_size" = 2000 and "preferred_size" = 1990;
-- --- END op 311

-- --- BEGIN op 312 ( update radarr_quality_definitions "default" )
update "radarr_quality_definitions" set "min_size" = 0, "max_size" = 0, "preferred_size" = 1990 where "name" = 'default' and "quality_name" = 'WEBDL-2160p' and "min_size" = 0 and "max_size" = 2000 and "preferred_size" = 1990;
-- --- END op 312

-- --- BEGIN op 313 ( update radarr_quality_definitions "default" )
update "radarr_quality_definitions" set "min_size" = 0, "max_size" = 0, "preferred_size" = 7 where "name" = 'default' and "quality_name" = 'WEBRip-1080p' and "min_size" = 0 and "max_size" = 2000 and "preferred_size" = 1990;
-- --- END op 313

-- --- BEGIN op 314 ( update radarr_quality_definitions "default" )
update "radarr_quality_definitions" set "min_size" = 0, "max_size" = 0, "preferred_size" = 1990 where "name" = 'default' and "quality_name" = 'WEBRip-2160p' and "min_size" = 0 and "max_size" = 2000 and "preferred_size" = 1990;
-- --- END op 314

-- --- BEGIN op 315 ( update sonarr_quality_definitions "default" )
update "sonarr_quality_definitions" set "min_size" = 0, "max_size" = 0, "preferred_size" = 7 where "name" = 'default' and "quality_name" = 'Bluray-1080p' and "min_size" = 0 and "max_size" = 2000 and "preferred_size" = 1990;
-- --- END op 315

-- --- BEGIN op 316 ( update sonarr_quality_definitions "default" )
update "sonarr_quality_definitions" set "min_size" = 0, "max_size" = 0, "preferred_size" = 0 where "name" = 'default' and "quality_name" = 'Bluray-2160p' and "min_size" = 0 and "max_size" = 2000 and "preferred_size" = 1990;
-- --- END op 316

-- --- BEGIN op 317 ( update sonarr_quality_definitions "default" )
update "sonarr_quality_definitions" set "min_size" = 0, "max_size" = 0, "preferred_size" = 7 where "name" = 'default' and "quality_name" = 'HDTV-1080p' and "min_size" = 0 and "max_size" = 2000 and "preferred_size" = 1990;
-- --- END op 317

-- --- BEGIN op 318 ( update sonarr_quality_definitions "default" )
update "sonarr_quality_definitions" set "min_size" = 0, "max_size" = 0, "preferred_size" = 0 where "name" = 'default' and "quality_name" = 'HDTV-2160p' and "min_size" = 0 and "max_size" = 2000 and "preferred_size" = 1990;
-- --- END op 318

-- --- BEGIN op 319 ( update sonarr_quality_definitions "default" )
update "sonarr_quality_definitions" set "min_size" = 0, "max_size" = 0, "preferred_size" = 7 where "name" = 'default' and "quality_name" = 'Remux-1080p' and "min_size" = 0 and "max_size" = 2000 and "preferred_size" = 1990;
-- --- END op 319

-- --- BEGIN op 320 ( update sonarr_quality_definitions "default" )
update "sonarr_quality_definitions" set "min_size" = 0, "max_size" = 0, "preferred_size" = 0 where "name" = 'default' and "quality_name" = 'Remux-2160p' and "min_size" = 0 and "max_size" = 2000 and "preferred_size" = 1990;
-- --- END op 320

-- --- BEGIN op 321 ( update sonarr_quality_definitions "default" )
update "sonarr_quality_definitions" set "min_size" = 0, "max_size" = 0, "preferred_size" = 7 where "name" = 'default' and "quality_name" = 'WEBDL-1080p' and "min_size" = 0 and "max_size" = 2000 and "preferred_size" = 1990;
-- --- END op 321

-- --- BEGIN op 322 ( update sonarr_quality_definitions "default" )
update "sonarr_quality_definitions" set "min_size" = 0, "max_size" = 0, "preferred_size" = 0 where "name" = 'default' and "quality_name" = 'WEBDL-2160p' and "min_size" = 0 and "max_size" = 2000 and "preferred_size" = 1990;
-- --- END op 322

-- --- BEGIN op 323 ( update sonarr_quality_definitions "default" )
update "sonarr_quality_definitions" set "min_size" = 0, "max_size" = 0, "preferred_size" = 7 where "name" = 'default' and "quality_name" = 'WEBRip-1080p' and "min_size" = 0 and "max_size" = 2000 and "preferred_size" = 1990;
-- --- END op 323

-- --- BEGIN op 324 ( update sonarr_quality_definitions "default" )
update "sonarr_quality_definitions" set "min_size" = 0, "max_size" = 0, "preferred_size" = 0 where "name" = 'default' and "quality_name" = 'WEBRip-2160p' and "min_size" = 0 and "max_size" = 2000 and "preferred_size" = 1990;
-- --- END op 324

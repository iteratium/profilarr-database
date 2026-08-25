-- Hand-written (not exported from the Profilarr UI): translation of v1
-- media_management/{misc,naming,quality_definitions}.yml (main branch) into
-- the v2 schema.
--
-- v1 quality_definitions.yml only overrides the 1080p and 2160p buckets,
-- leaving every other quality at whatever the target Radarr/Sonarr instance
-- already has. That's expressed as-is here -- only the granular qualities
-- under those two resolutions (per quality_api_mappings in the schema
-- dependency: HDTV/WEBDL/WEBRip/Bluray/Remux for each of 1080p/2160p) get a
-- row; the rest are left unmanaged rather than fabricated.
--
-- "name" = 'default' for all three settings tables, matching the seed value
-- the schema dependency's reference usage establishes for a single, unnamed
-- configuration (see Dictionarry-Hub/database ops/0.rosettarr.sql).

INSERT INTO radarr_media_settings (name, propers_repacks, enable_media_info) VALUES ('default', 'doNotPrefer', 1);
INSERT INTO sonarr_media_settings (name, propers_repacks, enable_media_info) VALUES ('default', 'doNotPrefer', 1);

INSERT INTO radarr_naming (name, rename, movie_format, movie_folder_format, replace_illegal_characters, colon_replacement_format)
VALUES ('default', 1, '{Movie CleanTitle} {(Release Year)} {tmdb-{TmdbId}}', '{Movie CleanTitle} ({Release Year}) {tmdb-{TmdbId}}', 1, 'dash');

INSERT INTO sonarr_naming (name, rename, standard_episode_format, daily_episode_format, anime_episode_format, series_folder_format, season_folder_format, replace_illegal_characters, colon_replacement_format, custom_colon_replacement_format, multi_episode_style)
VALUES ('default', 1, '{Series TitleYear} - S{season:00}E{episode:00} - {Episode CleanTitle}', '{Series TitleYear} - {Air-Date} - {Episode CleanTitle}', '{Series TitleYear} - S{season:00}E{episode:00} - {absolute:000} - {Episode CleanTitle}', '{Series TitleYear} {{TvdbId}}', 'Season {season:00}', 1, 1, '', 5);

INSERT INTO radarr_quality_definitions (name, quality_name, min_size, max_size, preferred_size) VALUES ('default', 'HDTV-1080p', 0, 2000, 1990);
INSERT INTO radarr_quality_definitions (name, quality_name, min_size, max_size, preferred_size) VALUES ('default', 'WEBDL-1080p', 0, 2000, 1990);
INSERT INTO radarr_quality_definitions (name, quality_name, min_size, max_size, preferred_size) VALUES ('default', 'WEBRip-1080p', 0, 2000, 1990);
INSERT INTO radarr_quality_definitions (name, quality_name, min_size, max_size, preferred_size) VALUES ('default', 'Bluray-1080p', 0, 2000, 1990);
INSERT INTO radarr_quality_definitions (name, quality_name, min_size, max_size, preferred_size) VALUES ('default', 'Remux-1080p', 0, 2000, 1990);
INSERT INTO radarr_quality_definitions (name, quality_name, min_size, max_size, preferred_size) VALUES ('default', 'HDTV-2160p', 0, 2000, 1990);
INSERT INTO radarr_quality_definitions (name, quality_name, min_size, max_size, preferred_size) VALUES ('default', 'WEBDL-2160p', 0, 2000, 1990);
INSERT INTO radarr_quality_definitions (name, quality_name, min_size, max_size, preferred_size) VALUES ('default', 'WEBRip-2160p', 0, 2000, 1990);
INSERT INTO radarr_quality_definitions (name, quality_name, min_size, max_size, preferred_size) VALUES ('default', 'Bluray-2160p', 0, 2000, 1990);
INSERT INTO radarr_quality_definitions (name, quality_name, min_size, max_size, preferred_size) VALUES ('default', 'Remux-2160p', 0, 2000, 1990);

INSERT INTO sonarr_quality_definitions (name, quality_name, min_size, max_size, preferred_size) VALUES ('default', 'HDTV-1080p', 0, 2000, 1990);
INSERT INTO sonarr_quality_definitions (name, quality_name, min_size, max_size, preferred_size) VALUES ('default', 'WEBDL-1080p', 0, 2000, 1990);
INSERT INTO sonarr_quality_definitions (name, quality_name, min_size, max_size, preferred_size) VALUES ('default', 'WEBRip-1080p', 0, 2000, 1990);
INSERT INTO sonarr_quality_definitions (name, quality_name, min_size, max_size, preferred_size) VALUES ('default', 'Bluray-1080p', 0, 2000, 1990);
INSERT INTO sonarr_quality_definitions (name, quality_name, min_size, max_size, preferred_size) VALUES ('default', 'Remux-1080p', 0, 2000, 1990);
INSERT INTO sonarr_quality_definitions (name, quality_name, min_size, max_size, preferred_size) VALUES ('default', 'HDTV-2160p', 0, 2000, 1990);
INSERT INTO sonarr_quality_definitions (name, quality_name, min_size, max_size, preferred_size) VALUES ('default', 'WEBDL-2160p', 0, 2000, 1990);
INSERT INTO sonarr_quality_definitions (name, quality_name, min_size, max_size, preferred_size) VALUES ('default', 'WEBRip-2160p', 0, 2000, 1990);
INSERT INTO sonarr_quality_definitions (name, quality_name, min_size, max_size, preferred_size) VALUES ('default', 'Bluray-2160p', 0, 2000, 1990);
INSERT INTO sonarr_quality_definitions (name, quality_name, min_size, max_size, preferred_size) VALUES ('default', 'Remux-2160p', 0, 2000, 1990);

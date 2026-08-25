-- Hand-written (not exported from the Profilarr UI): translation of v1
-- profiles/1080p.yml (main branch) into the v2 schema.
--
-- v1 tags [radarr, sonarr] intentionally dropped: those meant "applies to
-- both apps", which in v2 is expressed via arr_type on the custom-format
-- score links, not a profile-level tag.
--
-- Quality list: v1 only defined the "1080p" group (Remux/WEBDL/Bluray/WEBRip/
-- HDTV-1080p, merged as equivalent) and set it as the upgrade cutoff. All
-- other qualities are listed disabled, ranked in the same relative order the
-- upstream Dictionarry database uses (2160p tiers above 1080p, then 720p,
-- 480p/576p, DVD/SDTV, pre-release junk, then Unknown/Raw-HD/BR-DISK).
--
-- TODO: quality_profile_custom_formats score links (1080p TAoE, 1080p QXR,
-- etc.) are deferred to a later op once the custom_formats/regular_expressions
-- migration exists -- those format names don't exist in this database yet.

insert into "quality_profiles"
  ("name", "description", "upgrades_allowed", "minimum_custom_format_score", "upgrade_until_score", "upgrade_score_increment")
values
  ('1080p', '', 1, 75, 75, 30);

INSERT INTO quality_groups (quality_profile_name, name) VALUES ('1080p', '1080p');

INSERT INTO quality_group_members (quality_profile_name, quality_group_name, quality_name, position) VALUES ('1080p', '1080p', 'Remux-1080p', 0);
INSERT INTO quality_group_members (quality_profile_name, quality_group_name, quality_name, position) VALUES ('1080p', '1080p', 'WEBDL-1080p', 1);
INSERT INTO quality_group_members (quality_profile_name, quality_group_name, quality_name, position) VALUES ('1080p', '1080p', 'Bluray-1080p', 2);
INSERT INTO quality_group_members (quality_profile_name, quality_group_name, quality_name, position) VALUES ('1080p', '1080p', 'WEBRip-1080p', 3);
INSERT INTO quality_group_members (quality_profile_name, quality_group_name, quality_name, position) VALUES ('1080p', '1080p', 'HDTV-1080p', 4);

INSERT INTO quality_profile_qualities (quality_profile_name, quality_name, quality_group_name, position, enabled, upgrade_until) VALUES ('1080p', 'Remux-2160p', NULL, 1, 0, 0);
INSERT INTO quality_profile_qualities (quality_profile_name, quality_name, quality_group_name, position, enabled, upgrade_until) VALUES ('1080p', 'Bluray-2160p', NULL, 2, 0, 0);
INSERT INTO quality_profile_qualities (quality_profile_name, quality_name, quality_group_name, position, enabled, upgrade_until) VALUES ('1080p', 'WEBDL-2160p', NULL, 3, 0, 0);
INSERT INTO quality_profile_qualities (quality_profile_name, quality_name, quality_group_name, position, enabled, upgrade_until) VALUES ('1080p', 'WEBRip-2160p', NULL, 4, 0, 0);
INSERT INTO quality_profile_qualities (quality_profile_name, quality_name, quality_group_name, position, enabled, upgrade_until) VALUES ('1080p', 'HDTV-2160p', NULL, 5, 0, 0);
INSERT INTO quality_profile_qualities (quality_profile_name, quality_name, quality_group_name, position, enabled, upgrade_until) VALUES ('1080p', NULL, '1080p', 6, 1, 1);
INSERT INTO quality_profile_qualities (quality_profile_name, quality_name, quality_group_name, position, enabled, upgrade_until) VALUES ('1080p', 'Bluray-720p', NULL, 7, 0, 0);
INSERT INTO quality_profile_qualities (quality_profile_name, quality_name, quality_group_name, position, enabled, upgrade_until) VALUES ('1080p', 'WEBDL-720p', NULL, 8, 0, 0);
INSERT INTO quality_profile_qualities (quality_profile_name, quality_name, quality_group_name, position, enabled, upgrade_until) VALUES ('1080p', 'WEBRip-720p', NULL, 9, 0, 0);
INSERT INTO quality_profile_qualities (quality_profile_name, quality_name, quality_group_name, position, enabled, upgrade_until) VALUES ('1080p', 'HDTV-720p', NULL, 10, 0, 0);
INSERT INTO quality_profile_qualities (quality_profile_name, quality_name, quality_group_name, position, enabled, upgrade_until) VALUES ('1080p', 'Bluray-576p', NULL, 11, 0, 0);
INSERT INTO quality_profile_qualities (quality_profile_name, quality_name, quality_group_name, position, enabled, upgrade_until) VALUES ('1080p', 'Bluray-480p', NULL, 12, 0, 0);
INSERT INTO quality_profile_qualities (quality_profile_name, quality_name, quality_group_name, position, enabled, upgrade_until) VALUES ('1080p', 'WEBDL-480p', NULL, 13, 0, 0);
INSERT INTO quality_profile_qualities (quality_profile_name, quality_name, quality_group_name, position, enabled, upgrade_until) VALUES ('1080p', 'WEBRip-480p', NULL, 14, 0, 0);
INSERT INTO quality_profile_qualities (quality_profile_name, quality_name, quality_group_name, position, enabled, upgrade_until) VALUES ('1080p', 'HDTV-480p', NULL, 15, 0, 0);
INSERT INTO quality_profile_qualities (quality_profile_name, quality_name, quality_group_name, position, enabled, upgrade_until) VALUES ('1080p', 'DVD-R', NULL, 16, 0, 0);
INSERT INTO quality_profile_qualities (quality_profile_name, quality_name, quality_group_name, position, enabled, upgrade_until) VALUES ('1080p', 'DVD', NULL, 17, 0, 0);
INSERT INTO quality_profile_qualities (quality_profile_name, quality_name, quality_group_name, position, enabled, upgrade_until) VALUES ('1080p', 'SDTV', NULL, 18, 0, 0);
INSERT INTO quality_profile_qualities (quality_profile_name, quality_name, quality_group_name, position, enabled, upgrade_until) VALUES ('1080p', 'REGIONAL', NULL, 19, 0, 0);
INSERT INTO quality_profile_qualities (quality_profile_name, quality_name, quality_group_name, position, enabled, upgrade_until) VALUES ('1080p', 'DVDSCR', NULL, 20, 0, 0);
INSERT INTO quality_profile_qualities (quality_profile_name, quality_name, quality_group_name, position, enabled, upgrade_until) VALUES ('1080p', 'TELECINE', NULL, 21, 0, 0);
INSERT INTO quality_profile_qualities (quality_profile_name, quality_name, quality_group_name, position, enabled, upgrade_until) VALUES ('1080p', 'TELESYNC', NULL, 22, 0, 0);
INSERT INTO quality_profile_qualities (quality_profile_name, quality_name, quality_group_name, position, enabled, upgrade_until) VALUES ('1080p', 'CAM', NULL, 23, 0, 0);
INSERT INTO quality_profile_qualities (quality_profile_name, quality_name, quality_group_name, position, enabled, upgrade_until) VALUES ('1080p', 'WORKPRINT', NULL, 24, 0, 0);
INSERT INTO quality_profile_qualities (quality_profile_name, quality_name, quality_group_name, position, enabled, upgrade_until) VALUES ('1080p', 'Unknown', NULL, 25, 0, 0);
INSERT INTO quality_profile_qualities (quality_profile_name, quality_name, quality_group_name, position, enabled, upgrade_until) VALUES ('1080p', 'Raw-HD', NULL, 26, 0, 0);
INSERT INTO quality_profile_qualities (quality_profile_name, quality_name, quality_group_name, position, enabled, upgrade_until) VALUES ('1080p', 'BR-DISK', NULL, 27, 0, 0);

INSERT INTO quality_profile_languages (quality_profile_name, language_name, type) VALUES ('1080p', 'Any', 'simple');

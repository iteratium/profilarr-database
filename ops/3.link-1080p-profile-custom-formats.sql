-- Hand-written (not exported from the Profilarr UI): translation of v1
-- profiles/1080p.yml (main branch) `custom_formats` / `custom_formats_radarr`
-- / `custom_formats_sonarr` score lists into quality_profile_custom_formats.
--
-- This finishes the TODO left in 0.create-1080p-profile.sql, now that the
-- custom formats it references exist (2.create-1080p-release-group-custom-
-- formats.sql). v1's plain `custom_formats:` list (same score for both apps)
-- becomes arr_type = 'all'; the `custom_formats_radarr:` / `_sonarr:` lists
-- (different scores per app) become separate 'radarr' / 'sonarr' rows.

INSERT INTO quality_profile_custom_formats (quality_profile_name, custom_format_name, arr_type, score) VALUES ('1080p', '1080p TAoE', 'all', 120);
INSERT INTO quality_profile_custom_formats (quality_profile_name, custom_format_name, arr_type, score) VALUES ('1080p', '1080p Vyndros', 'all', 100);
INSERT INTO quality_profile_custom_formats (quality_profile_name, custom_format_name, arr_type, score) VALUES ('1080p', '1080p BiOMA', 'all', 75);
INSERT INTO quality_profile_custom_formats (quality_profile_name, custom_format_name, arr_type, score) VALUES ('1080p', '1080p YTS', 'all', 75);

INSERT INTO quality_profile_custom_formats (quality_profile_name, custom_format_name, arr_type, score) VALUES ('1080p', '1080p QXR', 'radarr', 150);
INSERT INTO quality_profile_custom_formats (quality_profile_name, custom_format_name, arr_type, score) VALUES ('1080p', '1080p Chivaman', 'radarr', 130);
INSERT INTO quality_profile_custom_formats (quality_profile_name, custom_format_name, arr_type, score) VALUES ('1080p', '1080p MeGusta', 'radarr', 90);
INSERT INTO quality_profile_custom_formats (quality_profile_name, custom_format_name, arr_type, score) VALUES ('1080p', '1080p PSA', 'radarr', 90);
INSERT INTO quality_profile_custom_formats (quality_profile_name, custom_format_name, arr_type, score) VALUES ('1080p', '1080p ELiTE', 'radarr', 75);
INSERT INTO quality_profile_custom_formats (quality_profile_name, custom_format_name, arr_type, score) VALUES ('1080p', '1080p Lootera', 'radarr', 75);

INSERT INTO quality_profile_custom_formats (quality_profile_name, custom_format_name, arr_type, score) VALUES ('1080p', '1080p Chivaman', 'sonarr', 150);
INSERT INTO quality_profile_custom_formats (quality_profile_name, custom_format_name, arr_type, score) VALUES ('1080p', '1080p ELiTE', 'sonarr', 150);
INSERT INTO quality_profile_custom_formats (quality_profile_name, custom_format_name, arr_type, score) VALUES ('1080p', '1080p MeGusta', 'sonarr', 120);
INSERT INTO quality_profile_custom_formats (quality_profile_name, custom_format_name, arr_type, score) VALUES ('1080p', '1080p Lootera', 'sonarr', 100);
INSERT INTO quality_profile_custom_formats (quality_profile_name, custom_format_name, arr_type, score) VALUES ('1080p', '1080p PSA', 'sonarr', 100);
INSERT INTO quality_profile_custom_formats (quality_profile_name, custom_format_name, arr_type, score) VALUES ('1080p', '1080p QXR', 'sonarr', 100);

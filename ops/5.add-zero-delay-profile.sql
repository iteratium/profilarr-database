-- @operation: export
-- @entity: batch
-- @name: add zero delay profile
-- @exportedAt: 2026-08-25T09:38:08.920Z
-- @opIds: 303

-- --- BEGIN op 303 ( create delay_profile "No-Delay" )
insert into "delay_profiles" ("name", "preferred_protocol", "usenet_delay", "torrent_delay", "bypass_if_highest_quality", "bypass_if_above_custom_format_score", "minimum_custom_format_score") values ('No-Delay', 'prefer_torrent', 0, 0, 1, 0, NULL);
-- --- END op 303

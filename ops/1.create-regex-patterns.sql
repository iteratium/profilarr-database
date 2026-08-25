-- Hand-written (not exported from the Profilarr UI): translation of v1
-- regex_patterns/*.yml (main branch) into the v2 schema.
--
-- v1 embedded per-pattern tests inline (e.g. AV1.yml's `tests:` list). v2 has
-- no test table for regular_expressions -- custom_format_tests only attaches
-- to custom_formats -- so those tests have no home at this stage and are
-- dropped; equivalent coverage can be re-added once a custom format
-- references these patterns.

insert into "regular_expressions" ("name", "pattern", "description", "regex101_id") values ('AV1', '\b(AV1)\b', 'AV1, or AOMedia Video 1, is a video coding format that compresses video files and streams while maintaining high quality.', NULL);

insert into "tags" ("name") values ('Codec') on conflict ("name") do nothing;

INSERT INTO regular_expression_tags (regular_expression_name, tag_name) VALUES ('AV1', 'Codec');

insert into "regular_expressions" ("name", "pattern", "description", "regex101_id") values ('BiOMA', '(?<=^|[\s.-])BiOMA\b', '', NULL);

insert into "tags" ("name") values ('Release Group') on conflict ("name") do nothing;
insert into "tags" ("name") values ('Release Title') on conflict ("name") do nothing;

INSERT INTO regular_expression_tags (regular_expression_name, tag_name) VALUES ('BiOMA', 'Release Group');
INSERT INTO regular_expression_tags (regular_expression_name, tag_name) VALUES ('BiOMA', 'Release Title');

insert into "regular_expressions" ("name", "pattern", "description", "regex101_id") values ('Chivaman', '(?<=^|[\s.-])Chivaman\b', '', NULL);

insert into "tags" ("name") values ('Release Group') on conflict ("name") do nothing;
insert into "tags" ("name") values ('Release Title') on conflict ("name") do nothing;
insert into "tags" ("name") values ('Bluray') on conflict ("name") do nothing;

INSERT INTO regular_expression_tags (regular_expression_name, tag_name) VALUES ('Chivaman', 'Release Group');
INSERT INTO regular_expression_tags (regular_expression_name, tag_name) VALUES ('Chivaman', 'Release Title');
INSERT INTO regular_expression_tags (regular_expression_name, tag_name) VALUES ('Chivaman', 'Bluray');

insert into "regular_expressions" ("name", "pattern", "description", "regex101_id") values ('ELiTE', '(?<=^|[\s.-])(ELiTE)\b', '', NULL);

insert into "tags" ("name") values ('Release Group') on conflict ("name") do nothing;
insert into "tags" ("name") values ('Release Title') on conflict ("name") do nothing;
insert into "tags" ("name") values ('HEVC') on conflict ("name") do nothing;

INSERT INTO regular_expression_tags (regular_expression_name, tag_name) VALUES ('ELiTE', 'Release Group');
INSERT INTO regular_expression_tags (regular_expression_name, tag_name) VALUES ('ELiTE', 'Release Title');
INSERT INTO regular_expression_tags (regular_expression_name, tag_name) VALUES ('ELiTE', 'HEVC');

insert into "regular_expressions" ("name", "pattern", "description", "regex101_id") values ('Lootera', '(?<=^|[\s.-])Lootera\b', '', NULL);

insert into "tags" ("name") values ('Release Group') on conflict ("name") do nothing;
insert into "tags" ("name") values ('Release Title') on conflict ("name") do nothing;
insert into "tags" ("name") values ('HEVC') on conflict ("name") do nothing;

INSERT INTO regular_expression_tags (regular_expression_name, tag_name) VALUES ('Lootera', 'Release Group');
INSERT INTO regular_expression_tags (regular_expression_name, tag_name) VALUES ('Lootera', 'Release Title');
INSERT INTO regular_expression_tags (regular_expression_name, tag_name) VALUES ('Lootera', 'HEVC');

insert into "regular_expressions" ("name", "pattern", "description", "regex101_id") values ('MeGusta', '(?<=^|[\s.-])MeGusta\b', '', NULL);

insert into "tags" ("name") values ('Release Group') on conflict ("name") do nothing;
insert into "tags" ("name") values ('Release Title') on conflict ("name") do nothing;
insert into "tags" ("name") values ('WEB-DL') on conflict ("name") do nothing;

INSERT INTO regular_expression_tags (regular_expression_name, tag_name) VALUES ('MeGusta', 'Release Group');
INSERT INTO regular_expression_tags (regular_expression_name, tag_name) VALUES ('MeGusta', 'Release Title');
INSERT INTO regular_expression_tags (regular_expression_name, tag_name) VALUES ('MeGusta', 'WEB-DL');

insert into "regular_expressions" ("name", "pattern", "description", "regex101_id") values ('PSA', '(?<=^|[\s.-])PSA\b', '', NULL);

insert into "tags" ("name") values ('Release Group') on conflict ("name") do nothing;
insert into "tags" ("name") values ('Release Title') on conflict ("name") do nothing;
insert into "tags" ("name") values ('WEB-DL') on conflict ("name") do nothing;

INSERT INTO regular_expression_tags (regular_expression_name, tag_name) VALUES ('PSA', 'Release Group');
INSERT INTO regular_expression_tags (regular_expression_name, tag_name) VALUES ('PSA', 'Release Title');
INSERT INTO regular_expression_tags (regular_expression_name, tag_name) VALUES ('PSA', 'WEB-DL');

insert into "regular_expressions" ("name", "pattern", "description", "regex101_id") values ('QxR', '(?<=^|[\s.-])(QxR|afm72|Bandi|Celdra|FreetheFish|Garshasp|Ghost|Ime|Kappa|Langbard|LION|Panda|MONOLITH|Natty|r00t|RCVR|RZeroX|SAMPA|Silence|t3nzin|Tigole|YOGI)\b', '', NULL);

insert into "tags" ("name") values ('Release Group') on conflict ("name") do nothing;
insert into "tags" ("name") values ('Release Title') on conflict ("name") do nothing;
insert into "tags" ("name") values ('HEVC') on conflict ("name") do nothing;

INSERT INTO regular_expression_tags (regular_expression_name, tag_name) VALUES ('QxR', 'Release Group');
INSERT INTO regular_expression_tags (regular_expression_name, tag_name) VALUES ('QxR', 'Release Title');
INSERT INTO regular_expression_tags (regular_expression_name, tag_name) VALUES ('QxR', 'HEVC');

insert into "regular_expressions" ("name", "pattern", "description", "regex101_id") values ('TAoE', '(?<=^|[\s.-])(TAoE|Ainz|AJJMIN|ANONAZ|ArcX|bccornfo|DNU|DrainedDay|DUHIT|Erie|Frys|Goki|HxD|jb2049|JBENT|Nostradamus|r0b0t|Species180|TheSickle|xtrem3x|WEM)\b', '', NULL);

insert into "tags" ("name") values ('Release Group') on conflict ("name") do nothing;
insert into "tags" ("name") values ('Release Title') on conflict ("name") do nothing;
insert into "tags" ("name") values ('HEVC') on conflict ("name") do nothing;

INSERT INTO regular_expression_tags (regular_expression_name, tag_name) VALUES ('TAoE', 'Release Group');
INSERT INTO regular_expression_tags (regular_expression_name, tag_name) VALUES ('TAoE', 'Release Title');
INSERT INTO regular_expression_tags (regular_expression_name, tag_name) VALUES ('TAoE', 'HEVC');

insert into "regular_expressions" ("name", "pattern", "description", "regex101_id") values ('Vyndros', '(?<=^|[\s.-])Vyndros\b', '', NULL);

insert into "tags" ("name") values ('Release Group') on conflict ("name") do nothing;
insert into "tags" ("name") values ('Release Title') on conflict ("name") do nothing;
insert into "tags" ("name") values ('HEVC') on conflict ("name") do nothing;

INSERT INTO regular_expression_tags (regular_expression_name, tag_name) VALUES ('Vyndros', 'Release Group');
INSERT INTO regular_expression_tags (regular_expression_name, tag_name) VALUES ('Vyndros', 'Release Title');
INSERT INTO regular_expression_tags (regular_expression_name, tag_name) VALUES ('Vyndros', 'HEVC');

insert into "regular_expressions" ("name", "pattern", "description", "regex101_id") values ('YTS', '(?<=^|[\s.-])YTS(.(MX|LT|AG))?\b', 'Matches "YTS" when preceded by whitespace, a hyphen or dot', NULL);

insert into "tags" ("name") values ('Release Group') on conflict ("name") do nothing;
insert into "tags" ("name") values ('Release Title') on conflict ("name") do nothing;
insert into "tags" ("name") values ('Bluray') on conflict ("name") do nothing;

INSERT INTO regular_expression_tags (regular_expression_name, tag_name) VALUES ('YTS', 'Release Group');
INSERT INTO regular_expression_tags (regular_expression_name, tag_name) VALUES ('YTS', 'Release Title');
INSERT INTO regular_expression_tags (regular_expression_name, tag_name) VALUES ('YTS', 'Bluray');

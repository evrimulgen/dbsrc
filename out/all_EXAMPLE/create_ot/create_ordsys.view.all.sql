-- [dbsrc POST-PROCESSED]:
-- (17) Handle sqlplus limitation by injecting newlines after commas in
--      view column specs (SP2-0027: Input is too long (> 2499 characters)
--      - line ignored).
CREATE OR REPLACE FORCE NONEDITIONABLE VIEW "ORDSYS"."SI_IMAGE_FORMATS" ("SI_FORMAT") AS
  SELECT SI_FORMAT
  FROM ORDSYS.SI_image_formats_tab
  where read_flg = 'Y';

-- [dbsrc POST-PROCESSED]:
-- (17) Handle sqlplus limitation by injecting newlines after commas in
--      view column specs (SP2-0027: Input is too long (> 2499 characters)
--      - line ignored).
CREATE OR REPLACE FORCE NONEDITIONABLE VIEW "ORDSYS"."SI_IMAGE_FORMAT_CONVERSIONS" ("SI_SOURCE_FORMAT",
"SI_TARGET_FORMAT") AS
  SELECT a.SI_format SI_source_format, b.si_format SI_target_format
  FROM ORDSYS.SI_image_formats_tab a , ORDSYS.SI_image_formats_tab b
  where a.read_flg = 'Y'
  and b.write_flg = 'Y'
  and a.si_format <> b.si_format;

-- [dbsrc POST-PROCESSED]:
-- (17) Handle sqlplus limitation by injecting newlines after commas in
--      view column specs (SP2-0027: Input is too long (> 2499 characters)
--      - line ignored).
CREATE OR REPLACE FORCE NONEDITIONABLE VIEW "ORDSYS"."SI_THUMBNAIL_FORMATS" ("SI_FORMAT") AS
  SELECT a.SI_format
  from ORDSYS.si_image_formats_tab a
  where a.write_flg = 'Y';

-- [dbsrc POST-PROCESSED]:
-- (17) Handle sqlplus limitation by injecting newlines after commas in
--      view column specs (SP2-0027: Input is too long (> 2499 characters)
--      - line ignored).
CREATE OR REPLACE FORCE NONEDITIONABLE VIEW "ORDSYS"."SI_IMAGE_FORMAT_FEATURES" ("SI_FORMAT",
"SI_FEATURE_NAME") AS
  SELECT a.si_format, b.si_feature_name
  from ORDSYS.si_image_formats_tab a, ORDSYS.si_features_tab b
  where a.read_flg = 'Y';

-- [dbsrc POST-PROCESSED]:
-- (16) Handle sqlplus limitation by injecting newlines after commas
--      between double-quotes in "select *" view bodies (SP2-0027:
--      Input is too long (> 2499 characters) - line ignored).
-- (17) Handle sqlplus limitation by injecting newlines after commas in
--      view column specs (SP2-0027: Input is too long (> 2499 characters)
--      - line ignored).
CREATE OR REPLACE FORCE NONEDITIONABLE VIEW "ORDSYS"."SI_VALUES" ("SI_VALUE",
"SI_SUPPORTED_VALUE") AS
  select SI_value, SI_supported_Value
  from ordsys.SI_Values_tab;


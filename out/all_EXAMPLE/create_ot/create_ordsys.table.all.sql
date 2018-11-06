CREATE TABLE "ORDSYS"."ORD_USAGE_RECS"
   (	"USERNAME" VARCHAR2(30),
	"AUX_COUNT" NUMBER,
	"COMPONENT_NAME" VARCHAR2(200)
   ) ;

CREATE TABLE "ORDSYS"."SI_IMAGE_FORMATS_TAB"
   (	"SI_FORMAT" VARCHAR2(1400),
	"READ_FLG" VARCHAR2(1),
	"WRITE_FLG" VARCHAR2(1),
	"SI_FORMAT_DSC" VARCHAR2(255)
   ) ;

CREATE TABLE "ORDSYS"."SI_FEATURES_TAB"
   (	"SI_FEATURE_NAME" VARCHAR2(100)
   ) ;

CREATE TABLE "ORDSYS"."SI_VALUES_TAB"
   (	"SI_VALUE" VARCHAR2(255),
	"SI_SUPPORTED_VALUE" NUMBER(*,0)
   ) ;

CREATE TABLE "ORDSYS"."ORD_CARTRIDGE_COMPONENTS"
   (	"SHORT_NAME" VARCHAR2(30),
	"OWNER" VARCHAR2(30),
	"COMPONENT_NAME" VARCHAR2(200),
	"COMPONENT_TYPE" VARCHAR2(30),
	"STATUS" VARCHAR2(10),
	"DESCRIPTION" VARCHAR2(2000)
   ) ;


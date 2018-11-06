CREATE TABLE "PM"."PRINT_MEDIA"
   (	"PRODUCT_ID" NUMBER(6,0),
	"AD_ID" NUMBER(6,0),
	"AD_COMPOSITE" BLOB,
	"AD_SOURCETEXT" CLOB,
	"AD_FINALTEXT" CLOB,
	"AD_FLTEXTN" NCLOB,
	"AD_TEXTDOCS_NTAB" "PM"."TEXTDOC_TAB" ,
	"AD_PHOTO" BLOB,
	"AD_GRAPHIC" BFILE,
	"AD_HEADER" "PM"."ADHEADER_TYP"
   )
 NESTED TABLE "AD_TEXTDOCS_NTAB" STORE AS "TEXTDOCS_NESTEDTAB"
 RETURN AS VALUE;

CREATE TABLE "PM"."ONLINE_MEDIA"
   (	"PRODUCT_ID" NUMBER(6,0),
	"PRODUCT_PHOTO" "ORDSYS"."ORDIMAGE" ,
	"PRODUCT_PHOTO_SIGNATURE" "ORDSYS"."ORDIMAGESIGNATURE" ,
	"PRODUCT_THUMBNAIL" "ORDSYS"."ORDIMAGE" ,
	"PRODUCT_VIDEO" "ORDSYS"."ORDVIDEO" ,
	"PRODUCT_AUDIO" "ORDSYS"."ORDAUDIO" ,
	"PRODUCT_TEXT" CLOB,
	"PRODUCT_TESTIMONIALS" "ORDSYS"."ORDDOC"
   ) ;

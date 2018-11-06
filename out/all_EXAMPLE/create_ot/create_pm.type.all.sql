CREATE OR REPLACE EDITIONABLE TYPE "PM"."ADHEADER_TYP"

  AS OBJECT
    ( header_name        VARCHAR2(256)
    , creation_date      DATE
    , header_text        VARCHAR2(1024)
    , logo               BLOB
    );
/

CREATE OR REPLACE EDITIONABLE TYPE "PM"."TEXTDOC_TYP"

  AS OBJECT
    ( document_typ      VARCHAR2(32)
    , formatted_doc     BLOB
    ) ;
/

CREATE OR REPLACE EDITIONABLE TYPE "PM"."TEXTDOC_TAB"

  AS TABLE OF textdoc_typ;
/


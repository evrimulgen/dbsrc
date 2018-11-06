CREATE OR REPLACE EDITIONABLE TYPE BODY "OE"."LEAF_CATEGORY_TYP" AS
    OVERRIDING MEMBER FUNCTION  category_describe RETURN VARCHAR2 IS
    BEGIN
       RETURN  'leaf_category_typ';
    END;
   END;
/

CREATE OR REPLACE EDITIONABLE TYPE BODY "OE"."COMPOSITE_CATEGORY_TYP" AS
    OVERRIDING MEMBER FUNCTION category_describe RETURN VARCHAR2 IS
    BEGIN
      RETURN 'composite_category_typ';
    END;
   END;
/

CREATE OR REPLACE EDITIONABLE TYPE BODY "OE"."CATALOG_TYP" AS
  OVERRIDING MEMBER FUNCTION category_describe RETURN varchar2 IS
  BEGIN
    RETURN 'catalog_typ';
  END;
  MEMBER FUNCTION getCatalogName RETURN varchar2 IS
  BEGIN
    -- Return the category name from the supertype
    RETURN self.category_name;
  END;
END;
/

CREATE OR REPLACE EDITIONABLE TYPE BODY "OE"."LEAF_CATEGORY_TYP" AS
    OVERRIDING MEMBER FUNCTION  category_describe RETURN VARCHAR2 IS
    BEGIN
       RETURN  'leaf_category_typ';
    END;
   END;
/

CREATE OR REPLACE EDITIONABLE TYPE BODY "OE"."COMPOSITE_CATEGORY_TYP" AS
    OVERRIDING MEMBER FUNCTION category_describe RETURN VARCHAR2 IS
    BEGIN
      RETURN 'composite_category_typ';
    END;
   END;
/

CREATE OR REPLACE EDITIONABLE TYPE BODY "OE"."CATALOG_TYP" AS
  OVERRIDING MEMBER FUNCTION category_describe RETURN varchar2 IS
  BEGIN
    RETURN 'catalog_typ';
  END;
  MEMBER FUNCTION getCatalogName RETURN varchar2 IS
  BEGIN
    -- Return the category name from the supertype
    RETURN self.category_name;
  END;
END;
/


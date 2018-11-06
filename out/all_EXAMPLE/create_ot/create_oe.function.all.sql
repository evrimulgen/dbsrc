CREATE OR REPLACE EDITIONABLE FUNCTION "OE"."GET_PHONE_NUMBER_F"
  (p_in INTEGER, p_phonelist phone_list_typ)
RETURN VARCHAR2 AS
  TYPE phone_list IS VARRAY(5) OF VARCHAR2(25);
  phone_out varchar2(25) := null;
  v_size INTEGER;
BEGIN
    IF p_phonelist.FIRST IS NULL OR
       p_in > (p_phonelist.LAST + 1) - p_phonelist.FIRST THEN
      RETURN phone_out;
    ELSE
      phone_out := p_phonelist(p_in);
      RETURN phone_out;
    END IF;
END;
/


ALTER FUNCTION "OE"."GET_PHONE_NUMBER_F"
  COMPILE
    PLSQL_OPTIMIZE_LEVEL=  2
    PLSQL_CODE_TYPE=  INTERPRETED
    PLSQL_DEBUG=  FALSE    PLSCOPE_SETTINGS=  'IDENTIFIERS:NONE'

 REUSE SETTINGS TIMESTAMP '2018-10-12 12:12:35'
/


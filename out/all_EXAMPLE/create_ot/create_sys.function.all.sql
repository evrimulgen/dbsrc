CREATE OR REPLACE NONEDITIONABLE FUNCTION "SYS"."ORA12C_STRONG_VERIFY_FUNCTION"
(username varchar2,
 password varchar2,
 old_password varchar2)
return boolean IS
   differ integer;
begin
   if not ora_complexity_check(password, chars => 9, upper => 2, lower => 2,
                           digit => 2, special => 2) then
      return(false);
   end if;

   -- Check if the password differs from the previous password by at least
   -- 4 characters
   if old_password is not null then
      differ := ora_string_distance(old_password, password);
      if differ < 4 then
         raise_application_error(-20032, 'Password should differ from previous '
                                 || 'password by at least 4 characters');
      end if;
   end if;

   return(true);
end;
/

CREATE OR REPLACE NONEDITIONABLE FUNCTION "SYS"."AQ$_GET_SUBSCRIBERS" (
  queue_schema   IN  VARCHAR2,
  queue_name     IN  VARCHAR2,
  queue_table    IN  VARCHAR2,
  deq_user       IN  VARCHAR2,
  queue_id       IN  BINARY_INTEGER,
  qtab_flags     IN  BINARY_INTEGER) RETURN sys.aq$_subscriber_t PIPELINED IS

  sub80          aq$_subscribers;
  sel_txt        VARCHAR2(1000);
  type rt is	 REF CURSOR;
  sqlrc		 rt;		  	 	-- ref cursor for sql statement
  sub_name       VARCHAR2(30);
  sub_addr       VARCHAR2(1024);
  sub_proto      NUMBER;
  sub_trans      VARCHAR2(65);
  sub_trans_sch  VARCHAR2(30);
  sub_trans_nm   VARCHAR2(30);
  sub_type       NUMBER;
  sub_rule       VARCHAR2(30); /*bug 648822: add rule_name for the subscriber*/
  sub_id         NUMBER;
  sub_bpos       NUMBER;
BEGIN
  IF bitand(qtab_flags, 8) = 0 and bitand(qtab_flags, 67108864) = 0 THEN
    -- 8.0 style queue, return all subscribers in aq$_queues
    select subscribers INTO sub80 FROM system.aq$_queues
    where  eventid = queue_id;

    IF sub80 IS NOT NULL and sub80.count > 0 THEN
      FOR i IN sub80.first .. sub80.last LOOP
       PIPE ROW (aq$_subscriber(sub80(i).name, sub80(i).address,
                 sub80(i).protocol, null, 65, null, null, null));
      END LOOP;
    END  IF;
  ElSIF bitand(qtab_flags, 4096) = 4096 and deq_user IS NOT NULL THEN
    -- 8.1 style secure queue, join with agent mapping table
    sel_txt := 'select qs.name, qs.address, qs.protocol, qs.trans_name, '
               || ' qs.subscriber_type,  qs.rule_name from '
               || 'dba_aq_agent_privs dp, '
               || dbms_assert.enquote_name('"'||queue_schema||'"') || '.'
               || dbms_assert.enquote_name('"AQ$_' || queue_table || '_S"')
               || ' qs where dp.db_username = :1 and ' ||
               'dp.agent_name = qs.name and bitand(qs.subscriber_type, 1)=1'
               || ' and qs.queue_name = :2';
    OPEN sqlrc FOR sel_txt using deq_user, queue_name;
    LOOP
      FETCH sqlrc INTO sub_name, sub_addr, sub_proto,sub_trans, sub_type, sub_rule;
      EXIT WHEN sqlrc%NOTFOUND;
      PIPE ROW (aq$_subscriber(sub_name, sub_addr, sub_proto, sub_trans,
                               sub_type, sub_rule, null, null));
    END LOOP;

  ELSIF bitand(qtab_flags, 67108864) = 67108864 THEN
    -- 12c style sharded queue
    sel_txt := 'select name, address, protocol, trans_owner,' ||
               'trans_name , subscriber_type, ' ||
               'rule_name, subscriber_id, pos_bitmap ' ||
               'from SYS.AQ$_DURABLE_SUBS s ' ||
               'WHERE queue_id = :1 and '||
               'bitand(s.subscriber_type, 1)=1';
    OPEN sqlrc FOR sel_txt using queue_id;
    LOOP
      FETCH sqlrc INTO sub_name, sub_addr, sub_proto, sub_trans_sch,
                       sub_trans_nm,  sub_type, sub_rule, sub_id, sub_bpos;
      if sub_trans_sch is not null then
        sub_trans := dbms_assert.enquote_name(sub_trans_sch, FALSE) ||'.' ||
                     dbms_assert.enquote_name(sub_trans_nm, FALSE);
      end if;
      EXIT WHEN sqlrc%NOTFOUND;
      PIPE ROW (aq$_subscriber(sub_name, sub_addr, sub_proto,
                               sub_trans, sub_type,
                               sub_rule, sub_id, sub_bpos));
    END LOOP;
  ELSE
    -- 8.1 style normal queue, return all subscribers
    sel_txt := 'select name, address, protocol, trans_name, ' ||
               'subscriber_type, rule_name from ' ||
               dbms_assert.enquote_name('"'||queue_schema||'"') || '.' ||
               dbms_assert.enquote_name('"AQ$_' || queue_table || '_S"') ||
               ' where ' ||
               'bitand(subscriber_type, 1)=1 and queue_name = :1';
    OPEN sqlrc FOR sel_txt using queue_name;
    LOOP
      FETCH sqlrc INTO sub_name, sub_addr, sub_proto, sub_trans, sub_type, sub_rule;
      EXIT WHEN sqlrc%NOTFOUND;
      PIPE ROW (aq$_subscriber(sub_name, sub_addr, sub_proto, sub_trans,
                               sub_type, sub_rule, null, null));
    END LOOP;
  END IF;
  RETURN;
END;
/

CREATE OR REPLACE NONEDITIONABLE FUNCTION "SYS"."CHECK_UPGRADE" wrapped
a000000
1
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
8
257 1b6
zDWDG0+FJ5JoLcmAxvqLjWZsmMcwgzIJ+txqfC9DbmR1HQmjPuZEy1qi6cBu+mZsnwjTU5Nc
522prOynu8aT7OmsrTFOyYvtQp8aiFw+F2m8K0OYrT+disSulOfDo3znV3LIfMol+8j+iD3m
wPtMfJBbFs8SJ2fpiad8ojU2LuNTo3Fkp7yV63VSN+8i37Uf3KlSl26ICM2rFcqc1MnRzjlY
KZuyr8iaL6hSf9Iwj+ZMEMND+/xqM7jY7kK1gb0kwSDaEpqNlFMZtHFoVhdq5l8JQECbWcF+
e9IlHuozDlW4cVLl8yz3JyrM60Lz8JTzxewEryxdGue5cETFNYshYHQNkJ5eyFmGT6ODKYXm
2VDFq9qC0S149hvoXuskGato1MOF61QvAkjVaxBMVxDnbCHcoaOgxmbxoZmjhST4RHs8p2I=

/

CREATE OR REPLACE NONEDITIONABLE FUNCTION "SYS"."CLIENT_IP_ADDRESS"
return varchar2 is
begin
return dbms_standard.client_ip_address;
end;
/

CREATE OR REPLACE NONEDITIONABLE FUNCTION "SYS"."CUBE_TABLE" wrapped
a000000
1
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
8
7f a2
QzUf5JyTzy3etZxTULoHHpFaVQgwg0wYf8upynSmkELpgEx2cZCew3msAmd/OJu1nXxgho9i
nHFIJgaJjKkKp9zp/U14pcB4zmqbzt2K30frpc1YoMk3JZfjJXrFbwkL00meVl1rb6eU4N3b
Ep6w/1VExmt2zw==
/

CREATE OR REPLACE NONEDITIONABLE FUNCTION "SYS"."DATABASE_NAME" return varchar2 is
begin
return dbms_standard.database_name;
end;
/

CREATE OR REPLACE NONEDITIONABLE FUNCTION "SYS"."DBJ_LONG_NAME" (shortname VARCHAR2) RETURN VARCHAR2
as language java name
    'oracle.aurora.rdbms.DbmsJava.longNameForSQL(java.lang.String)
          return java.lang.String';
/

CREATE OR REPLACE NONEDITIONABLE FUNCTION "SYS"."DBJ_SHORT_NAME" (longname VARCHAR2)
  return VARCHAR2 as
begin
  return dbms_java.shortname(longname);
end dbj_short_name;
/

CREATE OR REPLACE NONEDITIONABLE FUNCTION "SYS"."DES_ENCRYPTED_PASSWORD" (user varchar2 default NULL)
return varchar2 is
begin
return dbms_standard.des_encrypted_password(user);
end;
/

CREATE OR REPLACE NONEDITIONABLE FUNCTION "SYS"."DICTIONARY_OBJ_NAME" return varchar2 is
begin
return dbms_standard.dictionary_obj_name;
end;
/

CREATE OR REPLACE NONEDITIONABLE FUNCTION "SYS"."DICTIONARY_OBJ_NAME_LIST"
(object_list out ora_name_list_t)
return binary_integer is
begin
return dbms_standard.dictionary_obj_name_list(object_list);
end;
/

CREATE OR REPLACE NONEDITIONABLE FUNCTION "SYS"."DICTIONARY_OBJ_OWNER" return varchar2 is
begin
return dbms_standard.dictionary_obj_owner;
end;
/

CREATE OR REPLACE NONEDITIONABLE FUNCTION "SYS"."DICTIONARY_OBJ_OWNER_LIST"
(owner_list out ora_name_list_t)
return binary_integer is
begin
return dbms_standard.dictionary_obj_owner_list(owner_list);
end;
/

CREATE OR REPLACE NONEDITIONABLE FUNCTION "SYS"."DICTIONARY_OBJ_TYPE" return varchar2 is
begin
return dbms_standard.dictionary_obj_type;
end;
/

CREATE OR REPLACE NONEDITIONABLE FUNCTION "SYS"."DM_CL_APPLY" wrapped
a000000
1
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
8
124 11b
yWmM554gboEn36sgtQ6stmT8BKYwg3nQAPZqZ3RA2sHqEaBr9X2DobxeCzdWDzJF5hvM7H8C
2Dr+vnsaaeNvEO0jMIEZIa1knsZPziKVsTrPRd1LHVQ8WdMYma8AVMTS9KfJoLHB4hUJXS+I
pO8qCgpz9E7ToT8HlkhNKq7tdJrwcF3XoLu3j6P7E3JuayDwd4xcwv8uJeW3AI+uWwTFECEl
oq9CigasQGZVYj7c5oS7kMSwHEFyVMGqdAR4nh/TK5dQxR75ycicmzP1RI8iWUM=
/

CREATE OR REPLACE NONEDITIONABLE FUNCTION "SYS"."DM_CL_BUILD" wrapped
a000000
1
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
8
111 103
MfvzZq25Z4vM1kwZGyF7WaRa1Egwg0zwLpkVfHRAAP7qXU3KZocAAXmLnnnfJXf2Nb/zi7O1
IMHGL8ehWkHBLhMx5buI1BK+3EObUy7v2LJniqQCFQS9vEM6Pf8WYYStftVjrEFthJXgAxqH
b7SV4Go0aFxAt/b8VPWf0yYjImOqhrE6fG0LfzaS6ZwGdhMjUnfgy54SA3/m7AL27LIuT6YD
nxk119PgYq33da8ojnq31m78T3gehrhxAPs4BIQQ
/

CREATE OR REPLACE NONEDITIONABLE FUNCTION "SYS"."DM_FE_BUILD" wrapped
a000000
1
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
8
b6 d2
OJfOY/rRgJp6c9BliHwqrOGo2aAwg0zZLZ7hf3Q5cMEi6WBECERu/Co9qZynFKRu4cAc53uS
+SvcH7U+5Dr5aDB8xXTr68ETDw/+xjYepnDT9ADpbSIhs2albYd3RE4lSNpcIe8i/CQ2WowX
5HeYZCmwurSmNjX2FUyReo4CtIqivZIPyNcTUUbylHLbdQ7emtGn1EUP7ftGPXyA
/

CREATE OR REPLACE NONEDITIONABLE FUNCTION "SYS"."DM_GLM_BUILD" wrapped
a000000
1
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
8
10a fb
YMDoljkj4RCe9tPr2wTDuT9pof4wg3nwr54VZ3SiAP7VwMMvqt3rgy7EN7lhkQPjsKnnZqCA
tZrDBdYGdvF8NFghbD3mEKwFGv5SJR5Ofxlwuvui8oms39VwUf6gbATI/jm92vL8kFc7mcFB
OFy8kQF+IrlfyY4tFeSZ4c5Na20DqlTK2lyLUIg+oJtJTlUPzabFYD5u2NeX3BA56hpsKGB8
G7Px9wo3OYoWawfxzXLhXnZKEx8igqJd
/

CREATE OR REPLACE NONEDITIONABLE FUNCTION "SYS"."DM_MOD_BUILD" wrapped
a000000
1
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
8
114 113
dxCKEWPDx7TCung5IhTpWf+2slMwg0xKrycdNedAEhmwpbRnPqCxQYpKE+cDucOQ5q7mtAwO
qLA0qheDkSiUorNytb/lZXuW4R6t/5wqSrHr/p7QHd00FJeoV7Zo1kPEz1FKW3exsGC+ZgwU
9V8t5WJFzDMBayFzLtonXf/CxLJoUCGAxxK7bcH9PYOlP1zCEF3dFaW1sm+wAD4U7EvJB5wi
dp9ijTTlITHiRQRwgR1JEezyBszw9RZxFgNprCfXuzlOcRkcP6YZFOlU
/

CREATE OR REPLACE NONEDITIONABLE FUNCTION "SYS"."DM_NMF_BUILD" wrapped
a000000
1
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
8
11d 113
63uQ0dD2ugRVKnPYrWJFVXqXvDowg3lKNfbhNXQCALtkhS2s580NsFO3Pd1Zn+z6MLKFZuc9
E7Waky0SyDnmFYYSlojl0tSM3fWBBYGKsPhDv6zQy8rwN1GZG6yd4EJK7yeqZ3ODIZeOk3oO
a/5c2U2ZlPEMq8kyBco+OLErxDHDhV8BD2/ZqugfoHXAViSzf4I0tWrgoEkCZx08EaWtbVVF
DfFcjaeD5r8L+9ifj6ZiXqFH9qjNZRcYVo4Op5+7RMeXmgpbEwWA0g==
/

CREATE OR REPLACE NONEDITIONABLE FUNCTION "SYS"."DM_SVM_APPLY" wrapped
a000000
1
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
8
189 158
n/Zn2ExJiibNunotqpUJC744Vmgwg3nIrgw2f3SVALuwhVJvbwhys17J7FX0oFjs3x0SxayA
H282ryAgn1Tp6sfe/Rm7Qyq6t2ubFKXAESC7BzPPerw/Z8ThWl4OtDa2r+otVsZfe19Nv/3q
OP9SmuErftbeWNK6dgnVx3syZApRiVD4DT220uOC30d0uN7XCd6AnjdhES0V19QT3DZeU02C
qKeSLN3Ncyey8j3Dejdb3Samo6StqXLq8YPYyEXBLzvDgLU/a5qE6n36WjkndjzR/00EjJZG
NvhakJ3Vlm34HywtX516cO1TuOiF5vvYS4r/va1DBwquV5g4Mw==
/

CREATE OR REPLACE NONEDITIONABLE FUNCTION "SYS"."DM_SVM_BUILD" wrapped
a000000
1
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
8
166 130
ptLHmAyAUbBPrOQsDlfSuFIBn+cwg3lKLm0VZ3RA/mgP94yZ2WaH/omfCfD1JfH60qsvlqxB
oqqdXupMjbJ0vWpOP6CTq4aHcBKlhjqPE+tInQKTRC/4Z5CZYKz4S3Gx44PYaR8PtpUVwtIz
SE6ALQRioUmFjpN6Dmt4k15kKMYvAPBSknPRyBppnOt502xl1TwpTJtmRTUozNbJGrOyHko/
2bVeI/Dve8vkXTqjq+ENddrWrWeBk0HxAY3xcaweIvvJulKp8QoUi633Kx0ody1pqW7ysP1H
Us46U6YIdJOE
/

CREATE OR REPLACE NONEDITIONABLE FUNCTION "SYS"."GETLONG" ( opcode  in number,
                                    p_rowid in rowid ) return varchar2
as
    l_cursor    integer default dbms_sql.open_cursor;
    l_n         number;
    l_long_val  varchar2(4000);
    l_long_len  number;
    l_buflen    number := 4000;
    l_curpos    number := 0;
begin
    if (opcode = 1) then
      dbms_sql.parse( l_cursor,
              'select t.TEXT from SYS.VIEW$ t where t.rowid = :x',
              dbms_sql.native );
      dbms_sql.bind_variable( l_cursor, ':x', p_rowid );

      dbms_sql.define_column_long(l_cursor, 1);
      l_n := dbms_sql.execute(l_cursor);

      if (dbms_sql.fetch_rows(l_cursor)>0) then
        dbms_sql.column_value_long(l_cursor, 1, l_buflen, l_curpos ,
                                   l_long_val, l_long_len );
      end if;
      dbms_sql.close_cursor(l_cursor);
    elsif (opcode = 2) then
      dbms_sql.parse( l_cursor,
              'select t.CONDITION from SYS.CDEF$ t where t.rowid = :x',
              dbms_sql.native );
      dbms_sql.bind_variable( l_cursor, ':x', p_rowid );

      dbms_sql.define_column_long(l_cursor, 1);
      l_n := dbms_sql.execute(l_cursor);

      if (dbms_sql.fetch_rows(l_cursor)>0) then
        dbms_sql.column_value_long(l_cursor, 1, l_buflen, l_curpos ,
                                   l_long_val, l_long_len );
      end if;
      dbms_sql.close_cursor(l_cursor);
    else
      l_long_val := '';
    end if;

    return l_long_val;
end getlong;
/

CREATE OR REPLACE NONEDITIONABLE FUNCTION "SYS"."GETTVOID" (type_oid IN RAW, vsn IN PLS_INTEGER) return
                    RAW AS
 tv_oid RAW(16);
begin
 select tvoid into tv_oid from type$ where toid = type_oid and
   version# = vsn;
 return (tv_oid);
end;
/

CREATE OR REPLACE NONEDITIONABLE FUNCTION "SYS"."GETXMLSCHEMADEPENDENCYLIST" wrapped
a000000
1
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
8
abc 52a
S/ItjrRYrgsYghqnKB6lWJ7RhzowgzsrBUiG3y/NA53gM2vIRiqsorp+qQTRyl71VmdmTBiD
266seCv9HUqkhRnJH4XGvzADFLqhN5/0cVr/AoIX/3QhYgT3vRel6jJTciXk7i0jo9Q9xw1M
XAUHLCkjqqXHZYahdL0d81WyN5p/xXcpDBSFVtM4fKamNQGoBMiJrsro8RhWOKHRtmXjwImM
1ojtgAAXXQecnK9aoYmYL2wIFNnZFCu/FIs2dyW5SNTdGCEyrEuuaePD/SH5ZDuqvnVeYvpv
bD6i/38zdmqQrK0+kH44Qfb1d3nRgjGB9H/9sH+QEx9yQYLxNGw6joeqvDxlOZ8tZhPKQAS1
jWGh4BXBmam9wT7wBBmujCGw8qc/oQXfjK9GGRvYr7IyTuk/a69tm26eQjeBUZPDwhaMvDwl
0ElepXNhq4bPSPb9FlqOifvKerwyzbnhyIKXZ1wxjTGv3Iib4Hsnnl/uyqEUxnMT0KRqoT6Y
jYKadTmlOHRP5k60EiDuPDipnP6JjvHm8QEh3GZoQvgnXgB2cGQmcT8KeKUX7RKsPbEBOnPe
Xuz4ADCmZGQdfUwcNHorMkPP2Op8QMb8+Djqlg/kEwqmpwWUiodhXPCsE1ADSNMbvsng90mK
PObg/Rt2MTC9kApA2rzPsEtDdaCFE3fNe4BnsGQ3lTlTyqzgl/HJx9FmLaVcEnQ1GKyr0XsA
IrBH59DqzrpRMs9J096gul2VxeUhhw/zvbs2UutvTe6ph+5fVCA96CPR/XcHSyb54t997o7J
rrHvQaJs3G4lwpRP1NIW720imbQsp4H7hzwHxp84xqMfRZd5g8wzgK9sYl5ZCaImln168OeB
f5ioMFNHD3KE8U+tm484xFXljp35ptT6rBqOQR6B4iKhlDLGUK3FP9IaUsmKV3etMwS5/JSe
fHTwJhdTNuXYI58uLfZck4oQGNeLdlkmFII7GjHexXrDCwFdw30QZrKyzM3q1EOJH1YiGFyw
g0L+NU5mV+7ebSorci+AcwPCzIzX0rRA0Oo7mMmwHAvnhSBP1gNIUGXRVVN66s6c/+e6O7MX
x4rxpe3f3rqDvvC9Psak3oKIEsKKuRMOs1htd6CbzPUMY5Cn8i907p6qRQh2MjLYn29U77o5
C8HLjP7WfH9GIDnzORe5JDOiPchq8C3RlNG66kkOMkr8DuN50M77yF7pVEkipNggcj3/VzKJ
+KTRBUYlGruGMa4WPKqWd3KW05VyX7X96l7oybGi5fyRuLhw/o+DjBw5TNC5HbbpjDfFVZa1
preeSnw=
/

CREATE OR REPLACE NONEDITIONABLE FUNCTION "SYS"."GET_MAX_CHECKPOINT" (sessionnum IN NUMBER)
                      RETURN number IS
                        ckpt number;
                      BEGIN
                        select ckpt_scn into ckpt
                        from
                          (select c.ckpt_scn ckpt_scn
                          from system.logmnr_restart_ckpt$ c
                          where c.session# = sessionnum and
                                c.valid = 1 order by ckpt_scn desc)
                        where rownum = 1 ;
                        return ckpt;
                      END get_max_checkpoint;
/

CREATE OR REPLACE NONEDITIONABLE FUNCTION "SYS"."GET_OLDVERSION_HASHCODE"
(schema varchar2, slen pls_integer, typename varchar2, tlen pls_integer)
return raw is
LANGUAGE C
NAME "GET_OLDVSN_HASHCODE"
LIBRARY UTL_OBJECTS_LIB
parameters(schema String, slen ub2, typename String, tlen ub2,
return OCIRaw);
/

CREATE OR REPLACE NONEDITIONABLE FUNCTION "SYS"."GET_OLDVERSION_HASHCODE2"
(toid raw, vsn pls_integer)
return raw is
LANGUAGE C
NAME "GET_OLDVSN_HASHCODE2"
LIBRARY UTL_OBJECTS_LIB
parameters(toid RAW, toid INDICATOR sb4, toid LENGTH sb4, vsn ub2,
vsn indicator sb2, return indicator sb2, return OCIRaw);
/

CREATE OR REPLACE NONEDITIONABLE FUNCTION "SYS"."GET_REALM_PARAMETERS" (realm in varchar2) return xs$realm_parameter_table
as
  cnt         pls_integer;
  param       varchar2(4000);
  pattern     varchar2(129);
  rule_params xs$realm_parameter_table := xs$realm_parameter_table();
begin
  pattern := '&[[:alpha:]][[:alnum:]$#_]*';
  -- Get the list of parameters from the membership rule.
  cnt := 1;
  LOOP
    -- Find one parameter.
    param := regexp_substr(realm, pattern, 1, cnt, 'i');

    EXIT WHEN (param IS NULL);

    rule_params.extend(1);
    rule_params(cnt) := substr(param, 2);             -- Delete the symbol "&'.

    cnt := cnt + 1;
  END LOOP;
  return rule_params;
end;
/

CREATE OR REPLACE NONEDITIONABLE FUNCTION "SYS"."GET_STATS_EXTENSION" (
  colrowid rowid)  return clob is
  extn     long;
  extnclob clob;
begin

  select
    c.default$ into extn
  from sys.col$ c
  where c.rowid = colrowid;

  extnclob := extn;

  if (substr(extnclob, 1, 20) = 'SYS_OP_COMBINED_HASH') then
    return substr(extnclob, 21);
  else
    return '(' || extnclob || ')';
  end if;

end get_stats_extension;
/

CREATE OR REPLACE NONEDITIONABLE FUNCTION "SYS"."GET_TABLE_NAME" wrapped
a000000
1
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
8
3e9 223
8kOglv67x++a/YNJ40X82aFW04Awg40JACDWfC/NR2RXMvsaIVGIbWUEV6z9S/d5WoOV8mNN
DAU+tQ8AfGsaZgkVrEP+7pi/nHhmKnGeznpBiimlCDKgJAe7C8q36grr4dU5cWfZw6N8DaOp
W3iqDVY7cJQlUidSB9Y4ofT/hN/JoOe7S2kRq2zK98KiG6n2IAlYKhiDLBDWXI7pOIrwlsHC
85PBZYULlq+yH6Q3wS+4a/Ce/8mZpSxzLzyldqw+aTCcPnQg7dg1ePpjSuBizH5ZfxkCrtXq
W6erZKuQIHa3xUNCijLBvJc4w6sMWT6YbC6Jy9Eu0V9u6BPVkzWnfAynekNNawJMN5619cBJ
acy/t5Vw0pGYimwg/xdznZc3FSViBfVLT2yNYfhWQtDk+0dy/VpsWyKtsAWjCCuNg0WDHmiw
fsGmbBdLX3zWsTeTzF4Xfishpu0W9SmHSFvXN6PpW+4ilUX21AgW5vvmo8JwHRDCiLV5wGBq
SknyoZFjILdQzvi1S7u2h4oytGqW+5XNSA==
/

CREATE OR REPLACE NONEDITIONABLE FUNCTION "SYS"."GRANTEE" (user_list out ora_name_list_t)
return binary_integer is
begin
return dbms_standard.grantee(user_list);
end;
/

CREATE OR REPLACE NONEDITIONABLE FUNCTION "SYS"."GRANTPATH_TO_STRING" (path IN grant_path)
RETURN VARCHAR2 IS
  result VARCHAR2(19350) := null; -- grant_path (150*128) + delimiter(1*150)
BEGIN
 IF path is null OR path.count = 0 THEN
   return result;
 END IF;

 FOR i IN path.FIRST .. path.LAST LOOP
    result := result || ',' || path(i);
 END LOOP;

 RETURN substr(result, 2); -- remove the leading delimiter
END;
/

CREATE OR REPLACE NONEDITIONABLE FUNCTION "SYS"."HAEN_TXFM_TEXT" (
             message in sys.alert_type) return VARCHAR2 IS
EXTERNAL
NAME "kpkhetp"
WITH CONTEXT
PARAMETERS(context,
           message, message  indicator  struct,
           RETURN OCISTRING)
LIBRARY DBMS_HAEVENTNOT_PRVT_LIB;
/

CREATE OR REPLACE NONEDITIONABLE FUNCTION "SYS"."HS$_DDTF_OPTCOLUMNS" wrapped
a000000
1
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
8
a12 47f
K8GTpgN9+axB30qwvdIPHuwhx3Qwg1VcTK4FfI5Vxz8CLHWDJ8xcyLQdlCUlzugNWs2P0DX+
4JTjcAn79G95KOTOTAXe8eh8rwWg8nmQx3IyubEtgmpe1zZJgjJwPj1YlALcLOpy/ij2JdBa
gWu3bggD/DdSUaCRz6uxn5CUCRpM2mvIbBuxGr+YOjK4JYpo9nrrokm+dZuRyyAS0eoKp23y
F3yurMbaTPVl+mubMLAMxcCCwbswDCHjFBHv98JpapB7kmKJPczg0l/M8as+N/b2joVNcERw
XDfT6GZRH0Qvefc4bOGi5sUUgWKlr7pWd98hmwD3KVb3gHOGarPK4j68fEyXswixbwG61uo+
qBnfF9DmLUw8xkVzuIJPqX6+1TMdM362twHKYt845Rek/QKJ17doCd8Bo82DFJ+jQT7mM8ck
q/Dmm1RJ1LOdLxg6k0g6ggG++sec+PY+6ZF8SuP1AZpvLE9VtjMl8oW4JkZqSywgM+rIt+vE
8BAfZ+TuLB9U9hagn17uE1qiM5xpBLC4oRuZZa9RhQIBcWqOz6NmZHjH0HHqAsDu0NSzNuhf
C9eP0wmMN0s6dhYMuD2YxSCqIsgZ2ZmQR40ujv9kHOEkeOYHWPwHtsr/8XGvj0Nj/juEInih
/2U5d+VOelNGhJX3+EkpwANxABmbQxCIT00emJs/iDwjQg3FamV2HDgQc+QhBLeb7slo72Ct
OGHL8VOtqAajOlLvfQT2qUTKvi8CsRI5e5A6YQsNonUHLcTdbOtd4DlokyTHa4I4V7LfdvQ4
jC7Ya/72DtHVhQNqTnCcKZS0qHvY7g1jo7a6cGp+jrpOJxEgJGRVuT/LfnWY8uK+2rgezZiD
SOa0r/35K7sqLeGr1EGD9iexJc6grjfsGeEd673hO7m7ma3YfPf+8wQweFqk526S+lIeIR+e
WipiIPzULgoFj4v8P3m7PDMmcSRk359MSEDEQ9QiiZ14YoqElykRyjbxvSkD3boeuH1F4w9q
MhIGVVKLwDslmfpF/fRaUrOAHg4TJ1OG1PNx6GlTm2aLAq8CgR2V+xaHyat/nf3ZNMl100TC
3PSnOaseSCmFJMPtyN/ZYYa2JeLxlHWpw7VM8b1eFuFG1E/5pr6RGjE=
/

CREATE OR REPLACE NONEDITIONABLE FUNCTION "SYS"."HS$_DDTF_OPTFOREIGNKEYS" wrapped
a000000
1
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
8
a26 457
d/lqpTpwvkmNQmSS3BJognFEhakwg1UrTK4FfI5Vxz8CLHWDJ8xEWoo3nt7ewFWjLs2P0LMi
k0RRrMMYom1hoeTOTNo+MhZLSrDejRGGx3LwELmca0Cw7L3cQPzdyVjoK47sGSSJxE5DTeQN
Zs3jd0/YT4Iig9jnhqLe+s7KP8kRo1r3uWVaOSF/vhs7OpLGr97HBzw8nQRj9NzAf4/6BBkz
T2JvskmNyzhuwyIS2ikaT4TNA7C2c4UIfYBKgP4kh3f0FBHv92VcVWBvAjbfj+91xQqM232o
2VonGjbiO8zKjKyUqa0CX3yU8wBiqRFtdNXzytMJqIIPpjJTVvzGhs+ukXtZXVL4XX1LtlvJ
ZPX2IiI6/Nf1JMdjM5THxcCCi40Qxl+b2KxOe7hoX/jKpEE1y6vYIa0huHvCE0vx6p/VGd+A
Gutt4/X7g0a9sUgC98TTFiLF7nxfaJgxL13SihDmExN60P7kwMae8bAN2UHQPvPSKFs4eta9
Ka6hTwii3GKGqzmPAvTkOgJI+jKk6b/Oaod3B/uGBH91ZychL98chNTTzydMp04FbN4AAAFz
LcL0FaPrTI/BYH3F180nCdsh+pT1QUGjmofIci7xgpfKA/x6ZHHlCIaFzV52jgOBflIkwQOY
ZdRjRUU+u8kTjUFM0ZcnNRNZg3AlyEKBzlAp98BCVfbzjHEDKtTMdv9YV3UsUgtW2zidxjUs
xgShdO/6AhbPT15QKVCcKNRxwzI9Tm91fC7RQN2QgYIfdWVqA5dAYz2ymPPH7gCEuJyTMhnL
sWq63xCQLpoX+J8xqNohXUAAdsgdMNkZoNKCZDlhX0u+T5P7BLk0A8FtVRicX2aRU8KAbfg6
5konWV15NnsZRAlb4XLPyVXH7JlEGv+LE1Xu/Nftj5KbSAEgKzNrcQDRPJ9c4phOwHmcQ3Iy
qXNcqiEKUyLnYe3qN7/6zMRt06VyuKQrGv263PZiZNMeuedmlen9O5CcCQoTsB+vFAIVc/03
dZZx0X5ALjitZ0CxbWBHnfDMD+tZ9OGTF6IMHbr2gvVdLBiHbBOzLjHDwvYt4URagZr0WXUV
G2dN/il4mCtLag==
/

CREATE OR REPLACE NONEDITIONABLE FUNCTION "SYS"."HS$_DDTF_OPTPROCEDURES" wrapped
a000000
1
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
8
777 3b0
H/DHLPBU5XacrWDmREnKM528Kf8wg1XDLiCrfy/NQqoCKCamMgLxYfw3XBojsQNwMi14+RGP
kfeR6cX3op6izTcsmi2ykTU2DcTlWqkAThkwGUe0Y5QC7gnI9yLHX1gl+oN3cq7E11XZxwMU
VUZ+IlZkU85hMbg1oMxxdOuQmokN8ZVrT3wWJjt0KUfqJHI5Eq/aZF2sq6P6aw4LMBN6ulaj
jkxfcFnvhig+Iq+y7iFsKWyeX1znWPz5h958NnwKZ9q3afZgbvcVxUQVVwo1bCpk+5lEX7iQ
L4I7NwQH57BQZ46OCS1pPUwUBwaEYJomxWDDEIo/e7tjEuMODfDOmzqmLY09YBQanGyiOuvE
rY8Zu2mNXmkGCQwgaqDcPo2RuEIlmpRh5SVV0CRhY2gEllVQNOFm2etbUq9w5ps++r4OJ/xT
fHxGyMTYnwjkKwRmildbQ7facvF2QHFwLnDhAipnzjB0X15xMkjsOtCAJZNkkyI8SieKtynW
U8Il25cyhqXobDsh0jwe/7EdpY1jlJatfLBk5Vr0/q/WmNbgYexiQYvgM1AaHRASmnpHBoMo
EnFVvHr+ZSV6GQGk4A0smDxHsGRqbkgHIekmTbfDCTw4rAx8lRagKG1mCw8Djze9eF0jNhUS
mpne8t5EbSJ+eaqqd0txN5ggIkBKC782LHbGBDh00C80AAYQmi+PtSLIbfAuK0wh0uG2niA2
r6zAndHFJjd+d7wxhw84LI+5izgpuZzLLHWclZdiE1yqGdhoC072PcJzXNYokm+2PmOexaWk
vn3+zOE/O3zNSjr2Qw1IXekt+TfK8oe/swXaiasPkFY3ofsNqpyzb6vVGgtXltymfM+6dIPm
IYdAQcdi9qJM04xWNCP+DID5a/zpMTRoy8yJ7fPVzKkltZBalyqH4SEBuz8dmmHh1Q==
/

CREATE OR REPLACE NONEDITIONABLE FUNCTION "SYS"."HS$_DDTF_OPTSTATISTICS" wrapped
a000000
1
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
8
9fc 48b
FA2rGvyjh0SBa5pA1mb2bew2Fxwwg1VcLiAFVy/Nk52sB9F+C0SMPlAAtBZLISoY9I2hAix5
z2ZuolodV5N+2PX+yCydhAmnBDIeeSDpsrQbmjSIUiIcXKOvdJys2IH26o7o9cLfRVUNvwcz
uZJn6IgpIpXlBgbQSGpEs2BSUkH+n1488sItkI5pCbqIZb55tT/tMPPPZVeCJxFsckRV3bGQ
v/gQBlExq98hI8+MbWsKnnvQIPUtrA9UL7ADIylRZ9aSppW1RZEDWTctnj66AKqzpoSysUCC
zVlgO5NOrHwKjueGVmByJ4cdYR0sFTJgR2E54HZlbuamrt0axea75pfL2RJ6VVvltOzlxOu/
FyDJQnLnPXZ/Gbz4Yjh2HjMPdKgCbY38BBVIKw409G3h0a57B+uwT6+IA4+sK+Kn7Ac+pFlZ
K5/v8d0P22PsrSZx++zwBBev/xFf/9ffEEhgydlfFg/XCy5Su7+0bLAO22OnHGplT/xuFG3+
Sc1eOArFtUEsqsIaMdTOSAczL5NBIgx9HZN5+p7HK7rGAjfH5yb65dDBxBX1jaXBqgNHK7j/
RDyZ0TeTHUYg32m4GAr6XMcS/mcbcnKVJ4ykPVfsycsGFfK2W8mrIAI0Go1AMU5OXf7zOhXg
HfLLAusfXPX0H/BJrh9+sbkzqhkYVRC3ltKBsIs/H7HJvw0gBiUiaHOBd+PPa+yETs6+vvof
sa7QA2zeHEintuAN6g/Ar11q1/f+eOYZvQAk5XjGrHAqWmwBpBpMrDgefFtUe4hbkYhWuPqy
OlPUuuFrD0YhY6BR499u9zoONVYRpf0Of9X8uNuZj3WIG6qi0rTdDMMxTjl+j2zTzUIdp3qx
rhmlomiyYZaJg07Up69Jjbiurt03WPK+Fxtw04LzgS/Hpu/rclejc5pkXdhqkSrpcG9oykY2
zEb5+CoKGjklgeQKCaW3wR1ocVUsaLDWEn7Lrvg8pOyfPwWguWs6sC5Lu9NqEUGGNfIm5m/O
7K0T+IPusZ63/zudY8/iTCN/k7X5yvI/blEy39wqvImniHFlTRDZL5mGYhrVaYDcpo7O/H/j
AhE0dLdyDdj3gUEEAu+xug+nSuRnPW3eTptXIn/N0ZP0vRZz62yhvmA4qKDPgZZqhQ5d
/

CREATE OR REPLACE NONEDITIONABLE FUNCTION "SYS"."HS$_DDTF_OPTTABFORKEYS" wrapped
a000000
1
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
8
a53 3e1
PqUJEjPbG/q2sGX/w2/nD7GKPeYwg9crrycFZy/Nkw8tB4m0S0bfUBzgwMhjiBItNAq54uxd
FAnnay+jEZ5jqpqz4hRyo1IGXcMsX4HJQckz1+uFtH0V1YyVg5CgASktKg3+xJqlwWTXVZqA
f9mitT6cjSUT7vIWYm7E8mRdde4tYejdoUAW+07omwbS+f5Pt5nFZ7+d+D+1jAq4RYaxE2b+
QgEre5oVOPnNaoTmwJWrYUJddi6bOsKsQU578Z0mDzUVxG69msAbz9lYBoXk8+/vrnpoAEHJ
TkesIFZsGVOCSKshb3fyII/UDSLZ/Z0rYxar9jX4YVJwA6M9ZxysCRac9A6MID6MDUEvOGt8
YXRKmUneoa38KfZIbTJIchdPIj912X8EjoNEciQQya8W5tNH28/3b5XtUXPPKI2kFVuehlLu
SXtt7hXD1yvGzhRZUWHLvNJeJdefvWFqDMok5vYTntN2eM2PHQiiDZK4V5eR2gLkV5D7r8x7
5uY5WA4NqdIFiP01bqkaCANIfwYGmzpGWEjl8hw66VtUFfLee00mNcZgKZ8V96NdgVKX8bqh
wB4OKgUwAAW71Q5Ib8RrdhzKWNGWWNhs+v7wXRKRGfRixQv8paJmzuCk+FyDEz90bS/W9kOV
PUUkchJ5WmtgnH9XbrY6rVhPAfyHWEVcG7mJJohDcCL6VRtbbfqzWXIR1Mm+SXaX+cgX2LE2
KdpZSy0u4lcbGAN5BOnJZYJr973wbSLsWvASCW3//xfP6shC70+MrmzGPXwuKFdJj/vhvKLn
1nWLv7js/8SychdXSXT4F5yD73r0loxMZoTrb+iVSQEeoQmQGzIgjjjXPV/C+D7W0WoahlzM
iFvgBNHQ8Pd85c7cupG4TGdVcyxmVldnE2EUnA2rDhofnElWaFQ4IQfA7jGYjhnfS5m7lEpj
XLXawHPZcSRDy/AzzYjgk/4soI3VgF6oEQi5LKX0t2Y=
/

CREATE OR REPLACE NONEDITIONABLE FUNCTION "SYS"."HS$_DDTF_OPTTABPRIKEYS" wrapped
a000000
1
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
8
843 378
mx9rgo7950sJYuL1N5VMNLy0Gb0wg9dcLiAFfHRVMZ3mB8uhpmu0nvUHOQBX36SZLWxcUbGL
kZFnf3SF0c2pa7U/iV0old7rQ3xwrTYIEtDTOlp76e+CjvLCJYegQkrpCiEGuRM/ki1Cz0LJ
TkYyT89cvb4pHEaRb/DI9iKlVBGMZQDuk8vpg8OFyZqqc7xTa2opXU+YsB+/kn5f/wlZ1Q2n
3rIggLsz+BbbyWx33uPO2S9Z6pT188FGjytPtgaQ3b+QyhP+0HIDkfcE3dTIuPaWByK0mPL9
zLDJmDc7eX+h/Vbp/8LUBMi0329ZUQI5J5ldWbRGOiEtbOn2yC/Jyl4b/i7SMqCRgkPSKiqT
WOwKOoHBrpkiyBlQ9zRF+dP3rw0dZThtQ+5jkpoP/IVZXC5iHRKi8bo7AtogvH78lAQH/C4F
/nMNZl/ZLFu7I6IoAvMGlHdRPGc1nTtl+3eAyq24wpwYVWhBb0cBXlzkO5aXMET2qCbRYzVA
R54BdQKeEaU5BUJ+ZdAuYl/lak7kyvN4p8sNTku7NE/JHGQW0KfQ0LqVxnmTV+qTY4kz9sym
yQGFXlrDkJoMcq/WZ58PnzLPiZ6ZPYV6yBAQkjSSMHrvNE+9Il+v9JuMIll6UDTZ+GXyj6Yp
m1fdaBCv8IXQhfOkrVGcpBKP9EEwFWip8K1TOJ6z759WdBLfjSPSVIoA7CekBAyGYnYN86tt
+Dt2AqTTbZK5X1HLKem5MsZfRU+3RQOOkbl5sq6TY1ZLGfp1/QS7LjDu0bYwhWeYtSQVNFUJ
Da3XQtX7wCMKZjj5cMxG3OceSZuna95wGkkfBwrpLV/gCHNUekrNts0lXo4BiqrIK8VWMgIO
QwckPLco/A==
/

CREATE OR REPLACE NONEDITIONABLE FUNCTION "SYS"."HS$_DDTF_OPTTABSTATS" wrapped
a000000
1
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
8
a4c 3fe
FVrWEcGx9vU4DEHHcpw8noMsu+cwg5VcLiBufC/NWA/uhOWK8it3ovIok0OPKhv2jQ0mAF2G
RiXl5WZDYdWBu79L+yjIyLkmdsgwIEEAQUIcGINaUDxLkCT2m3YY1CumciTkCDowcApfMq68
Yg06PBARanpXebnO3YTMrdVzRhe+xaJM4dq1EOTHn9YMxB68dkqWJCjBoVZE4yUZiC3qu21P
Dw/029mQg21NzoC943kme5U+0zDl3Mh3YKpkjZPR21QGieq5h0NJWuC+7mrAC0kPqqT/AzKL
jnfLHU/kRHkNW/uD1qe8N1l3S+uttw3Hl2deC6OTY9UCO8aKoHJUTUQhBLNXZzbHnDxDrxZr
VLIz015FH9y5RpijTA8/k043dEwMXT2B6ubUPF+FXzt4hi5zFejuk2hCdgg8MyCABPbstLTR
FXf4O8BiYy7iHB+V7apASfQIjoPjwibYse5vG/KDwhn9wqV+TO4BC0y31ZZJ85w3nGbi4u70
uf32/IPAFVCXHAiEkPO98xF11CZRQ9htDk83tMhsF5Ofx5iFZFlMp+SJH0E4Crmg3m1U7jKZ
vm88f2TyAh8LpUSwOY+gsQID+M7t7ItvaZ0YhND+xPDrNZX65wbeYaUhgjx5kJPeeZTieWtn
ueBBg6nNe0u9biN33RyfVa0i/ZkCOy4c+vnP+aBOUgaj3H6X1qg6RxJuo0pevwj3jW+Xp6N7
PpDBVVKWWhnvGgyqRpWiRTeXB3+IHvLFDCceoXlz6AuAPYG3/GGG6uigo7BgMhWLN1LsWYQd
eyjLyRPUYcqybLYbAhvIQPH0t+a2V/IOpACR9uQa0n7kGlA+6QH1IWxENd58kAk+dQ6MjfRy
hZe9zdYFndPHMzgC5f/Ll12v0wgMpzzVPJipwB22kquqbRNZAPJcDVvpVlSVtBvGBRkEY8Dk
OvvgODhMoh/eLLlDYh0HAP19+tRS9kx+428iPBVxBUmDYxfMPdwetUGnUBz48FCL6w+oVtBr

/

CREATE OR REPLACE NONEDITIONABLE FUNCTION "SYS"."HS$_DDTF_SQLCOLUMNS" wrapped
a000000
1
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
8
c41 519
BON+td9pQ4V7zB5oGjLoO/fXyfQwg1UrmiAF3y8ZA/meIvVL8IhAtg5qL4zd0oaRto1aAhor
F5ZG654ppklEJ1tVhPnOpKGTGn0jhRw5dIJwB5K52pu5MP7pAdnA6a3v/TpgHwLFDTQ7m5b4
wcawHVgbGrWOk+kx+Pk3ZWaNDn4ALIrlfjZyC9o+DlkF8vf6aggFE/2dTtsSiyby1bzJ3rKc
AL/4EI9mTrJ3Jk4wY23yA54j0OpFXTQn9jMYXvGTZmcN4T6/wH/ljFXmJ40aO4NQrF07L92J
SGzjGmuycFxrysMbolUqZ4lgQG/nL/utHwLt4f001OaQ5u+dY2aaGgYjkjMnrRMojrp1dcBz
M8GpwOWvvz7RGcjHYD6lRaDwgdI4eZA3S0nKenvdmA9MtdNByim7uItBDQG95oYAOz0bwpTI
63s79TWxw/otsupFr8De92/1/QXll10uvLbi3RvTu2N4RDHRnNl8hzTSbelqEjyG5c7vI/0W
o4bNoJMRgpgRQYwIicLE7tdeQCnfcQnakDfw8qQBKp4+qANc5kbeGl7a7gNCFbl34fJx8kh8
VjGVSkNdi1UBhnc2fLV4P1mKrxQWAWCvn9HuQ5qiDJP7uvFV93QeG7khAZ48cILBPUtYQpHl
ZGP6uL7yZVReQAECYl074eYeq54Yv2Ab/lVqLK6Rm5sJkQ13JttrXJlwxGLq4nKw3DOLAaOh
de00WT/whcR5o7Px5jhRMtHcobJCI7e7SphznFthEoqLeJuGwblSwTwnv527aCU+6Lqqz/l7
uve5Kesn5qPedxZpcr6clTrKv8dk4MfY+2+pw254K13yaTrUnzkrbZink5OZfiZmLN/dX4GA
1Fz6uitX/Z/XFZnTPFCSQhbJrS4YMG9fWCutZlGvepZ3sDcEqUEpW8CPsmm4ucpU+bS29Z/l
PdjOwx0ji1SvObnny+B29uwo9UYSPxrHHapfB+SHbOHohHrBGjcdY1v/wnieBEnQdcHwAbgO
So+CYR/UtDhLNvduvegoFt9CZII+pG7gbf69bJ8OWw4Lqz41CjpOtr78f4cu83WTeIWy59hL
ghc8QpVsyD//0cVKWMcDr7D4xtb5z1APmGpO+U0oVVIIUKSBXv7Bf93594ui/O7hPr5Lk48M
/z0VcdE/uujmO3y11VniECPRk07hhDa1fOkeVtw97dM707SLUHWbZslsAlKxL3QO3b8sAnVV
8KcreU1dssIZ82yjpTxSKYWqTSPReXtfrAyYrqcL4eb5u/FZJtuoZxGBag84voJp
/

CREATE OR REPLACE NONEDITIONABLE FUNCTION "SYS"."HS$_DDTF_SQLFOREIGNKEYS" wrapped
a000000
1
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
8
ba8 4a8
U0PYpnd9Arr0CoNHKUIWrwosBrgwg1UrLiAFVy9VAz9EKGJ+jKyzjn0c4I4WYrJ5FSEmpYzw
rkbrnkj7SUTgH1XhOgjaiZETGMN4eZZtssi0z05gz04mfEmC2Y0Ux05Hwb4BGXG9M0O85DS+
uomav5F1yItJT57RHwe27vEECr5uY4BAAQIrk5w1wHB3vQw5E3PEF5zN/TlJteD3zAwC7KFF
Riz4ZMQFp7f6i0saDXK3kFaQnhHPQX3bP4Ac+KRCiimb8cxRr3vwiY2IxOVNIaVYcd2XMBNp
F8F6SVjrqxqB/6ncnoemPI7AFS7miuWm4ABlNGCpEYWJ/wo5ESVDfz+JTkr8ftyBCu4ebZyM
IWXq90FHZIe1VWWx7tJ1gmxoCTwzSliQnROQnROQnROQnf3HwbJxKlz3SK1EpLjqXXessdxn
mXI1Zyz/b/lpDCUTNwPJVnsRLrBxuJgnQezIsxSoe8MeaYJ6B7ZhN7HdpQrM+2plQXmy6dGa
bkl0Y7Zmc+skNSB34DxAHAoYhI749ObRx1Mb65RYwKGBl8feODlc2/J2LARKJd+9nsztbhRe
dVL0rUb2hW5EFZwMha1v0HRIl9fB2mUwMIWwDIYmr/RLC8jq3DFFD0CBIgyIlDlgKCjWxNCF
6kqe/1ddNVLNCZb6ZxyH4Atk/h7NnPBxmqc+HNcHrkPNkrjCHhN5kyxUE/qjWW+CJM/tLC5a
Qv5SZcr/Ro1Qo+zeNLLrEdljO0ON1Lo+8GEuGFjbIdNrw8x57znfE+oQAq3qMmouxZlxxwwZ
cjU5HscmVl7ciw2yEkh2u3TY6UOI1kzJABWkSES/MT3b9YX78L4IMIBd5yItk0/gPLB1gdXJ
cxiTZOA8CnWB1clzGCj4KYX2qbbvGcOAKzZBdQi5e2XvfDy0zLH6EkmG0ATNkG9VH68q2l8h
g2rGmcCzcPJ08wRcSshEL5GHMnnOQb0BqSGQkmr6KAOOHKUIi5/BJM3kEL74RVX4TL4sIJft
ndW1MYC0ltc/Eub9qFMl5RaleT9/HAvnzh4a8LBiivwv9raHpH4wDLY7GSizeyN2J3O5TxS4
kDXz+feE2KvyJnpvWCO9yIaZGWYrAPADJ4e+zETCGS8KpG7YzXf3tWkz/Eut2qBppJ+22BWm
oDqaRKG+r/c1EZuxnYGdtjk=
/

CREATE OR REPLACE NONEDITIONABLE FUNCTION "SYS"."HS$_DDTF_SQLPRIMARYKEYS" wrapped
a000000
1
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
8
825 3f5
dGPVbF6l1ABIij2ZbRF82IrnZ/Mwg1VcTCCDfI5Vxz8CLHv7o0aD8gUdTSXmwB0rttrOCwJJ
bWHzOzaQNsO6bD/k4s1n5uWfBQUhFN2t/nGGx89+Cdfg6a3vtkLJ8aJjYNwD4E5Th36H4tmc
Yik5GiNsjF/CHvw3ZWaNDn52HB7FYjbQBTLxZ6spWff/wP6Gfrh7ErC5Su+UAc9HUXYZuYfY
K/BviK7K0M/GLGFNEYk1PQhIDFCZNhZiyGWcc7bHNtfvf51AviHF46DsUEbbo+dwlxG9ZhYR
+xGUFEaXqU1C+6KIkQQ3pvMvx/dXD1UndMXGlc9tonr02wH+TpVClnpvkNRFMDo6DIx9AjTF
1HrrrU496ulxxPd8Mkh8kNBnVKBT31vq3LrhJf05orRDLKKPAxDmD1+pjgfxunQy7R6USdYK
/r1M6ANWzx5q4ozuYwk8WcEd7ikgP1jCNsmRIUnvly8qiT4E1l4VA4ZGM/cml5SYg044fKx/
AREvR8o8nufXx1oRRoz/eb7Pz2aQcyKIQyWi08SHgTcuKuo/9kX5okbeiaF9zf6QZGKbw4CI
Lj4Un5W8lSxlDLnLBpVILZK8kW0yiMtdVYS+h84to2ji8iQ0EhnSQBrPRSyf46ff2fDWjjxJ
FHobJKItTYmRbh+5cRoOBvQFCaAC+O0cRZ5HTWZ4tnBhkvdSjcDX0w9qzbmxOukDcQ+yDZMi
hWJBHQVZH9tvs+AqZIil7y37PEeEg9DYnk2IB10siJSPiN8oVC0PT4XpAgjYbWdyDWd+NXD0
TutKhl8Myo0HINTUSG6Qj/mf7SoougM+xHIKkDGnmPnCaFiwm8HiN3NcuKNSpZmhvrjFpf+Y
fbpkpTtYJ4vdHHAKDfHBlYOYX+c/65UnZGI9mshqpsl/jjMPNn8fH9QurH8hdMqv9mmoi8mM
JgzTjTRnPJTM5oRMAA1K5IS5QjEhANvU2eLbwI7KXapJZVHTKPvmaiidpqiIVnA=
/

CREATE OR REPLACE NONEDITIONABLE FUNCTION "SYS"."HS$_DDTF_SQLPROCEDURES" wrapped
a000000
1
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
8
912 426
/yhXHjEEORRGaUDeK16y6WI2VCIwg1VcTCCDfI5Vxz8CLHv7q+agEzOm5SG3aKk9cLD5VO76
UXmiSbMrxcMFHSQ/sZ+pFIx+EhNANrT+GYbOdpqGGkDG7L3cG/xHG/TcO0X/m5zBmAb5gWNU
t5+il65llwSdxUlftmNshoa5ImTrcRhTWEm9GneR7KCnE7sX1oMGOx1X6OzJ4Ecpjhk5lisK
nqKVtnUlqc6E4wVwvVey9Hv3NnkUp0dcZBuy0fv09w7YSk2ztqfItFq9cbqMZ2Ct2fsCrEZ8
lPMAcjcRbZQr4Kla4wJZNOX4jVbx/tqS8gF6a5tRcy2aKTzFerEnlcGu8BikO8lEeF7ZMEig
1yYaXkPv78iYbnxF8djByBSX4JQRRlzA0zKc6hh2Iviwh9L41+0SvTPO4/VA8/fc95DRV7+C
w6tPdQZpvR+EJtwmloWPm5G81y6nMqq1hjNerRs7Va3ee5ep49LSywSucGBgx2Xgbpetnjs4
dEHIhTMevj6xbKrEHvl8q691Uom9yS/9skYusMh8GIw8eS3kM6KjBXll7MUMlN+Nufud3+YH
C0hbsDJe7D59fsQ7lvAG9oSCp2VaaEAdFHWxlMRbCOADVACWOgYtfct3VYQIU+cLwUd8RRIQ
KXShCPUkfvOMboDFOc0cbrFVreVtw/dJ+kaF7VUJUAjbT9UYZhU3KBA5yVm3E724nBByAtwC
7qGF7lj+/LxnvnphHCIrpHrAGhlJSqg0F0qmceRptW3WM+PJ6Eom2go55WP8TeXBJ3XyBqm0
rVIPkzlKLYEAP0Y7bQcjsWNUj/kiyE5lG8LfOXscvS2Z4a7krZhSbr1EGnoFeBMxgbe6j/kz
UnksPG+7+bE91OJtLiCTfopeCAte9HNc2nhFIX4UlCUD3dX5NLGEns4qcer461XRSvahlsgy
v3j3BujwMdy3JzCodO91lciY6hvUz/3HOLb1B0OmvYf4qws/KqeSyxfyXVQyoaAhuIU8Y++1
yCM33wy/Lo4RnJFE08j8ne+hWOa2cBHOuUnz+UgK
/

CREATE OR REPLACE NONEDITIONABLE FUNCTION "SYS"."HS$_DDTF_SQLSTATISTICS" wrapped
a000000
1
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
8
aee 4cc
gHih8NqFUqMSgRuSpZKmpqelkdAwg1VcLiAFVy9VAz9EKGJ+C0SMPlAAtBZp7Ksx25ca5gl5
z2ZuolodVz7fK2EShdCaqD5twvFFTIpjTfsFXUcTs88iQ41wQAw1K5KN12W3uhCHfckFaLkT
BQoAiEkac5FtrG0kBZkfov2VlWXN0huWjZGEAPrKsFw4hX3oOpInn13PjvCIKqDIDDWxpXmG
zUixgrN+RParVj9Q21Dp+zuVKOzDrE/qytwXMn5RZ9aS5zG/LvGhUd3Dnqj9AAAnqWtA9mpY
YRtrjZMIX0vyPi/UK30APkK9tMvP57G9fxPT4y3jS55EBPu3xU7tTj66VruoRdDDLZRcIMa7
/xlZJcvuCq1nNBD+gChSTQUM56gCso0n81GjlmetlB+IcbROGG96wQ6HfMvjXrkQP3Ou9dBC
wDWZuvLXc3aAlLfpDW8AxnLkCdfYw98d1znjgmQXITDByYLPSKGcDg/LPsEC+wFYjpPnKX2+
vVhHtlFxA8tiapiY7i9URK0cDfVligYmr8iRM/kaP1blUVq1xtCZoHij1FMxm2pnkT97IZpe
wrTIRDyueVYfOaePgo3pwXJMAt4MwSVCgq5vS13hCucf3cUdRmSxyFIYsLMBEMcSrmCurjHg
O2I9U+fJngY08RtfwVe4aezr5mpdKd7SOKYiXziL4csbNzx2MHoLBcmY+MDvYb8ye+vqTx6Y
eVcTzUPiy8b8+TNkxqMagly7HgedHh71n4HOfFi3kvkjImaNn5gZjAMhm8ODCK6DJfIjjxiO
maw9ygKJY0nxdnS6Oi3dJfp8lsdkN5lIhbCUwNMYh5newJP0Vn24kehShi0OGdEYQE1LgR1u
H8v3P205Z0ltUxxb9VMWbVOoqPWPN+ARUnY1iYFmMgOrC9u6dwCG9Mt4d6ITIjf1pUF8Zvii
JagSFUFyHGOiT8wE9zc4e1+dYM2C8SmphC5LUhJAL/7+2q32AcIEjHAGea9bvWZOgn3/2Mir
Wtq/mnGAeHP/r4FDVRk/GQUHI7VT9oq8SOh4Mgu7HqrsQYokYl1wsObKvsMimc8tQS5MeKW6
veuapIBu0bHf7cjYEgvTbCTwzNqI6KuHak420QSJ4hEWTtUbGte4nDumhaUB9mmL7QhoICyx
wqJ3EuCOShCwANGkOvTlHyWLOjjI5oN5wtO2aZKcDPHA8AoYUTogteGCp1XJ
/

CREATE OR REPLACE NONEDITIONABLE FUNCTION "SYS"."HS$_DDTF_SQLTABFORKEYS" wrapped
a000000
1
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
8
c2a 447
BPMUezcnt199LwWZSx31retWmPcwg9crLvYFZy/Nk53gKD4tOH95ygDbXcoM2jPgQuoxTCoI
oRov5qigUI7ytRCAmPEA9hAhoZbXqFQgySEsu9fKTcOLGit+C3L8er9pBRMVVao3uyRhKJ1P
MVY4zQ+8xRqDn65ZxcmQ9yfXKBzL8oyCfUJLcWejlEqQJPnkMp8CvaXNKA8snSqI/9AIQ98M
TKN9DfK/4Hr5+Sk+nsIxYIolL04GypzinrPUNNGFzdnqNq+6I6zE0jYgKT5pi4dniCcGKe46
elhJYFOXDoYZ0U0RZ/2osSfVM2GfoaO+8EeTK4jviQrV1VkJlwkOQKL/Gi51T4wKs4zfy/PJ
ouguuZTB2iZSwFTrwXeRE3dxR9EkP3VO1rOufRE0U+SiXzjn9384TgFujtzxYeRKY81H7/Ta
Tmf8cP/1zM3DS/5HfJD96Mdq9Uh1//BfPStooNNpPUhsWdbqAUF7zBPlL/NBmXGs+3ZhMkki
31c3oYKe3AS34pGoVbwQ9o9HIfW+1sN7Nst6ZgYAafcN86mdO9/7RhzjRq7y6gMKHt4HWOUY
rLUeJIp+bDwJOB5FjsX1qUJ1lQgGYBzS3SaPrZRXBO2ZcgPrrAAnF+7JTkjXQs/gQvV6re0Y
boeYQmrh1aDRc1Wm7sIuTerFsLo/pxkbuRoLxBNhT/7y2lCNl9YtHrYRT5EeMDQLeoM+HGQv
sNVqhkTus+alVLU069qw4cHDPTS3Zbui2a5drX9CZo23CB0ggA3KAoBauhBGpKMONDXb/b7k
N8Xmb2uZ50xLfjvzOLjmBPZhATW7Zrlg47B9yMdTwxC/0ChEMOn+c/1Xn7DEX5K2bjndcIF8
cQBfwygLPWq4gXwJAF/DKAs9v8Q6fYNmd/Qc/IzvNSaC7RmAF6zUgTPVpA4armByPhks7HWP
TGdOa91fvJA4kdURa8CW/KWJlIOePCl1g8tvcvbOw5MbBtG2AU5YbXUfmCUq3Ek7jS+tP9BX
2+RtbEYAyDwsCvaLWWxKi7fbqA1+qgdU/v5UsdDNnnnZ6wQBiqppK8ViJeNQm1Us6WyZKg==

/

CREATE OR REPLACE NONEDITIONABLE FUNCTION "SYS"."HS$_DDTF_SQLTABLES" wrapped
a000000
1
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
8
811 3e1
+B2nPnaJjdo5uIvowJ2n7+1Sw8Iwg1VcLiCrfy/NQqoCKCZwPZRm94MdFgnXI2/YVt8IgB1J
bRTVCfQaXMon1QiG2mF4VjFvDb5c6Z4wwdcwcxk0Up7VwGpjyrYQBgSCAuucY5OHZAqyKRsa
+UvM+pXpc91Es2BSf/8zUz7J8ot5bnwWTWKyKdhhmtw5+PDaLjjcsmJDVFA+dpZx4rFbbHtP
3YnUGJ1Wf/XD5kwI7NMDdXMtFKG2RNTFWZN9GZmUc2+DWEajgu5fXSs+L9STssVYCIgO6N3n
sb29lmXLgm4VpszIDJXmHRXRyzIVx89RxU9pMjwQqoOuAwAEjt7dA/4sy91a+OcEvfnhxY5U
TH3Koh0z+HMhqCl8qJdP0jo0zopPyO1eaY8JDCyEnsaO95G4P44enrqnMSC85G0o9WXUmZTl
41ZKnRiZOcdlo8jzH8Nidh851C/cYtlzh/nMBGaK9TaXLGQkWWB8i+E9qa1dPKbu6z583FI9
vuIrTyxaF8QLjCafwwuALijbY40bxRnwtveUoHfIuZ+Q0DtdDAwMh7hw+UstFMtYrrnLm0Of
vvnC09n4xf19E5j8P4ixOKzLp4vG6nEZegDohAkAaMva2ycgd9avl+z0+jO3yM2yQWvhWk+J
Cf+sc5l8OhTSjg3xLTFqqd1u/cAq++6zxObs5qOvZotDhFXkctrAqwt9N4eGD6Jqhy5NkJTw
aJeZr5/JuDLVs8aDQq98O3os9ptB7byu5R0q1ZOf9wmrcIUQLzaZozoyh/KyGjzBTa7PEuQ5
xLH+/b/EUtA9i97tMhMnBbpcuv5pEJoc24dDiSvrhjWeJuYspYN7zYHI4fmTOMsSirDrvwro
H/qS2vQWQj3pIXle8JxofDdCy4K1LB0Lr57me0DJx+Gp7jLJfG+fhum4vbHAQJPB2xaZspIJ
e5soJh/eTgYxZvefLitm+2O12vGJ9na9dLKa5DY7kxSl
/

CREATE OR REPLACE NONEDITIONABLE FUNCTION "SYS"."HS$_DDTF_SQLTABPRIKEYS" wrapped
a000000
1
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
8
843 370
Wsj+ORtMbj2ZAyX/qqPTlbhw8Wgwg9dcLiAFfHRVMZ3mB8tSpmu0nvUHqwBX36SZLWxcUbGL
kZFnf3SF0c2pa7U/oF0old7rQ3xwrTYIEtDTOlp76e+CjvLCJYegQkrp9rvFaBDrriTf0JZy
VkpUtfrqjcgT+TVaybPnvovv0ALfxeuCQUNpGi4Cfghzsbtt/Xtu3Pm+EiMp3A9Zs5MY3mM8
ZTvuzX1VPyxGtNhGe4HzqoisKeWsIgZuL2j8x+Zuts7itpFO+QhC82LvHbQE00jNAbRbeaKQ
7M05YWGVFnlLjq3Zqwtn4AVUfPdvq01iyII474sl26eOOzXmdTdZWGgqsz2z8deJ67F3kQEn
4gYeck+nzxSQa7ZCMnNsyu32W5Hbp/ruY5KaD4P3WOXsoyMz4xTEo5m//88xd9V8pOV4zVD+
sRh8TPlXI3jKI1ZfL7AObw05npJ5jQgOIuH6N7ftw4qLM6DKpy5cCMS8FoaU2AIaRYk5KYLV
iThvxQ6v/XnBa/p6IQ185TNyCHrzB4O0u9os6FgH1ZfWQ4brKwjeuqeQCtgJ8pgNFqYDJcE+
FOUZu9tSpcrIVZwQpCxjFeYqZf5daU8iZCIc/+csyazQC7hR5A4ogighu068dNNXZ5J6y0u5
Irtgj4CP48t2s6FyHDBRF0FLSN3odkU4m7O2n1bSEt+ce9JUinrs9tp8iUC6V94dIY4ouq29
EhSOslVYogBl40WxpIL8IhsyID6FaDH8T8Lyk3DWt6h4Zf/9tRUuZjCFZ7+1qkatmGMnx+xO
K+Fd0ivpFWivUaWQLzwuXWKE692ictEz6m1mveAIc1R6SqTTzetejgGKqsgrxVYyAg5daizP
eigF
/

CREATE OR REPLACE NONEDITIONABLE FUNCTION "SYS"."HS$_DDTF_SQLTABSTATS" wrapped
a000000
1
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
8
b70 457
llSyTacTaZPTsNvcceoNADio+hcwg5UrACAFfC/N2A+vqOl+qefxjvov7x0uzN/MWMOFXiIb
ZmIYZmff/X2alumXBvTAkKuk5a+pue2/epscruKjlTUn6TwzR41sw/8id6WS17mHv7pl1Vq1
idmj5WRzbcPbrPcn6Vt25dQRSIJuiVHgebJd5MG5sTGQrlVDEAW5Gbwgcrd1gnANhz5h86pv
nbyd7/RD9i04zAic03DZo9IYXhSlJW7K3o3PEQJ7Py8L9PMrdYDMQcr0xrIsHMS7XfjQzUJ/
ll+pPDAGbe3dO2HdZ6PIaHsWVJn2k9MZq++OUzycXCHC87yBvHvemdP/4W4XVx0iBvbBg4mv
Fu5Lbrtjlin3iLzJiyOfxzKtsB0ERafdHhO6NtQ8X92sRx+G6c336WrH9UN/hlCbB4jy1R/9
BYLDmJOe6zUJjQYxAKDYp42Oi6lXZUpjmtp+MAkjna4mVM2reQFTsL0GRUh4nmxBXQGn2nlx
PlZyBOr7wVbJnKXxZAVLjUsHDOWRshVX4lyIDKvCP76K2slFya9wiRDby0zS992ln/Vgw6To
LnSDoVDE+HUgKr6YJBhyw7qx0iw/5Ken4GxcsdDUms1pI2OyLVFv+W/LGxq0eY79CmUjtpoX
QiaoJxdSFSVzPegwxQkhuxGrkSGyTUK/iho8Rb2CUdPdsS3cJmf+spM2WXoMyq4ePyxPjUDy
xOVfjz+qM6BzzPXpET9JFkXhIXWQ3M8uLZA+n9GV32OzdfUnFe9bbjTIpMJytiiL4c24jil4
exiVnvitrgcppNqpI6lFcMwfilGAgBBLkyxFZOGuATJv0PyOE9OGyNkmqHtsW7qLaNHjJhGl
bCee4Cci57YkhOhR2ImOdlxVsqHDZKqVpZFpGyfLOIgcUaE3UXVfwd5mjH0WgqviFscY4MB2
xPRvGX84Bv7b12vt2PjAtoxPyYeaEl5NZc6CvAijujUzp9u0qTa3lZ3LbeZ6x7P11c5UpTsl
4tKElz6o8rVb+89WFKdcoKCgOG5otnwZZx1uYnacpz3h3u4LYlkN+Ob4m6DqMpputYdvtzz4
hQdvTz8dQ4YxKg==
/

CREATE OR REPLACE NONEDITIONABLE FUNCTION "SYS"."INSTANCE_NUM" return binary_integer is
begin
return dbms_standard.instance_num;
end;
/

CREATE OR REPLACE NONEDITIONABLE FUNCTION "SYS"."INTERACTIONEXECUTE" wrapped
a000000
1
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
8
92 ca
C+WKzrAsTo0++ihhSoswlUMTjAMwgypKmJ4VZy+mO7vVYSHwAnnlEtiLyjGFGeLo2hRx9xv7
ra9yH893gnTHCZvTgKwBO0NSTx7CO0Ncixdi+FoflKVzfatwjgGsCgGakyKsXCngpmRHWvEq
qP0TX2rHFB2qAFOoARLZ61AsuOZkrJon66sapvc2MT85P1NV7fvYTMU2
/

CREATE OR REPLACE NONEDITIONABLE FUNCTION "SYS"."ISXMLTYPETABLE" wrapped
a000000
1
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
8
12c6 721
temuKI6Oz1ySzIbLCquuThYM80Iwg41UDyAGYC+7gk/gd9n6nwzzU1xjOQhwR9NxiBMjzUZ6
k8hUSeI+uI+gGPUsvAOYYb/NDYRLjlRy/7WQmkfxQtNTLR85S9pknD/kn0cG1zNsgmoHqaKP
RLi7orkV9Ioi2/93Sd6PVqGQuRvM5h5HuNo3yggQCh/3V/ThdUBrrm4OwVAcplCd5CEbHlMG
eKr9+QiYKskS/koo5L3xQ4mibosbIQagMfWhXiDU9AiGGLhRDLF95peaAJ7zWIKcEVSFm1V7
/ZoOCGWLm422M7hXjtxo6eYy1496WayI72+vS8rBSq704MZIxAu/BS0q2nqBTNObL4phzbiS
wcWbuV56yIhQgHt1LpCOAQlgYx0zKTpdSs+nuQAJTOGd2hToXf+ZaeLk1IDPI8d87anU9xaQ
IgQkq29ZcJE1NMpECl/Lx4C3JhVKAl23j9GH56yBbWJm4cp1Bm9SvMWTpXA0OlMp9FkrsNon
ImOu5Q71WQmYNPYRt2SyJJW6RNYFoSavDttJSHSuB7EQSPmRNWMjHAIMOkByOs16V3adQ+cx
/d3pT16b1zM5wC0/ABew/TDNHuAFZBZmdUHLluaViyZmDkBJyAkomawwaY12OQe1MzEpthvS
jRM6NksxJIKSM9WMi+Cv9OWPn5zv+kdbxuvudZCbxCLa83pv/1jqBq7gAqJcq/r41ySINIr5
/918IgNlsmghniw0cBwZBEDJZMMhr6XFjV9FBcEEES3MvCFjUtUkikH3+nxAVdAAdrIHzdRj
iJ+iKoQlKmFeOujFMJTu3I+fw4vEFLRgkwn2Bht/n7xD8Ud6W+pck0I1dps/7GmWU9UOjDNS
ujV0hgulL4mrYF3mSQg8R6nWgO5A+wP2q352yI8ZfQMj6I7GmfaW9zjwuiF8hnCnhBrdDXk1
BH/FzcqIES/7VWeCZ38gBhY+f7Cv4m/M/qxyBwWhRPpYgAsoB2zPrXkzQqeB7jCDc5gS+ryR
4W5yBS4YpQyIOnQ5z7XiQWOpvzdsXhjCg+A0Y6QtYAmY4Vk1E36ibpNs3jfW+79XcOb/Oc/F
1QxLE92o1/aZoUBHh1NmNa1gwRFPSWCJiQnycwaJGm4sQNU9N630Vekm47EbSp0/eZHwXD/C
M+CnZKYokJkQyxVUdO580+tTfhUqd0usZTE2T6X8jgHvGfBcZYEAsUugRSaL2vYFDQb3TliY
KXvV2HxlFrzrJ2fCplkc85g6jk/XHWnWzcSoJeWwZ6TR5MyL4s/blNY9xSFtgVfTlTGHy/KT
jqzG8zwNc3+ITRqeWrjeLT/crgecXyZFTaJRB/Q0Wyxcl0Xb5gtJFZIIBkQjr5lzrKZhZKlE
ghA2eu85oPNZ0USmYKRWe8mKniGfN6tW0y4OvW+kZZ8CiBLYxydwLbqzUZmnES1kAtkBUHGy
pPhMinE3DqfkIYCp5he+sXG/c8jxZYEurcKf+hhzfiV0CO/nf7rzzZeTf1Ewi6vJsxMtm4Pr
HREFPQtpkJ3Aii0j3Zc+xejzhIz4w+/CY82F3yVKT8nZr50P2pMk6H16afhQQspbbOokTb/o
DDxUhBX4uLPQ/3PJB3uf2W2oD6tHR0879NI7XuUDY4gO34JOEfacOW6P0OEduw8syJeS7FVT
raDjukybO0zTA94mLkvNlw6nRRnNe9Fb/GTrGysi9QB9Dd+YHhJM7XLesovl+DeriWO/qeGL
7b8Tw1sVutrrmAAmjP3zgS72QWLmDQoY1FRzE6JzOxmlDesu37JXnXwrsfrjJOQo76pJBw==

/

CREATE OR REPLACE NONEDITIONABLE FUNCTION "SYS"."IS_ALTER_COLUMN" (column_name varchar2)
return boolean is
begin
return dbms_standard.is_alter_column(column_name);
end;
/

CREATE OR REPLACE NONEDITIONABLE FUNCTION "SYS"."IS_CREATING_NESTED_TABLE"
return boolean is
begin
return dbms_standard.is_creating_nested_table;
end;
/

CREATE OR REPLACE NONEDITIONABLE FUNCTION "SYS"."IS_DROP_COLUMN" (column_name varchar2)
return boolean is
begin
return dbms_standard.is_drop_column(column_name);
end;
/

CREATE OR REPLACE NONEDITIONABLE FUNCTION "SYS"."IS_SERVERERROR" (errno binary_integer)
return boolean is
begin
return dbms_standard.is_servererror(errno);
end;
/

CREATE OR REPLACE NONEDITIONABLE FUNCTION "SYS"."IS_VPD_ENABLED" wrapped
a000000
1
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
8
420 264
BAGk1fGSOtd2Mc8JVBkUKyaDZ7Awg41erycFZy/NrQ9/RquhSPxTuWJgAo16wmGT1xhVjXH+
wiFXB+YWYzfxcrvYkb3ZNgm76XyCu9cTeIxRa2ihLqVOMbVzEKXQnT96egAc4JAQgd+WLdPK
vaM4mwl1PbJxr6qdZzVRFb2vRM4JUb1L7b/4RQsmjYHxdkiz3Uwj9KcuK5O1ebcQD1oe96Lo
uIbH13FdfsD79zWxBKxZ9gKsZ4OpMjdkT42afPY0o9Gc+nuOuBdqg8dVyB0n5XQuH2QN8Tq8
ynWPIlvDQLqha2BvLwzC/9vWa3gvTIC9GqU+++pmpENPTXDHfrcufzR6AqAyQwQMIuIjQk1W
vPJlwzNcoDh/Hgo1dzE/JXhZIvd7StdiZiLC5LzfwrLLk8N1mEXj//Xt9HwjNpCFire42rWm
5j4g0v8V5G9FANtORiCXKSnAnozVHKLO4oyimWKK8iHnzaxVcN9kv9v+sRPH5Ok2/nZOkEIp
JreopMRtP+MiGl0A5iESrXrkQiNB6Q6yNKOl+UOPFzSKvIR/5DspfYUjVMaRX5ZLbmjUCH6Q
3qXPhsbDqFchf8idHr+1po95TsM=
/

CREATE OR REPLACE NONEDITIONABLE FUNCTION "SYS"."KUPC$_TAB_MT_COLS" wrapped
a000000
1
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
8
225 144
E8XSTIZ57w7ckHiHuTf2pnf1r4Awgzv3LdxqZ3RAWE6OHHsU05cd0ttQG9z2UgiQ/8t5k9yg
C21nUTQkv1vg4QEmSfixu3KnAFloPq1ATsH43vNklsbOI/CwxNmARD7h/I4EXcrNhl2Y6XYq
n/9gBq/pDFGP+oxs1BypGvIu2wClIeJ/dSfw/QYseTqmiLMN7dCG8o5qliakFuPskWh5+uAt
t6baLhT2r3vB2XtCBDbECrVxTfnQD0lw64sY6u8ZH3dZR4zSjyACIxXKKVt4Ub0AC+t14RPa
eoaHDBdhC2XBXsHk+Ajo8uy++OEWHAIc
/

CREATE OR REPLACE NONEDITIONABLE FUNCTION "SYS"."LOGIN_USER" return varchar2 is
begin
return dbms_standard.login_user;
end;
/

CREATE OR REPLACE NONEDITIONABLE FUNCTION "SYS"."LOGMNR$ALWSUPLOG_TABF_PUBLIC" wrapped
a000000
1
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
8
276 1d6
MtZ/JBSqiJlMxuXjH2MKwNXoS4wwgxDMTAxqfI6Bvp0GInQ8FQRHgNkcJdKf8BqhU6HYEp4T
DudeB3vk+OjNi8U/NuG+rcFBbhIJQpWQUJ6fliiucmS317mGzUvQ6TCafrtq+UtVABk17Ged
VmQtODUtOe5A82SITP+P53srWnZLlnwM55BJRAlkq+m2G7phYTwTVFsMhWIEOGmeAmwEYFny
iftcSY18uyfM4f6iTXGlbz7z3/vmHmOZb1UkwurZt2ROkreQyULhUTREQxPhPq6ecb2N9eGw
ecxmv0uma265vlV56UU3EXt9BnsVYZ1+9hQ2VcUUVD/ZXybAXSd9iMhDV7xa+K/A9ust6AB5
7P4ZPxPGyIspfdcxWjDfGNH9FMUuc3xSVlRHwRfP/w3qTN2DdIdFquElYhoXCau6A9Hapl+M
Ml1UdMa3DYxkfVGe1B8JpeQGtpPpDmw=
/

CREATE OR REPLACE NONEDITIONABLE FUNCTION "SYS"."LOGMNR_GET_GT_PROTOCOL" wrapped
a000000
1
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
8
62 9e
tuj6ulWX9SZG7VSTiisONxJUBp8wg2L6f56pfHSmZ8E0Zg+4n14LPhFmf5CC4/XM1SW1hgY7
eGwcVp6Gk5synUHQ/L6STqejM8Cs8WwBXaDSGi94fT6iOdskg8vzNzDbkxUV/DdH1jrl4GWF
aCos/tx26w==
/

CREATE OR REPLACE NONEDITIONABLE FUNCTION "SYS"."LOGSTDBY$TABF" (request in varchar2 default null)
return logstdby$srecs pipelined parallel_enable
is
  lsby_object_row logstdby$srec := logstdby$srec('','',0,0,0,0);
  type lsby_tcur is ref cursor return logstdby_support_tab_10_1%ROWTYPE;
  dataset lsby_tcur;
  lsby_query_row dataset%ROWTYPE;
  cmpat varchar2(16);
  compat_num number;
  role  varchar2(16);
begin
  if request is null then
    select database_role into role from sys.v$database;
  else
    role := request;
  end if;

  if role = 'PRIMARY' then
    select substr(value,1,8) into cmpat
    from sys.v$parameter where name = 'compatible';
  else
    select nvl(
      (select substr(x.redo_compat,1,8)
       from sys.x$krvslvst x),
      (select substr(v.value,1,8) from sys.v$parameter v
       where name = 'compatible')) into cmpat from dual;
  end if;

  /* Convert version string like 10.2.0.3.1 to number like 10020003   */
  /* preserving only the first 4 numbers in the string.  */

  compat_num :=
    nvl(to_number(substr(regexp_substr(cmpat, '\d+', 1,1),1,7),'9999999'),0)
      * 1000000 +
    nvl(to_number(substr(regexp_substr(cmpat, '\d+', 1,2),1,2), '99'),0)
      * 10000 +
    nvl(to_number(substr(regexp_substr(cmpat, '\d+', 1,3),1,2), '99'),0)
      * 100 +
    nvl(to_number(substr(regexp_substr(cmpat, '\d+', 1,4),1,2), '99'),0);

  if compat_num >= 12000000 then
    open dataset for select * from logstdby_support_tab_12_1;
  elsif  compat_num >= 11020003 then
    open dataset for select * from logstdby_support_tab_11_2b;
  elsif compat_num >= 11020000 then
    open dataset for select * from logstdby_support_tab_11_2;
  elsif compat_num >= 11000000 then
    open dataset for select * from logstdby_support_tab_11_1;
  elsif compat_num >= 10020000 then
    open dataset for select * from logstdby_support_tab_10_2;
  else
    open dataset for select * from logstdby_support_tab_10_1;
  end if;

  loop
    fetch dataset into lsby_query_row;
    exit when dataset%NOTFOUND;
    lsby_object_row.owner  := lsby_query_row.owner;
    lsby_object_row.name   := lsby_query_row.name ;
    lsby_object_row.type#  := lsby_query_row.type#;
    lsby_object_row.obj#   := lsby_query_row.obj# ;
    lsby_object_row.current_sby := lsby_query_row.current_sby;
    lsby_object_row.gensby := lsby_query_row.gensby;
    pipe row (lsby_object_row);
  end loop;
  close dataset;

  exception when others then
    if dataset%ISOPEN then
      close dataset;
    end if;
end;
/

CREATE OR REPLACE NONEDITIONABLE FUNCTION "SYS"."LOGSTDBY$UTABF" (viewusage in varchar2)
return logstdby$urecs pipelined parallel_enable
is
  lsby_object_row logstdby$urec := logstdby$urec('','','','',0,0,0,0,0);
  type lsby_tcur is ref cursor return logstdby_unsupport_tab_10_2%ROWTYPE;
  dataset lsby_tcur;
  lsby_query_row dataset%ROWTYPE;
  cmpat varchar2(16);
  compat_num number;
  role  varchar2(16);
begin
  if ((viewusage <> 'LOGSTDBY') and (viewusage <> 'ROLLING')) then
    return;
  end if;

  select database_role into role from sys.v$database;

  if role = 'PRIMARY' then
    select substr(value,1,8) into cmpat
    from sys.v$parameter where name = 'compatible';
  else
    select nvl(
      (select substr(x.redo_compat,1,8)
       from sys.x$krvslvst x),
      (select substr(v.value,1,8) from sys.v$parameter v
       where name = 'compatible')) into cmpat from dual;
  end if;

  /* Convert version string like 10.2.0.3.1 to number like 10020003   */
  /* preserving only the first 4 numbers in the string.  */

  compat_num :=
    nvl(to_number(substr(regexp_substr(cmpat, '\d+', 1,1),1,7),'9999999'),0)
      * 1000000 +
    nvl(to_number(substr(regexp_substr(cmpat, '\d+', 1,2),1,2), '99'),0)
      * 10000 +
    nvl(to_number(substr(regexp_substr(cmpat, '\d+', 1,3),1,2), '99'),0)
      * 100 +
    nvl(to_number(substr(regexp_substr(cmpat, '\d+', 1,4),1,2), '99'),0);

  if compat_num >= 12000000 then
    if viewusage = 'ROLLING' then
      open dataset for select * from logstdby_ru_unsupport_tab_12_1;
    else
      open dataset for select * from logstdby_unsupport_tab_12_1;
    end if;
  elsif compat_num >= 11020003 then
    open dataset for select * from logstdby_unsupport_tab_11_2b;
  elsif compat_num >= 11020000 then
    open dataset for select * from logstdby_unsupport_tab_11_2;
  elsif compat_num >= 11000000 then
    open dataset for select * from logstdby_unsupport_tab_11_1;
  elsif compat_num >= 10020000 then
    open dataset for select * from logstdby_unsupport_tab_10_2;
  else
    open dataset for select * from logstdby_unsupport_tab_10_1;
  end if;

  loop
    fetch dataset into lsby_query_row;
    exit when dataset%NOTFOUND;
    if lsby_query_row.gensby = 0  or
       lsby_query_row.gensby = -2
    then
      lsby_object_row.owner       := lsby_query_row.owner;
      lsby_object_row.table_name  := lsby_query_row.table_name;
      lsby_object_row.column_name := lsby_query_row.column_name;
      lsby_object_row.attributes  := lsby_query_row.attributes;
      lsby_object_row.type#       := lsby_query_row.type#;
      lsby_object_row.scale       := lsby_query_row.scale;
      lsby_object_row.precision#  := lsby_query_row.precision#;
      lsby_object_row.charsetform := lsby_query_row.charsetform;
      lsby_object_row.gensby      := lsby_query_row.gensby;
      pipe row (lsby_object_row);
    end if;
  end loop;
  close dataset;

  exception when others then
    if dataset%ISOPEN then
      close dataset;
    end if;
end;
/

CREATE OR REPLACE NONEDITIONABLE FUNCTION "SYS"."MVAGGRAWBITOR" (bitvec RAW) RETURN RAW
PARALLEL_ENABLE
AGGREGATE USING MVAggRawBitOr_typ;
/

CREATE OR REPLACE NONEDITIONABLE FUNCTION "SYS"."NameFromLastDDL" (longp number) return varchar2 as
language java name 'oracle.aurora.rdbms.DbmsJava.NameFromLastDDL(boolean) return oracle.sql.CHAR';
/

CREATE OR REPLACE NONEDITIONABLE FUNCTION "SYS"."OLAPIBOOTSTRAP2" wrapped
a000000
1
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
8
18b 134
EG4XW1PP3rLIXo523WFdvrfecakwg0zI154VfC9GAP4+p0GOI5v83hPUn2tVhcmGciYwjjbp
+Pl144OjhWxOLkBYfh39bMaP4sH4YzRVQMGlV5qx2fIRIGwcTxZ/isxZ1sLRyh0vCo+s3KK1
36pzXmGXUdrnHQfioPE4UEDFfDXbwjOvSdeEbXFb2GJ1dShijazArOWKz7ujaMwsY6IE2pk6
2EhBhctsZfCUp9Qtg4xvpSRqiJvF24F2L+qRaZCOPn3tSKDoHhF1lqQQqspDWRwQvI+w2NMk
yN+lJkWTNKavKPbI
/

CREATE OR REPLACE NONEDITIONABLE FUNCTION "SYS"."OLAPRC_TABLE" wrapped
a000000
1
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
8
ab be
RqkrMY7nDPwJ5Nr/xKo0z1X0CiYwg3lKf8sVfHSmWPie0MqoOSsbsSp3JwaiSvCJPrW16Qdm
r91ixGi4cmnAPp5sOCqrSscGTjYs595DLVIHLKIo9l1YzZLwDBjY7wtztp2zEemYD920ao6j
IHh3vA4LC0/lw9xRNGchs7EI1vI48far+VfNwt1Jtw==
/

CREATE OR REPLACE NONEDITIONABLE FUNCTION "SYS"."OLAP_BOOL_SRF" wrapped
a000000
1
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
8
2b3 171
IUHcfGQH0hI18+PO3szP3Ms/qOwwg43Mf0hqfHSKbuovWNMOfcgNti7Zy/u6ZRblnxt5kJ42
EacincA71FL3pg0bKTCApEJcSxqKVlM5mFRXsaKWPdzLNn41S6oZ3arQiEXM0kDmgIlqnmzv
zreqUmx/BSV0GmqeMuDQtUUO647eqU3V0rwnJ0trYl+KeOAh49eucE8FIREeqQ37l6mVPN0z
HsA6z5b/wdDNltCZNa01k6Ai4Czr2uojPO/IAyc512kH8UVN852YRddfMfkEAu+Hon+VXmVr
e1juf6migcV+HmzPB9cwEk+IyNI3SHZWJXWnc+OSA5eROKOaLORKBzTNxo32ZHG0nSIQHepu
bbM=
/

CREATE OR REPLACE NONEDITIONABLE FUNCTION "SYS"."OLAP_CONDITION" wrapped
a000000
1
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
8
116 e7
QZvPnONnf/RjJgThAJS7SLHyKXEwg41Kr8usZ3SiALvq0ue9HKnbL3gclwkNvY4Jn7MF+bUP
Uwr0I2PE3PjJi6vbQkFEi/OcfcmIzu1vDvAdb2nPwzmfXxNAR3lNuUqDitbe7wiInHyBGri8
Z7JjzJs1nWbi+oI9bTRgvYZ1S7CMbP5hKcIWGRvk3vcCEAj+D68tADJMuqPr6/BsmBDhJ/Za
ORIw+6Guew0=
/

CREATE OR REPLACE NONEDITIONABLE FUNCTION "SYS"."OLAP_DATE_SRF" wrapped
a000000
1
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
8
2ae 171
qU07zN++f797FIJH1S2VArdsWgUwg43MNUhqyi+KrWRUQ4laXCi+M6A5itiR1g1WDcfm7dL7
LstCP2voMnFsCde9QFgBdSbWXOb/rPYt0KuVonKBSiieheGGpTQ3tdGCM5PSQNhKhQeU8ual
SbUGoGbCg1/y1JT82/+7RcrrliVbUdhQ+EV53UDiZTSaS/fdb8DTZ7x03rPf+/0d5aZv2h0F
HjrkOmualgUsq1xfz+FMMiIGL+u+aHQUgGn/GIhjZwDAq2ZAc7mxJzhHGcco3LNRByb9Lp6V
CHTB0rY9mbd5p6Wk3+7NP8lnJVsyhnDMlYnS7/y/SvoVjkMs5EoH04GGEyHV/mmPcx7rH7ya
9JI=
/

CREATE OR REPLACE NONEDITIONABLE FUNCTION "SYS"."OLAP_NUMBER_SRF" wrapped
a000000
1
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
8
2bc 16d
Oj7mmngM285kcSCagjqo7gx/3NYwg43Mf0hqfHSKbuovWNMOfcgNtmLZy/sTZRblnxsgMUUh
FlDB6uJ3V9HTDjwUpNB3COKefol21vZL/a2gAo2zDA231vvgL4pPeKW1CwdIJxKEf4CJauWH
5qVJtQbyhNtjpF/LCpLvqpIFRC4F2ypgTCqv6i6y+kZzYNg57uQ2m0Jp1nFb2GJ1dHxhb2EP
nNnGWCSaxJ0hxTZDNgGzkvP4f7zHY0kArFLYn1B0MhZS46MImApoR3WBrvRXhG2iCfJsiMNJ
gnpjLyaHAlOHFb+0RsT+WPstJHX9RG1n8QXQTSTcYL367STOpLIxisaNHthxtJ0iEB1n5PDT

/

CREATE OR REPLACE NONEDITIONABLE FUNCTION "SYS"."OLAP_TABLE" wrapped
a000000
1
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
8
2e0 fb
7jmelfCSxeI0bGSpSqSYB0kCLl0wg2MlLp4VZ3REcLFBZgxE89idj8WQ6Kuh6zgb7/U9+Jrm
5Qk1Tee3Lm9CLDE0eyaCSJSjNZr9p+ZtrTTGY/GPElQP+EqvTH+OCn8Zp3jAPLrB3nvLlD11
22e3hcYrEbR4faq87EsVsgWpeIhhhUsFdJjZS/h0EoVLxnQSkrHRONs3VkQCtJUqJ3jDbPHw
sb4XrhXylBqFI0IrWP2W7ZAXKPz1EzA=
/

CREATE OR REPLACE NONEDITIONABLE FUNCTION "SYS"."OLAP_TEXT_SRF" wrapped
a000000
1
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
8
2b1 16d
70kmwpx0RASbTQbtdBq3/Fxxaj4wg43MNUhqyi+KrWRUQ4laXCi+M6DUtJP6OfaTJ8HbOygR
I4VOHTc8Uo1aKkkEyXCf6AhgvZMdYWqo40EUV0ifz2lnOQTGsbLkvyneWlEokTKiIthp06za
vni61WZeHqH6oOakMSkPHmyu81vnwua77OJEhvjyTj9qo3pyhKa+m2kH6IG0J2lEfLT2tIf/
wWSuvs8gqhHDf5u9/OW/+8YvckPJFK2swhsCcQ77rSJm7FW5sUg4R/leHyuzUW1ori6elZt0
sDlmPb233pylHd/ucz/JZ3cSMsFwzIDc+IiBpwGgyIbk1iSlaQY/P7cXPn35c0OeC7JtNQ==

/

CREATE OR REPLACE NONEDITIONABLE FUNCTION "SYS"."ORA12C_STRONG_VERIFY_FUNCTION"
(username varchar2,
 password varchar2,
 old_password varchar2)
return boolean IS
   differ integer;
begin
   if not ora_complexity_check(password, chars => 9, upper => 2, lower => 2,
                           digit => 2, special => 2) then
      return(false);
   end if;

   -- Check if the password differs from the previous password by at least
   -- 4 characters
   if old_password is not null then
      differ := ora_string_distance(old_password, password);
      if differ < 4 then
         raise_application_error(-20032, 'Password should differ from previous '
                                 || 'password by at least 4 characters');
      end if;
   end if;

   return(true);
end;
/

CREATE OR REPLACE NONEDITIONABLE FUNCTION "SYS"."ORA_COMPLEXITY_CHECK"
(password varchar2,
 chars integer := null,
 letter integer := null,
 upper integer := null,
 lower integer := null,
 digit integer := null,
 special integer := null)
return boolean is
   digit_array varchar2(10) := '0123456789';
   alpha_array varchar2(26) := 'abcdefghijklmnopqrstuvwxyz';
   cnt_letter integer := 0;
   cnt_upper integer := 0;
   cnt_lower integer := 0;
   cnt_digit integer := 0;
   cnt_special integer := 0;
   delimiter boolean := false;
   len integer := nvl (length(password), 0);
   i integer ;
   ch char(1);
begin
   -- Check that the password length does not exceed 2 * (max DB pwd len)
   -- The maximum length of any DB User password is 128 bytes.
   -- This limit improves the performance of the Edit Distance calculation
   -- between old and new passwords.
   if len > 256 then
      raise_application_error(-20020, 'Password length more than 256 characters');
   end if;

   -- Classify each character in the password.
   for i in 1..len loop
      ch := substr(password, i, 1);
      if ch = '"' then
         delimiter := true;
      elsif instr(digit_array, ch) > 0 then
         cnt_digit := cnt_digit + 1;
      elsif instr(alpha_array, nls_lower(ch)) > 0 then
         cnt_letter := cnt_letter + 1;
         if ch = nls_lower(ch) then
            cnt_lower := cnt_lower + 1;
         else
            cnt_upper := cnt_upper + 1;
         end if;
      else
         cnt_special := cnt_special + 1;
      end if;
   end loop;

   if delimiter = true then
      raise_application_error(-20012, 'password must NOT contain a '
                               || 'double-quotation mark which is '
                               || 'reserved as a password delimiter');
   end if;
   if chars is not null and len < chars then
      raise_application_error(-20001, 'Password length less than ' ||
                              chars);
   end if;

   if letter is not null and cnt_letter < letter then
      raise_application_error(-20022, 'Password must contain at least ' ||
                                      letter || ' letter(s)');
   end if;
   if upper is not null and cnt_upper < upper then
      raise_application_error(-20023, 'Password must contain at least ' ||
                                      upper || ' uppercase character(s)');
   end if;
   if lower is not null and cnt_lower < lower then
      raise_application_error(-20024, 'Password must contain at least ' ||
                                      lower || ' lowercase character(s)');
   end if;
   if digit is not null and cnt_digit < digit then
      raise_application_error(-20025, 'Password must contain at least ' ||
                                      digit || ' digit(s)');
   end if;
   if special is not null and cnt_special < special then
      raise_application_error(-20026, 'Password must contain at least ' ||
                                      special || ' special character(s)');
   end if;

   return(true);
end;
/

CREATE OR REPLACE NONEDITIONABLE FUNCTION "SYS"."ORA_FI_DECISION_TREE_HORIZ" wrapped
a000000
1
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
8
219 144
pn0fjPjekVawyL2jP85VBXaKSlgwg433LUgdqHRn2prqMH5jdFzUQXu4j9mT4dZf9MCT5LWq
8+JJ6ddQxThnBOTkRgB4M/JYqG0DWFYOsIMLXjWgbJlMmlupT9Y6GyqZaB9SmvyjLrgZmssA
nAne5kWj5pSbncdy3OQGXef7F7FR4cQEeGDM8Wy/KflR2YQQSN7mOtbKb9IrDBQQ7BaHDxTf
W8GppfGGrRXB5XPB7V4fzmQDKI+l+6yDkSy6Wvig3zgCBtuV47PIVY7znpRf2wSpJ/4CpyWD
HtVBadQ4FbYIc5Ie/SLG+61fIHjmhUDY
/

CREATE OR REPLACE NONEDITIONABLE FUNCTION "SYS"."ORA_FI_EXP_MAX" wrapped
a000000
1
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
8
dc e7
aDtSpFBnEWQDWi4an1guxi/wy5QwgwHwLZ5qfC+E2vjVSH5rhMFAy9xWsFszMW55WkXOtbVR
QGcOw9Y5Kag6GwxDFIl3n3KkurmzSOqE0tyXT7whYqEpjtlLwpzipYC/LH41O1b2OpW1k8Cl
YQLyJeZ8eAl36Ma+beNM8YRrfj1AqVCon8sOR4g3REpTX4Kx4GjGMJWekEdfjUNfT5YjWTkG
6NkfTW5XNQ==
/

CREATE OR REPLACE NONEDITIONABLE FUNCTION "SYS"."ORA_FI_SUPERVISED_BINNING" wrapped
a000000
1
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
8
131 10b
lL38UBp6fJLWao2VjCeNvbcKXzgwgxDQLUhqfHSigvjVV99nQEcqZVo8MWxnXjk+RFpvc7UP
ogLMHS43wI9nvJjvweVe7tiJYqBYE7GynxeAJ/dck5zQN33V/SQFw9cDs8zY7TpqEzgZv5z/
6OSMFCMLDeLzW8OT07MkyIyJSIad1rXoCRV25YnRlIj/kRY9M9Al/C3e3LiDrETzWtZAFg7w
eOfV0y2qD8OxgbPXmW+0V6JW2MbOTmCxUqnoCNLhO0jyAg==
/

CREATE OR REPLACE NONEDITIONABLE FUNCTION "SYS"."ORA_STRING_DISTANCE"
(s varchar2,
 t varchar2)
return integer is
   s_len    integer := nvl (length(s), 0);
   t_len    integer := nvl (length(t), 0);
   type arr_type is table of number index by binary_integer;
   d_col    arr_type ;
   dist     integer := 0;
begin
   if s_len = 0 then
      dist := t_len;
   elsif t_len = 0 then
      dist := s_len;
   -- Bug 18237713 : If source or target length exceeds max DB password length
   -- that is 128 bytes, then raise exception.
   elsif t_len > 128 or s_len > 128 then
     raise_application_error(-20027,'Password length more than 128 bytes');
   elsif s = t then
     return(0);
   else
      for j in 1 .. (t_len+1) * (s_len+1) - 1 loop
          d_col(j) := 0 ;
      end loop;
      for i in 0 .. s_len loop
          d_col(i) := i;
      end loop;
      for j IN 1 .. t_len loop
          d_col(j * (s_len + 1)) := j;
      end loop;

      for i in 1.. s_len loop
        for j IN 1 .. t_len loop
          if substr(s, i, 1) = substr(t, j, 1)
          then
             d_col(j * (s_len + 1) + i) := d_col((j-1) * (s_len+1) + i-1) ;
          else
             d_col(j * (s_len + 1) + i) := LEAST (
                       d_col( j * (s_len+1) + (i-1)) + 1,      -- Deletion
                       d_col((j-1) * (s_len+1) + i) + 1,       -- Insertion
                       d_col((j-1) * (s_len+1) + i-1) + 1 ) ;  -- Substitution
          end if ;
        end loop;
      end loop;
      dist :=  d_col(t_len * (s_len+1) + s_len);
   end if;

   return (dist);
end;
/

CREATE OR REPLACE NONEDITIONABLE FUNCTION "SYS"."ORIGINAL_SQL_TXT" (sql_text out ora_name_list_t)
return binary_integer is
begin
return dbms_standard.original_sql_txt(sql_text);
end;
/

CREATE OR REPLACE NONEDITIONABLE FUNCTION "SYS"."PARTITION_POS"
return binary_integer is
begin
return dbms_standard.partition_pos;
end;
/

CREATE OR REPLACE NONEDITIONABLE FUNCTION "SYS"."PRIVILEGE_LIST" (priv_list out ora_name_list_t)
return binary_integer is
begin
return dbms_standard.privilege_list(priv_list);
end;
/

CREATE OR REPLACE NONEDITIONABLE FUNCTION "SYS"."REVOKEE" (user_list out ora_name_list_t)
return binary_integer is
begin
return dbms_standard.revokee(user_list);
end;
/

CREATE OR REPLACE NONEDITIONABLE FUNCTION "SYS"."SCHEDULER$_BATCHERR_PIPE"
  RETURN sys.SCHEDULER$_BATCHERR_ARRAY PIPELINED USING
    sys.SCHEDULER$_BATCHERR_VIEW_T;
/

CREATE OR REPLACE NONEDITIONABLE FUNCTION "SYS"."SCN_TO_TIMESTAMP" (query_scn IN NUMBER)
return TIMESTAMP
IS EXTERNAL
NAME "ktfexscntot"
WITH CONTEXT
PARAMETERS(context,
           query_scn OCINUMBER,
           RETURN)
LIBRARY DBMS_TRAN_LIB;
/

CREATE OR REPLACE NONEDITIONABLE FUNCTION "SYS"."SERVER_ERROR" (position binary_integer)
return binary_integer is
begin
return dbms_standard.server_error(position);
end;
/

CREATE OR REPLACE NONEDITIONABLE FUNCTION "SYS"."SERVER_ERROR_DEPTH"
return binary_integer is
begin
return dbms_standard.server_error_depth;
end;
/

CREATE OR REPLACE NONEDITIONABLE FUNCTION "SYS"."SERVER_ERROR_MSG" (position in binary_integer)
return varchar2 is
begin
return dbms_standard.server_error_msg(position);
end;
/

CREATE OR REPLACE NONEDITIONABLE FUNCTION "SYS"."SERVER_ERROR_NUM_PARAMS" (position in binary_integer)
return binary_integer is
begin
return dbms_standard.server_error_num_params(position);
end;
/

CREATE OR REPLACE NONEDITIONABLE FUNCTION "SYS"."SERVER_ERROR_PARAM" (position in binary_integer,
                                               param in binary_integer)
return varchar2 is
begin
return dbms_standard.server_error_param(position, param);
end;
/

CREATE OR REPLACE NONEDITIONABLE FUNCTION "SYS"."SPACE_ERROR_INFO"
        (error_type          OUT VARCHAR2,
         object_type         OUT VARCHAR2,
         object_owner        OUT VARCHAR2,
         table_space_name    OUT VARCHAR2,
         object_name         OUT VARCHAR2,
         sub_object_name     OUT VARCHAR2) RETURN BOOLEAN IS
BEGIN
  RETURN dbms_resumable.space_error_info(error_type, object_type,
                                         object_owner, table_space_name,
                                         object_name, sub_object_name);
END;
/

CREATE OR REPLACE NONEDITIONABLE FUNCTION "SYS"."SQL_TXT" (sql_text out ora_name_list_t)
return binary_integer is
begin
return dbms_standard.sql_txt(sql_text);
end;
/

CREATE OR REPLACE NONEDITIONABLE FUNCTION "SYS"."STRAGG" (input varchar2 )
RETURN varchar2
AGGREGATE USING string_agg_type;
/

CREATE OR REPLACE NONEDITIONABLE FUNCTION "SYS"."STRING_TO_GRANTPATH" (path in varchar2)
RETURN grant_path IS
  result grant_path := grant_path();
  prev   number := 1;
  curr   number := 0;
BEGIN
  IF path is null THEN
    return result;
  END IF;

  curr := instr(path, ',', prev);
  WHILE curr != 0 LOOP
    result.extend;
    result(result.count) := substr(path, prev, curr-prev);
    prev := curr+1;
    curr := instr(path, ',', prev);
  END LOOP;
  result.extend;
  result(result.count) := substr(path, prev);

  RETURN result;
END;
/

CREATE OR REPLACE NONEDITIONABLE FUNCTION "SYS"."SYS$RAWTOANY" wrapped
a000000
1
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
8
207 14c
uyNLp0engg6QLQkEjQFfWD/KNYAwg/D3LvZqfHRAv7lkL2MHb8CTKAFLt+CYCsr3bdhQi47h
2iBLy2C1ED3/iHOpfEx+obvvBWSxstpjhbhXHMkPc3L+F7VSbpkv1o/iqb1oQLEzaAUrJu88
pW9dzIYle/JzKIg62rPhFBHvdIU7gOmEFjW09i/UngQepuv5cwEqAhjyNd6vnDL8wjQDZopa
eI9RsmgKCLqOjH5n7MEGcy5dv/RK0Zb/Pi1JB6tECb5WGygbVCFDx1KNSvMx8TfOxxFffL//
F1ZtCvVfhTxV8kDlIDaWtX5ydjOExwiS9eFW/jK4
/

CREATE OR REPLACE NONEDITIONABLE FUNCTION "SYS"."SYSEVENT" return varchar2 is
begin
  return dbms_standard.sysevent;
end;
/

CREATE OR REPLACE NONEDITIONABLE FUNCTION "SYS"."SYS_IXMLAGG" (input sys.xmltype) return sys.xmltype
aggregate using AggXMLImp;
/

CREATE OR REPLACE NONEDITIONABLE FUNCTION "SYS"."SYS_IXQAGG" (input sys.xmltype) return sys.xmltype
aggregate using AggXQImp;
/

CREATE OR REPLACE NONEDITIONABLE FUNCTION "SYS"."SYS_IXQAGGAVG" (input sys.xmltype) return sys.xmltype
aggregate using AggXQAvgImp;
/

CREATE OR REPLACE NONEDITIONABLE FUNCTION "SYS"."SYS_IXQAGGSUM" (input sys.xmltype) return sys.xmltype
aggregate using AggXQSumImp;
/

CREATE OR REPLACE NONEDITIONABLE FUNCTION "SYS"."SYS_NT_COLLECT" (obj IN AnyData)
return sys.AnyDataSet parallel_enable
aggregate using SYS_NT_COLLECT_IMP;
/

CREATE OR REPLACE NONEDITIONABLE FUNCTION "SYS"."SYS_XMLAGG"   (input sys.xmltype, format sys.XMLGenFormatType := null)
  return sys.xmltype as
 begin
   null;
 end;
/

CREATE OR REPLACE NONEDITIONABLE FUNCTION "SYS"."TIMESTAMP_TO_SCN" (query_time IN TIMESTAMP)
return NUMBER
IS EXTERNAL
NAME "ktfexttoscn"
WITH CONTEXT
PARAMETERS(context,
           query_time OCIDATETIME,
           RETURN)
LIBRARY DBMS_TRAN_LIB;
/

CREATE OR REPLACE NONEDITIONABLE FUNCTION "SYS"."TSDP$VALIDATION_CHECK"
  RETURN BOOLEAN AUTHID DEFINER
IS
  role    varchar2(20);
  primary boolean;
BEGIN

  BEGIN
    primary := FALSE;
    select database_role into role from sys.v$database;

    IF role = 'PRIMARY' THEN
      primary := TRUE;
    END IF;

  EXCEPTION
    WHEN OTHERS THEN
      null;
  END;

  RETURN primary;
END;
/

CREATE OR REPLACE NONEDITIONABLE FUNCTION "SYS"."USER_XML_PARTITIONED_TABLE_OK" wrapped
a000000
1
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
8
98c 33b
q5cVAL145rL1vNfO7US+GEsNyWswg81cBUgTZy/Ngg9/CXaVWkqNYPQjNeKghyg3OZ877Vfc
D861nX1H0XDh9LZ38hAmD1TJi0dDfMYTEmxMJpQwbeitPFwDH9SNfhVMhtthFWAkG7i5xKDC
3aMh8nfnY6zWfMIvi58yHDkj+LZjE7IK0mH3RZsN7Gdeytg1wfDhQx5iqy/f7MtR/IKi6mDL
KfA9ORVHl/roEJZ5fa/g6bKscQOu6h+vdf1M1hBh9jn3MvvAlBnebkR9MMnfH48djyZn1o+x
azGydPrTJ4DLy7zK0IceSZWA3x4NEhnvEyBbz6KuE96FD/XIAvNlHIXfqdGuAs70/Es0GO2J
mArSRMHbZxMKw/rOuoDcoOf7hq49t4Tc7kw1RuNSWV2Gr+dDL742VtroLKqTjPDiGTGpXiaG
ZmcZ0K63x7shpYXQxiV7BdAKz1yVGAdExSuVSCCX1pBvSustA954yFs0vJgHPYDoBpqBVZyt
rw/BNqoT88+qHd7sy5Hml/ip8o8Ut9wckCH5WW+2pNKeQroftkeiZvV+UoYkp7WSOluSOrpm
7GQaOsDsZCacFWbDv042xqUrKXf1+gz/q36VWxBd1cy6z4/w9mSYu/3ObvsQWDbSHD1avImC
gElt9OWN65BiC35YapsBR2Ml0bFBoAP7F3roj550E9HVeVJxFopgEtXGPBaW00VHA2ENs0RZ
i/IeAIbg0LeZ7BOKX0fLlm6G7Vhd/BOyOHpZcjrQ4uvrpqLq009J0yDCGgXeH/Yy7U43/WML
bs97xgpfFAt7FswzKXjrXQgj
/

CREATE OR REPLACE NONEDITIONABLE FUNCTION "SYS"."V_LISTBACKUPPIPE"
   RETURN v_lbRecSet_t PIPELINED using v_lbRecSetImpl_t;
/

CREATE OR REPLACE NONEDITIONABLE FUNCTION "SYS"."V_LISTRSRANGEPIPE" (opCode IN varchar2)
   RETURN v_RangeRecSet_t PIPELINED using v_RangeRecSetImpl_t;
/

CREATE OR REPLACE NONEDITIONABLE FUNCTION "SYS"."WITH_GRANT_OPTION" return boolean is
begin
return dbms_standard.with_grant_option;
end;
/

CREATE OR REPLACE NONEDITIONABLE FUNCTION "SYS"."XMLSEQUENCEFROMREFCURSOR" (data SYS_REFCURSOR,
                            format IN XMLFormat := NULL)
       return sys.XMLSequenceType authid current_user
pipelined using XMLSeqCur_Imp_t;
/

CREATE OR REPLACE NONEDITIONABLE FUNCTION "SYS"."XMLSEQUENCEFROMREFCURSOR2" ( data SYS_REFCURSOR )
       return sys.XMLSequenceType authid current_user
pipelined using XMLSeqCur2_Imp_t;
/

CREATE OR REPLACE NONEDITIONABLE FUNCTION "SYS"."XMLSEQUENCEFROMXMLTYPE" (doc in sys.XMLType)
       return sys.XMLSequenceType authid current_user deterministic
pipelined using XMLSeq_Imp_t;
/

CREATE OR REPLACE NONEDITIONABLE FUNCTION "SYS"."XQSEQUENCEFROMXMLTYPE" (doc in sys.XMLType)
       return sys.XMLSequenceType authid current_user deterministic
pipelined using XQSeq_Imp_t;
/

CREATE OR REPLACE NONEDITIONABLE FUNCTION "SYS"."XQWINDOWSEQUENCEFROMXMLTYPE" (doc in sys.XMLType,
        flag in number, startexpr in varchar2, endexpr in varchar2,
        curItem in sys.XMLType, prevItem in sys.XMLType,
        nextItem in sys.XMLType, position in sys.XMLType,
        ecurItem in sys.XMLType, eprevItem in sys.XMLType,
        enextItem in sys.XMLType, eposition in sys.XMLType
        )
        return sys.XMLSequenceType authid current_user
 pipelined using XQWindowSeq_Imp_t;
/


ALTER FUNCTION "SYS"."GETLONG"
  COMPILE
    PLSQL_OPTIMIZE_LEVEL=  2
    PLSQL_CODE_TYPE=  INTERPRETED
    PLSQL_DEBUG=  FALSE    PLSCOPE_SETTINGS=  'IDENTIFIERS:NONE'

 REUSE SETTINGS TIMESTAMP '2014-07-07 05:44:20'
/


ALTER FUNCTION "SYS"."GETTVOID"
  COMPILE
    PLSQL_OPTIMIZE_LEVEL=  2
    PLSQL_CODE_TYPE=  INTERPRETED
    PLSQL_DEBUG=  FALSE    PLSCOPE_SETTINGS=  'IDENTIFIERS:NONE'

 REUSE SETTINGS TIMESTAMP '2014-07-07 05:42:55'
/


ALTER FUNCTION "SYS"."XMLSEQUENCEFROMXMLTYPE"
  COMPILE
    PLSQL_OPTIMIZE_LEVEL=  2
    PLSQL_CODE_TYPE=  INTERPRETED
    PLSQL_DEBUG=  FALSE    PLSCOPE_SETTINGS=  'IDENTIFIERS:NONE'

 REUSE SETTINGS TIMESTAMP '2014-07-07 05:42:55'
/


ALTER FUNCTION "SYS"."XQSEQUENCEFROMXMLTYPE"
  COMPILE
    PLSQL_OPTIMIZE_LEVEL=  2
    PLSQL_CODE_TYPE=  INTERPRETED
    PLSQL_DEBUG=  FALSE    PLSCOPE_SETTINGS=  'IDENTIFIERS:NONE'

 REUSE SETTINGS TIMESTAMP '2014-07-07 05:42:55'
/


ALTER FUNCTION "SYS"."XMLSEQUENCEFROMREFCURSOR"
  COMPILE
    PLSQL_OPTIMIZE_LEVEL=  2
    PLSQL_CODE_TYPE=  INTERPRETED
    PLSQL_DEBUG=  FALSE    PLSCOPE_SETTINGS=  'IDENTIFIERS:NONE'

 REUSE SETTINGS TIMESTAMP '2014-07-07 05:42:55'
/


ALTER FUNCTION "SYS"."XMLSEQUENCEFROMREFCURSOR2"
  COMPILE
    PLSQL_OPTIMIZE_LEVEL=  2
    PLSQL_CODE_TYPE=  INTERPRETED
    PLSQL_DEBUG=  FALSE    PLSCOPE_SETTINGS=  'IDENTIFIERS:NONE'

 REUSE SETTINGS TIMESTAMP '2014-07-07 05:42:55'
/


ALTER FUNCTION "SYS"."SYS_IXMLAGG"
  COMPILE
    PLSQL_OPTIMIZE_LEVEL=  2
    PLSQL_CODE_TYPE=  INTERPRETED
    PLSQL_DEBUG=  FALSE    PLSCOPE_SETTINGS=  'IDENTIFIERS:NONE'

 REUSE SETTINGS TIMESTAMP '2014-07-07 05:42:55'
/


ALTER FUNCTION "SYS"."SYS_XMLAGG"
  COMPILE
    PLSQL_OPTIMIZE_LEVEL=  2
    PLSQL_CODE_TYPE=  INTERPRETED
    PLSQL_DEBUG=  FALSE    PLSCOPE_SETTINGS=  'IDENTIFIERS:NONE'

 REUSE SETTINGS TIMESTAMP '2014-07-07 05:42:55'
/


ALTER FUNCTION "SYS"."SYS_IXQAGG"
  COMPILE
    PLSQL_OPTIMIZE_LEVEL=  2
    PLSQL_CODE_TYPE=  INTERPRETED
    PLSQL_DEBUG=  FALSE    PLSCOPE_SETTINGS=  'IDENTIFIERS:NONE'

 REUSE SETTINGS TIMESTAMP '2014-07-07 05:42:55'
/


ALTER FUNCTION "SYS"."XQWINDOWSEQUENCEFROMXMLTYPE"
  COMPILE
    PLSQL_OPTIMIZE_LEVEL=  2
    PLSQL_CODE_TYPE=  INTERPRETED
    PLSQL_DEBUG=  FALSE    PLSCOPE_SETTINGS=  'IDENTIFIERS:NONE'

 REUSE SETTINGS TIMESTAMP '2014-07-07 05:42:55'
/


ALTER FUNCTION "SYS"."SYS_IXQAGGSUM"
  COMPILE
    PLSQL_OPTIMIZE_LEVEL=  2
    PLSQL_CODE_TYPE=  INTERPRETED
    PLSQL_DEBUG=  FALSE    PLSCOPE_SETTINGS=  'IDENTIFIERS:NONE'

 REUSE SETTINGS TIMESTAMP '2014-07-07 05:42:55'
/


ALTER FUNCTION "SYS"."SYS_IXQAGGAVG"
  COMPILE
    PLSQL_OPTIMIZE_LEVEL=  2
    PLSQL_CODE_TYPE=  INTERPRETED
    PLSQL_DEBUG=  FALSE    PLSCOPE_SETTINGS=  'IDENTIFIERS:NONE'

 REUSE SETTINGS TIMESTAMP '2014-07-07 05:42:56'
/


ALTER FUNCTION "SYS"."MVAGGRAWBITOR"
  COMPILE
    PLSQL_OPTIMIZE_LEVEL=  2
    PLSQL_CODE_TYPE=  INTERPRETED
    PLSQL_DEBUG=  FALSE    PLSCOPE_SETTINGS=  'IDENTIFIERS:NONE'

 REUSE SETTINGS TIMESTAMP '2014-07-07 05:42:57'
/


ALTER FUNCTION "SYS"."GET_MAX_CHECKPOINT"
  COMPILE
    PLSQL_OPTIMIZE_LEVEL=  2
    PLSQL_CODE_TYPE=  INTERPRETED
    PLSQL_DEBUG=  FALSE    PLSCOPE_SETTINGS=  'IDENTIFIERS:NONE'

 REUSE SETTINGS TIMESTAMP '2014-07-07 05:43:49'
/


ALTER FUNCTION "SYS"."ORA_COMPLEXITY_CHECK"
  COMPILE
    PLSQL_OPTIMIZE_LEVEL=  2
    PLSQL_CODE_TYPE=  INTERPRETED
    PLSQL_DEBUG=  FALSE    PLSCOPE_SETTINGS=  'IDENTIFIERS:NONE'

 REUSE SETTINGS TIMESTAMP '2014-07-07 05:43:56'
/


ALTER FUNCTION "SYS"."ORA_STRING_DISTANCE"
  COMPILE
    PLSQL_OPTIMIZE_LEVEL=  2
    PLSQL_CODE_TYPE=  INTERPRETED
    PLSQL_DEBUG=  FALSE    PLSCOPE_SETTINGS=  'IDENTIFIERS:NONE'

 REUSE SETTINGS TIMESTAMP '2014-07-07 05:43:56'
/


ALTER FUNCTION "SYS"."ORA12C_STRONG_VERIFY_FUNCTION"
  COMPILE
    PLSQL_OPTIMIZE_LEVEL=  2
    PLSQL_CODE_TYPE=  INTERPRETED
    PLSQL_DEBUG=  FALSE    PLSCOPE_SETTINGS=  'IDENTIFIERS:NONE'

 REUSE SETTINGS TIMESTAMP '2014-07-07 05:43:56'
/


ALTER FUNCTION "SYS"."GET_REALM_PARAMETERS"
  COMPILE
    PLSQL_OPTIMIZE_LEVEL=  2
    PLSQL_CODE_TYPE=  INTERPRETED
    PLSQL_DEBUG=  FALSE    PLSCOPE_SETTINGS=  'IDENTIFIERS:NONE'

 REUSE SETTINGS TIMESTAMP '2014-07-07 05:44:06'
/


ALTER FUNCTION "SYS"."GRANTPATH_TO_STRING"
  COMPILE
    PLSQL_OPTIMIZE_LEVEL=  2
    PLSQL_CODE_TYPE=  INTERPRETED
    PLSQL_DEBUG=  FALSE    PLSCOPE_SETTINGS=  'IDENTIFIERS:NONE'

 REUSE SETTINGS TIMESTAMP '2014-07-07 05:44:11'
/


ALTER FUNCTION "SYS"."STRING_TO_GRANTPATH"
  COMPILE
    PLSQL_OPTIMIZE_LEVEL=  2
    PLSQL_CODE_TYPE=  INTERPRETED
    PLSQL_DEBUG=  FALSE    PLSCOPE_SETTINGS=  'IDENTIFIERS:NONE'

 REUSE SETTINGS TIMESTAMP '2014-07-07 05:44:11'
/


ALTER FUNCTION "SYS"."SCHEDULER$_BATCHERR_PIPE"
  COMPILE
    PLSQL_OPTIMIZE_LEVEL=  2
    PLSQL_CODE_TYPE=  INTERPRETED
    PLSQL_DEBUG=  FALSE    PLSCOPE_SETTINGS=  'IDENTIFIERS:NONE'

 REUSE SETTINGS TIMESTAMP '2014-07-07 05:44:13'
/


ALTER FUNCTION "SYS"."GET_OLDVERSION_HASHCODE"
  COMPILE
    PLSQL_OPTIMIZE_LEVEL=  2
    PLSQL_CODE_TYPE=  INTERPRETED
    PLSQL_DEBUG=  FALSE    PLSCOPE_SETTINGS=  'IDENTIFIERS:NONE'

 REUSE SETTINGS TIMESTAMP '2014-07-07 05:44:19'
/


ALTER FUNCTION "SYS"."GET_OLDVERSION_HASHCODE2"
  COMPILE
    PLSQL_OPTIMIZE_LEVEL=  2
    PLSQL_CODE_TYPE=  INTERPRETED
    PLSQL_DEBUG=  FALSE    PLSCOPE_SETTINGS=  'IDENTIFIERS:NONE'

 REUSE SETTINGS TIMESTAMP '2014-07-07 05:44:19'
/


ALTER FUNCTION "SYS"."TIMESTAMP_TO_SCN"
  COMPILE
    PLSQL_OPTIMIZE_LEVEL=  2
    PLSQL_CODE_TYPE=  INTERPRETED
    PLSQL_DEBUG=  FALSE    PLSCOPE_SETTINGS=  'IDENTIFIERS:NONE'

 REUSE SETTINGS TIMESTAMP '2014-07-07 05:44:32'
/


ALTER FUNCTION "SYS"."SCN_TO_TIMESTAMP"
  COMPILE
    PLSQL_OPTIMIZE_LEVEL=  2
    PLSQL_CODE_TYPE=  INTERPRETED
    PLSQL_DEBUG=  FALSE    PLSCOPE_SETTINGS=  'IDENTIFIERS:NONE'

 REUSE SETTINGS TIMESTAMP '2014-07-07 05:44:32'
/


ALTER FUNCTION "SYS"."SPACE_ERROR_INFO"
  COMPILE
    PLSQL_OPTIMIZE_LEVEL=  2
    PLSQL_CODE_TYPE=  INTERPRETED
    PLSQL_DEBUG=  FALSE    PLSCOPE_SETTINGS=  'IDENTIFIERS:NONE'

 REUSE SETTINGS TIMESTAMP '2014-07-07 05:44:35'
/


ALTER FUNCTION "SYS"."SYS_NT_COLLECT"
  COMPILE
    PLSQL_OPTIMIZE_LEVEL=  2
    PLSQL_CODE_TYPE=  INTERPRETED
    PLSQL_DEBUG=  FALSE    PLSCOPE_SETTINGS=  'IDENTIFIERS:NONE'

 REUSE SETTINGS TIMESTAMP '2014-07-07 05:44:35'
/


ALTER FUNCTION "SYS"."TSDP$VALIDATION_CHECK"
  COMPILE
    PLSQL_OPTIMIZE_LEVEL=  2
    PLSQL_CODE_TYPE=  INTERPRETED
    PLSQL_DEBUG=  FALSE    PLSCOPE_SETTINGS=  'IDENTIFIERS:NONE'

 REUSE SETTINGS TIMESTAMP '2014-07-07 05:45:01'
/


ALTER FUNCTION "SYS"."GET_STATS_EXTENSION"
  COMPILE
    PLSQL_OPTIMIZE_LEVEL=  2
    PLSQL_CODE_TYPE=  INTERPRETED
    PLSQL_DEBUG=  FALSE    PLSCOPE_SETTINGS=  'IDENTIFIERS:NONE'

 REUSE SETTINGS TIMESTAMP '2014-07-07 05:45:17'
/


ALTER FUNCTION "SYS"."HAEN_TXFM_TEXT"
  COMPILE
    PLSQL_OPTIMIZE_LEVEL=  2
    PLSQL_CODE_TYPE=  INTERPRETED
    PLSQL_DEBUG=  FALSE    PLSCOPE_SETTINGS=  'IDENTIFIERS:NONE'

 REUSE SETTINGS TIMESTAMP '2014-07-07 05:45:21'
/


ALTER FUNCTION "SYS"."V_LISTBACKUPPIPE"
  COMPILE
    PLSQL_OPTIMIZE_LEVEL=  2
    PLSQL_CODE_TYPE=  INTERPRETED
    PLSQL_DEBUG=  FALSE    PLSCOPE_SETTINGS=  'IDENTIFIERS:NONE'

 REUSE SETTINGS TIMESTAMP '2014-07-07 05:45:23'
/


ALTER FUNCTION "SYS"."V_LISTRSRANGEPIPE"
  COMPILE
    PLSQL_OPTIMIZE_LEVEL=  2
    PLSQL_CODE_TYPE=  INTERPRETED
    PLSQL_DEBUG=  FALSE    PLSCOPE_SETTINGS=  'IDENTIFIERS:NONE'

 REUSE SETTINGS TIMESTAMP '2014-07-07 05:45:23'
/


ALTER FUNCTION "SYS"."SYSEVENT"
  COMPILE
    PLSQL_OPTIMIZE_LEVEL=  2
    PLSQL_CODE_TYPE=  INTERPRETED
    PLSQL_DEBUG=  FALSE    PLSCOPE_SETTINGS=  'IDENTIFIERS:NONE'

 REUSE SETTINGS TIMESTAMP '2014-07-07 05:45:26'
/


ALTER FUNCTION "SYS"."DICTIONARY_OBJ_TYPE"
  COMPILE
    PLSQL_OPTIMIZE_LEVEL=  2
    PLSQL_CODE_TYPE=  INTERPRETED
    PLSQL_DEBUG=  FALSE    PLSCOPE_SETTINGS=  'IDENTIFIERS:NONE'

 REUSE SETTINGS TIMESTAMP '2014-07-07 05:45:26'
/


ALTER FUNCTION "SYS"."DICTIONARY_OBJ_OWNER"
  COMPILE
    PLSQL_OPTIMIZE_LEVEL=  2
    PLSQL_CODE_TYPE=  INTERPRETED
    PLSQL_DEBUG=  FALSE    PLSCOPE_SETTINGS=  'IDENTIFIERS:NONE'

 REUSE SETTINGS TIMESTAMP '2014-07-07 05:45:26'
/


ALTER FUNCTION "SYS"."DICTIONARY_OBJ_NAME"
  COMPILE
    PLSQL_OPTIMIZE_LEVEL=  2
    PLSQL_CODE_TYPE=  INTERPRETED
    PLSQL_DEBUG=  FALSE    PLSCOPE_SETTINGS=  'IDENTIFIERS:NONE'

 REUSE SETTINGS TIMESTAMP '2014-07-07 05:45:26'
/


ALTER FUNCTION "SYS"."DATABASE_NAME"
  COMPILE
    PLSQL_OPTIMIZE_LEVEL=  2
    PLSQL_CODE_TYPE=  INTERPRETED
    PLSQL_DEBUG=  FALSE    PLSCOPE_SETTINGS=  'IDENTIFIERS:NONE'

 REUSE SETTINGS TIMESTAMP '2014-07-07 05:45:26'
/


ALTER FUNCTION "SYS"."INSTANCE_NUM"
  COMPILE
    PLSQL_OPTIMIZE_LEVEL=  2
    PLSQL_CODE_TYPE=  INTERPRETED
    PLSQL_DEBUG=  FALSE    PLSCOPE_SETTINGS=  'IDENTIFIERS:NONE'

 REUSE SETTINGS TIMESTAMP '2014-07-07 05:45:26'
/


ALTER FUNCTION "SYS"."LOGIN_USER"
  COMPILE
    PLSQL_OPTIMIZE_LEVEL=  2
    PLSQL_CODE_TYPE=  INTERPRETED
    PLSQL_DEBUG=  FALSE    PLSCOPE_SETTINGS=  'IDENTIFIERS:NONE'

 REUSE SETTINGS TIMESTAMP '2014-07-07 05:45:26'
/


ALTER FUNCTION "SYS"."IS_SERVERERROR"
  COMPILE
    PLSQL_OPTIMIZE_LEVEL=  2
    PLSQL_CODE_TYPE=  INTERPRETED
    PLSQL_DEBUG=  FALSE    PLSCOPE_SETTINGS=  'IDENTIFIERS:NONE'

 REUSE SETTINGS TIMESTAMP '2014-07-07 05:45:26'
/


ALTER FUNCTION "SYS"."SERVER_ERROR"
  COMPILE
    PLSQL_OPTIMIZE_LEVEL=  2
    PLSQL_CODE_TYPE=  INTERPRETED
    PLSQL_DEBUG=  FALSE    PLSCOPE_SETTINGS=  'IDENTIFIERS:NONE'

 REUSE SETTINGS TIMESTAMP '2014-07-07 05:45:26'
/


ALTER FUNCTION "SYS"."DES_ENCRYPTED_PASSWORD"
  COMPILE
    PLSQL_OPTIMIZE_LEVEL=  2
    PLSQL_CODE_TYPE=  INTERPRETED
    PLSQL_DEBUG=  FALSE    PLSCOPE_SETTINGS=  'IDENTIFIERS:NONE'

 REUSE SETTINGS TIMESTAMP '2014-07-07 05:45:26'
/


ALTER FUNCTION "SYS"."IS_ALTER_COLUMN"
  COMPILE
    PLSQL_OPTIMIZE_LEVEL=  2
    PLSQL_CODE_TYPE=  INTERPRETED
    PLSQL_DEBUG=  FALSE    PLSCOPE_SETTINGS=  'IDENTIFIERS:NONE'

 REUSE SETTINGS TIMESTAMP '2014-07-07 05:45:26'
/


ALTER FUNCTION "SYS"."IS_DROP_COLUMN"
  COMPILE
    PLSQL_OPTIMIZE_LEVEL=  2
    PLSQL_CODE_TYPE=  INTERPRETED
    PLSQL_DEBUG=  FALSE    PLSCOPE_SETTINGS=  'IDENTIFIERS:NONE'

 REUSE SETTINGS TIMESTAMP '2014-07-07 05:45:26'
/


ALTER FUNCTION "SYS"."GRANTEE"
  COMPILE
    PLSQL_OPTIMIZE_LEVEL=  2
    PLSQL_CODE_TYPE=  INTERPRETED
    PLSQL_DEBUG=  FALSE    PLSCOPE_SETTINGS=  'IDENTIFIERS:NONE'

 REUSE SETTINGS TIMESTAMP '2014-07-07 05:45:26'
/


ALTER FUNCTION "SYS"."REVOKEE"
  COMPILE
    PLSQL_OPTIMIZE_LEVEL=  2
    PLSQL_CODE_TYPE=  INTERPRETED
    PLSQL_DEBUG=  FALSE    PLSCOPE_SETTINGS=  'IDENTIFIERS:NONE'

 REUSE SETTINGS TIMESTAMP '2014-07-07 05:45:26'
/


ALTER FUNCTION "SYS"."PRIVILEGE_LIST"
  COMPILE
    PLSQL_OPTIMIZE_LEVEL=  2
    PLSQL_CODE_TYPE=  INTERPRETED
    PLSQL_DEBUG=  FALSE    PLSCOPE_SETTINGS=  'IDENTIFIERS:NONE'

 REUSE SETTINGS TIMESTAMP '2014-07-07 05:45:26'
/


ALTER FUNCTION "SYS"."WITH_GRANT_OPTION"
  COMPILE
    PLSQL_OPTIMIZE_LEVEL=  2
    PLSQL_CODE_TYPE=  INTERPRETED
    PLSQL_DEBUG=  FALSE    PLSCOPE_SETTINGS=  'IDENTIFIERS:NONE'

 REUSE SETTINGS TIMESTAMP '2014-07-07 05:45:26'
/


ALTER FUNCTION "SYS"."DICTIONARY_OBJ_OWNER_LIST"
  COMPILE
    PLSQL_OPTIMIZE_LEVEL=  2
    PLSQL_CODE_TYPE=  INTERPRETED
    PLSQL_DEBUG=  FALSE    PLSCOPE_SETTINGS=  'IDENTIFIERS:NONE'

 REUSE SETTINGS TIMESTAMP '2014-07-07 05:45:26'
/


ALTER FUNCTION "SYS"."DICTIONARY_OBJ_NAME_LIST"
  COMPILE
    PLSQL_OPTIMIZE_LEVEL=  2
    PLSQL_CODE_TYPE=  INTERPRETED
    PLSQL_DEBUG=  FALSE    PLSCOPE_SETTINGS=  'IDENTIFIERS:NONE'

 REUSE SETTINGS TIMESTAMP '2014-07-07 05:45:26'
/


ALTER FUNCTION "SYS"."IS_CREATING_NESTED_TABLE"
  COMPILE
    PLSQL_OPTIMIZE_LEVEL=  2
    PLSQL_CODE_TYPE=  INTERPRETED
    PLSQL_DEBUG=  FALSE    PLSCOPE_SETTINGS=  'IDENTIFIERS:NONE'

 REUSE SETTINGS TIMESTAMP '2014-07-07 05:45:26'
/


ALTER FUNCTION "SYS"."CLIENT_IP_ADDRESS"
  COMPILE
    PLSQL_OPTIMIZE_LEVEL=  2
    PLSQL_CODE_TYPE=  INTERPRETED
    PLSQL_DEBUG=  FALSE    PLSCOPE_SETTINGS=  'IDENTIFIERS:NONE'

 REUSE SETTINGS TIMESTAMP '2014-07-07 05:45:26'
/


ALTER FUNCTION "SYS"."SQL_TXT"
  COMPILE
    PLSQL_OPTIMIZE_LEVEL=  2
    PLSQL_CODE_TYPE=  INTERPRETED
    PLSQL_DEBUG=  FALSE    PLSCOPE_SETTINGS=  'IDENTIFIERS:NONE'

 REUSE SETTINGS TIMESTAMP '2014-07-07 05:45:26'
/


ALTER FUNCTION "SYS"."ORIGINAL_SQL_TXT"
  COMPILE
    PLSQL_OPTIMIZE_LEVEL=  2
    PLSQL_CODE_TYPE=  INTERPRETED
    PLSQL_DEBUG=  FALSE    PLSCOPE_SETTINGS=  'IDENTIFIERS:NONE'

 REUSE SETTINGS TIMESTAMP '2014-07-07 05:45:26'
/


ALTER FUNCTION "SYS"."SERVER_ERROR_MSG"
  COMPILE
    PLSQL_OPTIMIZE_LEVEL=  2
    PLSQL_CODE_TYPE=  INTERPRETED
    PLSQL_DEBUG=  FALSE    PLSCOPE_SETTINGS=  'IDENTIFIERS:NONE'

 REUSE SETTINGS TIMESTAMP '2014-07-07 05:45:26'
/


ALTER FUNCTION "SYS"."SERVER_ERROR_DEPTH"
  COMPILE
    PLSQL_OPTIMIZE_LEVEL=  2
    PLSQL_CODE_TYPE=  INTERPRETED
    PLSQL_DEBUG=  FALSE    PLSCOPE_SETTINGS=  'IDENTIFIERS:NONE'

 REUSE SETTINGS TIMESTAMP '2014-07-07 05:45:26'
/


ALTER FUNCTION "SYS"."SERVER_ERROR_NUM_PARAMS"
  COMPILE
    PLSQL_OPTIMIZE_LEVEL=  2
    PLSQL_CODE_TYPE=  INTERPRETED
    PLSQL_DEBUG=  FALSE    PLSCOPE_SETTINGS=  'IDENTIFIERS:NONE'

 REUSE SETTINGS TIMESTAMP '2014-07-07 05:45:26'
/


ALTER FUNCTION "SYS"."PARTITION_POS"
  COMPILE
    PLSQL_OPTIMIZE_LEVEL=  2
    PLSQL_CODE_TYPE=  INTERPRETED
    PLSQL_DEBUG=  FALSE    PLSCOPE_SETTINGS=  'IDENTIFIERS:NONE'

 REUSE SETTINGS TIMESTAMP '2014-07-07 05:45:26'
/


ALTER FUNCTION "SYS"."SERVER_ERROR_PARAM"
  COMPILE
    PLSQL_OPTIMIZE_LEVEL=  2
    PLSQL_CODE_TYPE=  INTERPRETED
    PLSQL_DEBUG=  FALSE    PLSCOPE_SETTINGS=  'IDENTIFIERS:NONE'

 REUSE SETTINGS TIMESTAMP '2014-07-07 05:45:26'
/


ALTER FUNCTION "SYS"."AQ$_GET_SUBSCRIBERS"
  COMPILE
    PLSQL_OPTIMIZE_LEVEL=  2
    PLSQL_CODE_TYPE=  INTERPRETED
    PLSQL_DEBUG=  FALSE    PLSCOPE_SETTINGS=  'IDENTIFIERS:NONE'

 REUSE SETTINGS TIMESTAMP '2014-07-07 05:45:31'
/


ALTER FUNCTION "SYS"."LOGMNR$ALWSUPLOG_TABF_PUBLIC"
  COMPILE
    PLSQL_OPTIMIZE_LEVEL=  2
    PLSQL_CODE_TYPE=  INTERPRETED
    PLSQL_DEBUG=  FALSE    PLSCOPE_SETTINGS=  'IDENTIFIERS:NONE'

 REUSE SETTINGS TIMESTAMP '2014-07-07 05:45:45'
/


ALTER FUNCTION "SYS"."KUPC$_TAB_MT_COLS"
  COMPILE
    PLSQL_OPTIMIZE_LEVEL=  2
    PLSQL_CODE_TYPE=  INTERPRETED
    PLSQL_DEBUG=  FALSE    PLSCOPE_SETTINGS=  'IDENTIFIERS:NONE'

 REUSE SETTINGS TIMESTAMP '2014-07-07 05:45:48'
/


ALTER FUNCTION "SYS"."LOGSTDBY$TABF"
  COMPILE
    PLSQL_OPTIMIZE_LEVEL=  2
    PLSQL_CODE_TYPE=  INTERPRETED
    PLSQL_DEBUG=  FALSE    PLSCOPE_SETTINGS=  'IDENTIFIERS:NONE'

 REUSE SETTINGS TIMESTAMP '2014-07-07 05:45:50'
/


ALTER FUNCTION "SYS"."LOGSTDBY$UTABF"
  COMPILE
    PLSQL_OPTIMIZE_LEVEL=  2
    PLSQL_CODE_TYPE=  INTERPRETED
    PLSQL_DEBUG=  FALSE    PLSCOPE_SETTINGS=  'IDENTIFIERS:NONE'

 REUSE SETTINGS TIMESTAMP '2014-07-07 05:45:50'
/


ALTER FUNCTION "SYS"."SYS$RAWTOANY"
  COMPILE
    PLSQL_OPTIMIZE_LEVEL=  2
    PLSQL_CODE_TYPE=  INTERPRETED
    PLSQL_DEBUG=  FALSE    PLSCOPE_SETTINGS=  'IDENTIFIERS:NONE'

 REUSE SETTINGS TIMESTAMP '2014-07-07 05:49:58'
/


ALTER FUNCTION "SYS"."ORA_FI_DECISION_TREE_HORIZ"
  COMPILE
    PLSQL_OPTIMIZE_LEVEL=  2
    PLSQL_CODE_TYPE=  INTERPRETED
    PLSQL_DEBUG=  FALSE    PLSCOPE_SETTINGS=  'IDENTIFIERS:NONE'

 REUSE SETTINGS TIMESTAMP '2014-07-07 05:50:04'
/


ALTER FUNCTION "SYS"."ORA_FI_SUPERVISED_BINNING"
  COMPILE
    PLSQL_OPTIMIZE_LEVEL=  2
    PLSQL_CODE_TYPE=  INTERPRETED
    PLSQL_DEBUG=  FALSE    PLSCOPE_SETTINGS=  'IDENTIFIERS:NONE'

 REUSE SETTINGS TIMESTAMP '2014-07-07 05:50:04'
/


ALTER FUNCTION "SYS"."ORA_FI_EXP_MAX"
  COMPILE
    PLSQL_OPTIMIZE_LEVEL=  2
    PLSQL_CODE_TYPE=  INTERPRETED
    PLSQL_DEBUG=  FALSE    PLSCOPE_SETTINGS=  'IDENTIFIERS:NONE'

 REUSE SETTINGS TIMESTAMP '2014-07-07 05:50:04'
/


ALTER FUNCTION "SYS"."LOGMNR_GET_GT_PROTOCOL"
  COMPILE
    PLSQL_OPTIMIZE_LEVEL=  2
    PLSQL_CODE_TYPE=  INTERPRETED
    PLSQL_DEBUG=  FALSE    PLSCOPE_SETTINGS=  'IDENTIFIERS:NONE'

 REUSE SETTINGS TIMESTAMP '2014-07-07 05:50:21'
/


ALTER FUNCTION "SYS"."DM_SVM_BUILD"
  COMPILE
    PLSQL_OPTIMIZE_LEVEL=  2
    PLSQL_CODE_TYPE=  INTERPRETED
    PLSQL_DEBUG=  FALSE    PLSCOPE_SETTINGS=  'IDENTIFIERS:NONE'

 REUSE SETTINGS TIMESTAMP '2014-07-07 05:51:26'
/


ALTER FUNCTION "SYS"."DM_SVM_APPLY"
  COMPILE
    PLSQL_OPTIMIZE_LEVEL=  2
    PLSQL_CODE_TYPE=  INTERPRETED
    PLSQL_DEBUG=  FALSE    PLSCOPE_SETTINGS=  'IDENTIFIERS:NONE'

 REUSE SETTINGS TIMESTAMP '2014-07-07 05:51:26'
/


ALTER FUNCTION "SYS"."DM_NMF_BUILD"
  COMPILE
    PLSQL_OPTIMIZE_LEVEL=  2
    PLSQL_CODE_TYPE=  INTERPRETED
    PLSQL_DEBUG=  FALSE    PLSCOPE_SETTINGS=  'IDENTIFIERS:NONE'

 REUSE SETTINGS TIMESTAMP '2014-07-07 05:51:26'
/


ALTER FUNCTION "SYS"."DM_MOD_BUILD"
  COMPILE
    PLSQL_OPTIMIZE_LEVEL=  2
    PLSQL_CODE_TYPE=  INTERPRETED
    PLSQL_DEBUG=  FALSE    PLSCOPE_SETTINGS=  'IDENTIFIERS:NONE'

 REUSE SETTINGS TIMESTAMP '2014-07-07 05:51:26'
/


ALTER FUNCTION "SYS"."DM_CL_BUILD"
  COMPILE
    PLSQL_OPTIMIZE_LEVEL=  2
    PLSQL_CODE_TYPE=  INTERPRETED
    PLSQL_DEBUG=  FALSE    PLSCOPE_SETTINGS=  'IDENTIFIERS:NONE'

 REUSE SETTINGS TIMESTAMP '2014-07-07 05:51:26'
/


ALTER FUNCTION "SYS"."DM_CL_APPLY"
  COMPILE
    PLSQL_OPTIMIZE_LEVEL=  2
    PLSQL_CODE_TYPE=  INTERPRETED
    PLSQL_DEBUG=  FALSE    PLSCOPE_SETTINGS=  'IDENTIFIERS:NONE'

 REUSE SETTINGS TIMESTAMP '2014-07-07 05:51:26'
/


ALTER FUNCTION "SYS"."DM_GLM_BUILD"
  COMPILE
    PLSQL_OPTIMIZE_LEVEL=  2
    PLSQL_CODE_TYPE=  INTERPRETED
    PLSQL_DEBUG=  FALSE    PLSCOPE_SETTINGS=  'IDENTIFIERS:NONE'

 REUSE SETTINGS TIMESTAMP '2014-07-07 05:51:27'
/


ALTER FUNCTION "SYS"."DM_FE_BUILD"
  COMPILE
    PLSQL_OPTIMIZE_LEVEL=  2
    PLSQL_CODE_TYPE=  INTERPRETED
    PLSQL_DEBUG=  FALSE    PLSCOPE_SETTINGS=  'IDENTIFIERS:NONE'

 REUSE SETTINGS TIMESTAMP '2014-07-07 05:51:27'
/


ALTER FUNCTION "SYS"."HS$_DDTF_SQLTABLES"
  COMPILE
    PLSQL_OPTIMIZE_LEVEL=  2
    PLSQL_CODE_TYPE=  INTERPRETED
    PLSQL_DEBUG=  FALSE    PLSCOPE_SETTINGS=  'IDENTIFIERS:NONE'

 REUSE SETTINGS TIMESTAMP '2014-07-07 05:52:49'
/


ALTER FUNCTION "SYS"."HS$_DDTF_SQLCOLUMNS"
  COMPILE
    PLSQL_OPTIMIZE_LEVEL=  2
    PLSQL_CODE_TYPE=  INTERPRETED
    PLSQL_DEBUG=  FALSE    PLSCOPE_SETTINGS=  'IDENTIFIERS:NONE'

 REUSE SETTINGS TIMESTAMP '2014-07-07 05:52:49'
/


ALTER FUNCTION "SYS"."HS$_DDTF_OPTCOLUMNS"
  COMPILE
    PLSQL_OPTIMIZE_LEVEL=  2
    PLSQL_CODE_TYPE=  INTERPRETED
    PLSQL_DEBUG=  FALSE    PLSCOPE_SETTINGS=  'IDENTIFIERS:NONE'

 REUSE SETTINGS TIMESTAMP '2014-07-07 05:52:49'
/


ALTER FUNCTION "SYS"."HS$_DDTF_SQLPRIMARYKEYS"
  COMPILE
    PLSQL_OPTIMIZE_LEVEL=  2
    PLSQL_CODE_TYPE=  INTERPRETED
    PLSQL_DEBUG=  FALSE    PLSCOPE_SETTINGS=  'IDENTIFIERS:NONE'

 REUSE SETTINGS TIMESTAMP '2014-07-07 05:52:49'
/


ALTER FUNCTION "SYS"."HS$_DDTF_SQLFOREIGNKEYS"
  COMPILE
    PLSQL_OPTIMIZE_LEVEL=  2
    PLSQL_CODE_TYPE=  INTERPRETED
    PLSQL_DEBUG=  FALSE    PLSCOPE_SETTINGS=  'IDENTIFIERS:NONE'

 REUSE SETTINGS TIMESTAMP '2014-07-07 05:52:49'
/


ALTER FUNCTION "SYS"."HS$_DDTF_OPTFOREIGNKEYS"
  COMPILE
    PLSQL_OPTIMIZE_LEVEL=  2
    PLSQL_CODE_TYPE=  INTERPRETED
    PLSQL_DEBUG=  FALSE    PLSCOPE_SETTINGS=  'IDENTIFIERS:NONE'

 REUSE SETTINGS TIMESTAMP '2014-07-07 05:52:49'
/


ALTER FUNCTION "SYS"."HS$_DDTF_SQLPROCEDURES"
  COMPILE
    PLSQL_OPTIMIZE_LEVEL=  2
    PLSQL_CODE_TYPE=  INTERPRETED
    PLSQL_DEBUG=  FALSE    PLSCOPE_SETTINGS=  'IDENTIFIERS:NONE'

 REUSE SETTINGS TIMESTAMP '2014-07-07 05:52:49'
/


ALTER FUNCTION "SYS"."HS$_DDTF_OPTPROCEDURES"
  COMPILE
    PLSQL_OPTIMIZE_LEVEL=  2
    PLSQL_CODE_TYPE=  INTERPRETED
    PLSQL_DEBUG=  FALSE    PLSCOPE_SETTINGS=  'IDENTIFIERS:NONE'

 REUSE SETTINGS TIMESTAMP '2014-07-07 05:52:49'
/


ALTER FUNCTION "SYS"."HS$_DDTF_SQLSTATISTICS"
  COMPILE
    PLSQL_OPTIMIZE_LEVEL=  2
    PLSQL_CODE_TYPE=  INTERPRETED
    PLSQL_DEBUG=  FALSE    PLSCOPE_SETTINGS=  'IDENTIFIERS:NONE'

 REUSE SETTINGS TIMESTAMP '2014-07-07 05:52:49'
/


ALTER FUNCTION "SYS"."HS$_DDTF_OPTSTATISTICS"
  COMPILE
    PLSQL_OPTIMIZE_LEVEL=  2
    PLSQL_CODE_TYPE=  INTERPRETED
    PLSQL_DEBUG=  FALSE    PLSCOPE_SETTINGS=  'IDENTIFIERS:NONE'

 REUSE SETTINGS TIMESTAMP '2014-07-07 05:52:49'
/


ALTER FUNCTION "SYS"."HS$_DDTF_SQLTABPRIKEYS"
  COMPILE
    PLSQL_OPTIMIZE_LEVEL=  2
    PLSQL_CODE_TYPE=  INTERPRETED
    PLSQL_DEBUG=  FALSE    PLSCOPE_SETTINGS=  'IDENTIFIERS:NONE'

 REUSE SETTINGS TIMESTAMP '2014-07-07 05:52:49'
/


ALTER FUNCTION "SYS"."HS$_DDTF_OPTTABPRIKEYS"
  COMPILE
    PLSQL_OPTIMIZE_LEVEL=  2
    PLSQL_CODE_TYPE=  INTERPRETED
    PLSQL_DEBUG=  FALSE    PLSCOPE_SETTINGS=  'IDENTIFIERS:NONE'

 REUSE SETTINGS TIMESTAMP '2014-07-07 05:52:49'
/


ALTER FUNCTION "SYS"."HS$_DDTF_SQLTABFORKEYS"
  COMPILE
    PLSQL_OPTIMIZE_LEVEL=  2
    PLSQL_CODE_TYPE=  INTERPRETED
    PLSQL_DEBUG=  FALSE    PLSCOPE_SETTINGS=  'IDENTIFIERS:NONE'

 REUSE SETTINGS TIMESTAMP '2014-07-07 05:52:50'
/


ALTER FUNCTION "SYS"."HS$_DDTF_OPTTABFORKEYS"
  COMPILE
    PLSQL_OPTIMIZE_LEVEL=  2
    PLSQL_CODE_TYPE=  INTERPRETED
    PLSQL_DEBUG=  FALSE    PLSCOPE_SETTINGS=  'IDENTIFIERS:NONE'

 REUSE SETTINGS TIMESTAMP '2014-07-07 05:52:50'
/


ALTER FUNCTION "SYS"."HS$_DDTF_SQLTABSTATS"
  COMPILE
    PLSQL_OPTIMIZE_LEVEL=  2
    PLSQL_CODE_TYPE=  INTERPRETED
    PLSQL_DEBUG=  FALSE    PLSCOPE_SETTINGS=  'IDENTIFIERS:NONE'

 REUSE SETTINGS TIMESTAMP '2014-07-07 05:52:50'
/


ALTER FUNCTION "SYS"."HS$_DDTF_OPTTABSTATS"
  COMPILE
    PLSQL_OPTIMIZE_LEVEL=  2
    PLSQL_CODE_TYPE=  INTERPRETED
    PLSQL_DEBUG=  FALSE    PLSCOPE_SETTINGS=  'IDENTIFIERS:NONE'

 REUSE SETTINGS TIMESTAMP '2014-07-07 05:52:50'
/


ALTER FUNCTION "SYS"."OLAP_NUMBER_SRF"
  COMPILE
    PLSQL_OPTIMIZE_LEVEL=  2
    PLSQL_CODE_TYPE=  INTERPRETED
    PLSQL_DEBUG=  FALSE    PLSCOPE_SETTINGS=  'IDENTIFIERS:NONE'

 REUSE SETTINGS TIMESTAMP '2014-07-07 05:52:55'
/


ALTER FUNCTION "SYS"."OLAP_TEXT_SRF"
  COMPILE
    PLSQL_OPTIMIZE_LEVEL=  2
    PLSQL_CODE_TYPE=  INTERPRETED
    PLSQL_DEBUG=  FALSE    PLSCOPE_SETTINGS=  'IDENTIFIERS:NONE'

 REUSE SETTINGS TIMESTAMP '2014-07-07 05:52:55'
/


ALTER FUNCTION "SYS"."OLAP_DATE_SRF"
  COMPILE
    PLSQL_OPTIMIZE_LEVEL=  2
    PLSQL_CODE_TYPE=  INTERPRETED
    PLSQL_DEBUG=  FALSE    PLSCOPE_SETTINGS=  'IDENTIFIERS:NONE'

 REUSE SETTINGS TIMESTAMP '2014-07-07 05:52:55'
/


ALTER FUNCTION "SYS"."OLAP_BOOL_SRF"
  COMPILE
    PLSQL_OPTIMIZE_LEVEL=  2
    PLSQL_CODE_TYPE=  INTERPRETED
    PLSQL_DEBUG=  FALSE    PLSCOPE_SETTINGS=  'IDENTIFIERS:NONE'

 REUSE SETTINGS TIMESTAMP '2014-07-07 05:52:55'
/


ALTER FUNCTION "SYS"."OLAP_TABLE"
  COMPILE
    PLSQL_OPTIMIZE_LEVEL=  2
    PLSQL_CODE_TYPE=  INTERPRETED
    PLSQL_DEBUG=  FALSE    PLSCOPE_SETTINGS=  'IDENTIFIERS:NONE'

 REUSE SETTINGS TIMESTAMP '2014-07-07 05:52:55'
/


ALTER FUNCTION "SYS"."CUBE_TABLE"
  COMPILE
    PLSQL_OPTIMIZE_LEVEL=  2
    PLSQL_CODE_TYPE=  INTERPRETED
    PLSQL_DEBUG=  FALSE    PLSCOPE_SETTINGS=  'IDENTIFIERS:NONE'

 REUSE SETTINGS TIMESTAMP '2014-07-07 05:52:55'
/


ALTER FUNCTION "SYS"."OLAPRC_TABLE"
  COMPILE
    PLSQL_OPTIMIZE_LEVEL=  2
    PLSQL_CODE_TYPE=  INTERPRETED
    PLSQL_DEBUG=  FALSE    PLSCOPE_SETTINGS=  'IDENTIFIERS:NONE'

 REUSE SETTINGS TIMESTAMP '2014-07-07 05:52:55'
/


ALTER FUNCTION "SYS"."OLAP_CONDITION"
  COMPILE
    PLSQL_OPTIMIZE_LEVEL=  2
    PLSQL_CODE_TYPE=  INTERPRETED
    PLSQL_DEBUG=  FALSE    PLSCOPE_SETTINGS=  'IDENTIFIERS:NONE'

 REUSE SETTINGS TIMESTAMP '2014-07-07 05:52:55'
/


ALTER FUNCTION "SYS"."IS_VPD_ENABLED"
  COMPILE
    PLSQL_OPTIMIZE_LEVEL=  2
    PLSQL_CODE_TYPE=  INTERPRETED
    PLSQL_DEBUG=  FALSE    PLSCOPE_SETTINGS=  'IDENTIFIERS:NONE'

 REUSE SETTINGS TIMESTAMP '2014-07-07 05:53:33'
/


ALTER FUNCTION "SYS"."GET_TABLE_NAME"
  COMPILE
    PLSQL_OPTIMIZE_LEVEL=  2
    PLSQL_CODE_TYPE=  INTERPRETED
    PLSQL_DEBUG=  FALSE    PLSCOPE_SETTINGS=  'IDENTIFIERS:NONE'

 REUSE SETTINGS TIMESTAMP '2014-07-07 05:53:33'
/


ALTER FUNCTION "SYS"."ISXMLTYPETABLE"
  COMPILE
    PLSQL_OPTIMIZE_LEVEL=  2
    PLSQL_CODE_TYPE=  INTERPRETED
    PLSQL_DEBUG=  FALSE    PLSCOPE_SETTINGS=  'IDENTIFIERS:NONE'

 REUSE SETTINGS TIMESTAMP '2014-07-07 05:53:33'
/


ALTER FUNCTION "SYS"."USER_XML_PARTITIONED_TABLE_OK"
  COMPILE
    PLSQL_OPTIMIZE_LEVEL=  2
    PLSQL_CODE_TYPE=  INTERPRETED
    PLSQL_DEBUG=  FALSE    PLSCOPE_SETTINGS=  'IDENTIFIERS:NONE'

 REUSE SETTINGS TIMESTAMP '2014-07-07 05:53:34'
/


ALTER FUNCTION "SYS"."CHECK_UPGRADE"
  COMPILE
    PLSQL_OPTIMIZE_LEVEL=  2
    PLSQL_CODE_TYPE=  INTERPRETED
    PLSQL_DEBUG=  FALSE    PLSCOPE_SETTINGS=  'IDENTIFIERS:NONE'

 REUSE SETTINGS TIMESTAMP '2014-07-07 05:53:34'
/


ALTER FUNCTION "SYS"."GETXMLSCHEMADEPENDENCYLIST"
  COMPILE
    PLSQL_OPTIMIZE_LEVEL=  2
    PLSQL_CODE_TYPE=  INTERPRETED
    PLSQL_DEBUG=  FALSE    PLSCOPE_SETTINGS=  'IDENTIFIERS:NONE'

 REUSE SETTINGS TIMESTAMP '2014-07-07 05:53:34'
/


ALTER FUNCTION "SYS"."STRAGG"
  COMPILE
    PLSQL_OPTIMIZE_LEVEL=  2
    PLSQL_CODE_TYPE=  INTERPRETED
    PLSQL_DEBUG=  FALSE    PLSCOPE_SETTINGS=  'IDENTIFIERS:NONE'

 REUSE SETTINGS TIMESTAMP '2014-07-07 05:53:44'
/


ALTER FUNCTION "SYS"."DBJ_LONG_NAME"
  COMPILE
    PLSQL_OPTIMIZE_LEVEL=  2
    PLSQL_CODE_TYPE=  INTERPRETED
    PLSQL_DEBUG=  FALSE    PLSCOPE_SETTINGS=  'IDENTIFIERS:NONE'

 REUSE SETTINGS TIMESTAMP '2014-07-07 06:07:28'
/


ALTER FUNCTION "SYS"."NameFromLastDDL"
  COMPILE
    PLSQL_OPTIMIZE_LEVEL=  2
    PLSQL_CODE_TYPE=  INTERPRETED
    PLSQL_DEBUG=  FALSE    PLSCOPE_SETTINGS=  'IDENTIFIERS:NONE'

 REUSE SETTINGS TIMESTAMP '2014-07-07 06:07:28'
/


ALTER FUNCTION "SYS"."DBJ_SHORT_NAME"
  COMPILE
    PLSQL_OPTIMIZE_LEVEL=  2
    PLSQL_CODE_TYPE=  INTERPRETED
    PLSQL_DEBUG=  FALSE    PLSCOPE_SETTINGS=  'IDENTIFIERS:NONE'

 REUSE SETTINGS TIMESTAMP '2014-07-07 06:07:28'
/


ALTER FUNCTION "SYS"."OLAPIBOOTSTRAP2"
  COMPILE
    PLSQL_OPTIMIZE_LEVEL=  2
    PLSQL_CODE_TYPE=  INTERPRETED
    PLSQL_DEBUG=  FALSE    PLSCOPE_SETTINGS=  'IDENTIFIERS:NONE'

 REUSE SETTINGS TIMESTAMP '2014-07-07 06:20:23'
/


ALTER FUNCTION "SYS"."INTERACTIONEXECUTE"
  COMPILE
    PLSQL_OPTIMIZE_LEVEL=  2
    PLSQL_CODE_TYPE=  INTERPRETED
    PLSQL_DEBUG=  FALSE    PLSCOPE_SETTINGS=  'IDENTIFIERS:NONE'

 REUSE SETTINGS TIMESTAMP '2014-07-07 06:20:30'
/


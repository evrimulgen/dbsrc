CREATE OR REPLACE NONEDITIONABLE FUNCTION "APEX_040200"."APEX_APPLICATION_GET_PG_TNAME" (
    p_application_id   in number,
    p_page_id  in number)
    return varchar2
is
    r varchar2(255) := null;
begin
    for c1 in (
       select process_sql_clob
       from   wwv_flow_step_processing p,
              wwv_flows f,
              wwv_flow_companies w,
              (select nvl(v('FLOW_SECURITY_GROUP_ID'),0) sgid from sys.dual) d
       where  (f.owner = user or user in ('SYS','SYSTEM', 'APEX_040200')  or d.sgid = f.security_group_id) and
              f.security_group_id = w.PROVISIONING_COMPANY_ID and
              f.security_group_id = p.security_group_id and
              f.id = p.flow_id and
              p.flow_id = p_application_id and
              p.flow_step_id = p_page_id and
              p.PROCESS_TYPE = 'DML_FETCH_ROW'
              ) loop
       r := sys.dbms_lob.substr(c1.process_sql_clob,255,1);
       r := substr(r,instr(r,':')+1);
       r := substr(r,1,instr(r,':')-1);
       exit;
    end loop;
    return r;
end;
/

CREATE OR REPLACE NONEDITIONABLE FUNCTION "APEX_040200"."NV" wrapped
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
a4 ca
CycvgH0iuBim62DpcSpWjnAzdSYwgy7wf8tqynTp2see0MrppEXJZndrWtvKC4V9/fVHOv0q
CT14PwDtnZ+e8Z6v+Kb2jxon02jK83Ry7kM67rzajPUbDrxihYuAJ8mvdX2a91GcyYj2M/vN
S+o8Lku7hLFxMxKizJcu75yHDTiBimOl9Yddimh+yEFnC7wQpuwPFnk=
/

CREATE OR REPLACE NONEDITIONABLE FUNCTION "APEX_040200"."V" wrapped
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
197 10b
PVSraxgy7nHZiDOC39/W4UHOdWwwgzLIr8usfC+iAP7VM0AU29bqUaE+bd8+mSlhQ7SdpfgC
CYmibuv1ThtVMf+3wCPKMK+T3dh/JwcAEazKOyPyEjubNIJqoEf6/rKjES23GVM63kdAS6tg
aBckw6+FerW2bA2zgoPg2crVOpai6VgWbf8Flsr5DAMRpWveLBPoyKfQBcuKGmoMhfC/l0P7
SP6KCg8UVajvbSRnPNrYWptbWbmQdYrZo8oNL/zr/eW5VEU=
/

CREATE OR REPLACE NONEDITIONABLE FUNCTION "APEX_040200"."VRN" wrapped
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
9a b2
anaAakaOCEpEXqPGnCAAgCaU5vkwg8eZgcfLCNL+XhbVl15QjwmmrKkwci/qD0SuJAJ8xsoX
KMbK7y5LMMj2WhEv5siZy3rWvm5xVQBzyFxEvjnOV3uYJ919fLLjLex7/OVCY62t5fx7P2si
IsrR40BSO75xc3GOFazk2Iim0pcUow==
/

CREATE OR REPLACE NONEDITIONABLE FUNCTION "APEX_040200"."WWV_FLOWS_RELEASE" wrapped
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
53 8d
5cBmDrKDvZrkytfNEyWjSq6xPBEwg8eZgcfLCNL+XhaWlm2u2fqWlkqW8tehLlbcQ57Asr2y
m17nx3TAM7h0ZQbAdIvAwDL+0oYJpuFNGkX0QfdBJkE3N0E3AkUqnApPbSodphZab64=
/

CREATE OR REPLACE NONEDITIONABLE FUNCTION "APEX_040200"."WWV_FLOWS_VERSION" wrapped
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
60 89
nPp8w1xw/C2rNUJZXIUSppPYJWUwg8eZgcfLCNL+XhaWlm2u2fqWlkqWDGLF/0dyhp7Asr2y
m17nx3TAM7h0BsB0i8DAMv7Shgmm4SHh5cNVhd1QWnLdL+N3O75xc3HYiKZlBx9N
/

CREATE OR REPLACE NONEDITIONABLE FUNCTION "APEX_040200"."WWV_FLOW_EPG_INCLUDE_MOD_LOCAL" (
    procedure_name in varchar2)
return boolean
is
begin
    return false; -- remove this statement when you modify this function
    --
    -- Administrator note: the procedure_name input parameter may be in the format:
    --
    --    procedure
    --    schema.procedure
    --    package.procedure
    --    schema.package.procedure
    --
    -- If the expected input parameter is a procedure name only, the IN list code shown below
    -- can be modified to itemize the expected procedure names. Otherwise you must parse the
    -- procedure_name parameter and replace the simple code below with code that will evaluate
    -- all of the cases listed above.
    --
    if upper(procedure_name) in (
          '') then
        return TRUE;
    else
        return FALSE;
    end if;
end wwv_flow_epg_include_mod_local;
/

CREATE OR REPLACE NONEDITIONABLE FUNCTION "APEX_040200"."WWV_FLOW_HOT_HTTP_LINKS" wrapped
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
33e 20b
ReGbUpGy+kp9LCylUkujIlZyLQcwgxDxTPYVfI5Av1UP8zShavzkBFlLXk0qg0t1pxQNGUSW
G0r6dhNHE/nObCY9YGjhAsD/E8E0wW5HwG8M8WW4evlN10iqwwVzNXkoB64NEvgwtTm8W9L6
idvVJqrnHdnjxqHb+HAYF8zcbHCtY4WXV6etnRZ6Zn5Ubu/5C6qlIWdwV8LE5hNBj604xfdl
XlLYhm29i2CzCiXfNejVcHLNIZV+0bZJVbIAmWFm7OhY6vvil95sOObAJHJlR3PlzMOnL92m
q7NL6zevlTae9suH870YNgPVUWJMbUY+ypcJXbZeGhXq0quIV7EFMgRMytdvcj+t/xGOhrZl
47a5/kUWUF2D7fl2IeF5sfy+jfbEpUKyYQ9kE8yZpwGQoAcM3G/58Eh2uFC42GIABAzLOWHU
pYtp+dQE6pCBBCfr/3FHCaD2v1v+11iQOfQxd7zWSzrDtQ/wGTe+XI4MKozea/HDK2wWOJZm
NPhElhKzGA==
/

CREATE OR REPLACE NONEDITIONABLE FUNCTION "APEX_040200"."WWV_FLOW_ITEM_COMPS" wrapped
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
36d 207
aeoXg/EfRMOxsrHlzjfH0As0lq4wg9fxcvbWfI7GvzNkMHiyjibNRSXyWydPq+P0FC0ltwct
r3Bj1vCBBiwktnjNFmOxQnxdc868u/jIoAb06KxqKdI9NDSkrtcewU5rQnscGSTdxw74lxsB
UUh9b6nAj1zzjG7kkU3UUe7MNxsNbZHxgMBgfglR4l0E9U3COCqiNDp+OksUSxn1UV8C7V11
QWJv35OxmBn7bTCLCu1lgpnDxZdQx9m5u/FQ9H+MaPIa5ubTBITtqtqUiBur08yJjUpHFS4+
FrGENcXp+4ZNA+ZEhMyQjKLOYy2t77YIzSxSapVvX6k5lKjEFqgZhGepvcxKG9dh5XlMuAXf
veSZxABmislYvPmLcfWnVb45eDREaiO7cKfJN/bKfvkPUFfEEpQ2LjeocvW5PuHQfA87pw7H
XZ3lc4zSdaegpcOU1WIAKr0b6MjISHW7+Isqk0LopSuac/V7bEZfPxGre4t2poONsnSUGRAd
Amfr5Q==
/

CREATE OR REPLACE NONEDITIONABLE FUNCTION "APEX_040200"."WWV_FLOW_LOV_USED_ON_PAGES" wrapped
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
3a7 250
j1QSse2EKB9NTAD/WJsX/a3HhvUwgxBeryeGfC/NrQ9/B+Z+5xvenEB+ETWf1PRnp19g8n2h
joO5Y35vl9+cz+Ty8naZxLpMWYvtQoK7oSY72HTq08sHKP6SYSRTxHMH+Pj5m4oznVVPsA+W
u8jw3U88PebNdg/7uL0l32z8+ojzJx4U9nzKuugKsut4Pm/skuJ6ZqvwPQAQIVduZm3RRooz
yT94cu7B7Zzz4ELTKe4s6ykhNQxxx4itDSVp1xXOX2lwAcqrqNZ5VNg85TdVSB7x5a9AcMQ1
8FBYvK7hcMBEr7nFdW1aH2d2dXbVhGFq/EKyK6B+8FIHkWuoiDn91EErtCr7E9IBzXPFKSQ7
JdRc8rRg5lgvNkmE3D1I2UbpRUD86xq3CyuimAFSp+QnYwQ1PfOWk+QHhRiWCeSHoBJ4hKcl
1XdpIhV0wC/yDR/hApiwhlJ0hoYt7JTe6LDGrIcioG4/CKs2lw0xkXsHW1NMVotw3xbaNaTS
RrM0+oWnkfVgtzEUUJtorj4Y4M+nlEaaeJWwWP4MpSNY+UTSwI7lcy5CwafPUSLkuAWgNJJb
+tgxDQ==
/

CREATE OR REPLACE NONEDITIONABLE FUNCTION "APEX_040200"."WWV_POPUP_FILTER" wrapped
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
58 96
cjthVZTjbPP0WjbWgYYiHKqqV78wg8eZgcfLCNL+XhaWlm2WhZYWYuOu2Uc+oWIJ58CyvbKb
XufHdMAzuHRlCbh0K7jAMv7S1qFGBweVmDrOBx6+xlvOW0Y525hCkkZTOZPVU5K+VIKmpn28
q+U=
/


ALTER FUNCTION "APEX_040200"."WWV_FLOW_EPG_INCLUDE_MOD_LOCAL"
  COMPILE
    PLSQL_OPTIMIZE_LEVEL=  2
    PLSQL_CODE_TYPE=  INTERPRETED
    PLSQL_DEBUG=  FALSE    PLSCOPE_SETTINGS=  'IDENTIFIERS:NONE'

 REUSE SETTINGS TIMESTAMP '2014-07-07 06:29:21'
/


ALTER FUNCTION "APEX_040200"."V"
  COMPILE
    PLSQL_OPTIMIZE_LEVEL=  2
    PLSQL_CODE_TYPE=  INTERPRETED
    PLSQL_DEBUG=  FALSE    PLSCOPE_SETTINGS=  'IDENTIFIERS:NONE'

 REUSE SETTINGS TIMESTAMP '2014-07-07 06:36:52'
/


ALTER FUNCTION "APEX_040200"."NV"
  COMPILE
    PLSQL_OPTIMIZE_LEVEL=  2
    PLSQL_CODE_TYPE=  INTERPRETED
    PLSQL_DEBUG=  FALSE    PLSCOPE_SETTINGS=  'IDENTIFIERS:NONE'

 REUSE SETTINGS TIMESTAMP '2014-07-07 06:36:52'
/


ALTER FUNCTION "APEX_040200"."WWV_FLOW_HOT_HTTP_LINKS"
  COMPILE
    PLSQL_OPTIMIZE_LEVEL=  2
    PLSQL_CODE_TYPE=  INTERPRETED
    PLSQL_DEBUG=  FALSE    PLSCOPE_SETTINGS=  'IDENTIFIERS:NONE'

 REUSE SETTINGS TIMESTAMP '2014-07-07 06:36:52'
/


ALTER FUNCTION "APEX_040200"."VRN"
  COMPILE
    PLSQL_OPTIMIZE_LEVEL=  2
    PLSQL_CODE_TYPE=  INTERPRETED
    PLSQL_DEBUG=  FALSE    PLSCOPE_SETTINGS=  'IDENTIFIERS:NONE'

 REUSE SETTINGS TIMESTAMP '2014-07-07 06:36:47'
/


ALTER FUNCTION "APEX_040200"."WWV_POPUP_FILTER"
  COMPILE
    PLSQL_OPTIMIZE_LEVEL=  2
    PLSQL_CODE_TYPE=  INTERPRETED
    PLSQL_DEBUG=  FALSE    PLSCOPE_SETTINGS=  'IDENTIFIERS:NONE'

 REUSE SETTINGS TIMESTAMP '2014-07-07 06:29:49'
/


ALTER FUNCTION "APEX_040200"."WWV_FLOWS_VERSION"
  COMPILE
    PLSQL_OPTIMIZE_LEVEL=  2
    PLSQL_CODE_TYPE=  INTERPRETED
    PLSQL_DEBUG=  FALSE    PLSCOPE_SETTINGS=  'IDENTIFIERS:NONE'

 REUSE SETTINGS TIMESTAMP '2014-07-07 06:29:49'
/


ALTER FUNCTION "APEX_040200"."WWV_FLOWS_RELEASE"
  COMPILE
    PLSQL_OPTIMIZE_LEVEL=  2
    PLSQL_CODE_TYPE=  INTERPRETED
    PLSQL_DEBUG=  FALSE    PLSCOPE_SETTINGS=  'IDENTIFIERS:NONE'

 REUSE SETTINGS TIMESTAMP '2014-07-07 06:29:49'
/


ALTER FUNCTION "APEX_040200"."APEX_APPLICATION_GET_PG_TNAME"
  COMPILE
    PLSQL_OPTIMIZE_LEVEL=  2
    PLSQL_CODE_TYPE=  INTERPRETED
    PLSQL_DEBUG=  FALSE    PLSCOPE_SETTINGS=  'IDENTIFIERS:NONE'

 REUSE SETTINGS TIMESTAMP '2014-07-07 06:30:37'
/


ALTER FUNCTION "APEX_040200"."WWV_FLOW_ITEM_COMPS"
  COMPILE
    PLSQL_OPTIMIZE_LEVEL=  2
    PLSQL_CODE_TYPE=  INTERPRETED
    PLSQL_DEBUG=  FALSE    PLSCOPE_SETTINGS=  'IDENTIFIERS:NONE'

 REUSE SETTINGS TIMESTAMP '2014-07-07 06:31:00'
/


ALTER FUNCTION "APEX_040200"."WWV_FLOW_LOV_USED_ON_PAGES"
  COMPILE
    PLSQL_OPTIMIZE_LEVEL=  2
    PLSQL_CODE_TYPE=  INTERPRETED
    PLSQL_DEBUG=  FALSE    PLSCOPE_SETTINGS=  'IDENTIFIERS:NONE'

 REUSE SETTINGS TIMESTAMP '2014-07-07 06:31:00'
/


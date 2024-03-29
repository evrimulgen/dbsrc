
--    Copyright 2019 Steve Rutledge
--    =========================================================================
--    This file is part of DBSRC Librarian.
--
--    DBSRC Librarian is free software: you can redistribute it and/or modify
--    it under the terms of the GNU General Public License as published by
--    the Free Software Foundation, version 3 of the License.
--
--    DBSRC Librarian is distributed in the hope that it will be useful,
--    but WITHOUT ANY WARRANTY; without even the implied warranty of
--    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
--    GNU General Public License for more details.
--
--    You should have received a copy of the GNU General Public License
--    along with DBSRC Librarian (see file COPYING.txt).  
--    If not, see <https://www.gnu.org/licenses/>.
--    =========================================================================

-- ============================================================================
-- INVOCATION	sqlplus -s user/pw@db @get_drop_dbscript (set_no)
--
--			set_no is optional and defaults to max(dbsrc.set_no)
-
-- DESCRIPTION
--
-- get_drop_dbscript.sql: get the "drop all objects" database script.
--
-- Generate a "drop all objects" database script where all objects created
-- by the companion "[cfg_name]_create*.sql" script are dropped.
--
-- The resulting script is named in the pattern of "[cfg_name]_drop.sql".
--
-- The resulting script is a helper for companion
-- "[cfg_name]_create*.sql" scripts being generated elsewhere.
--
-- ============================================================================

prompt -- BEGIN get_drop_dbscript ...

-- appropriate sqlplus settings for batch spooling to a file
@@_init_batch

-- no headers needed for this output!
set pages 0;
col text for a32767 wrap;

-- stop immediately if something blows up, to minimize wasted time
whenever sqlerror exit rollback;

-- sqlplus makes this awkward: we want the crnt_dbsrc view to default to the
--  latest dbsrc (the max dbsrc_set_no). But, we also want to have the
--  option to instead pass in a different set_no on the cmdline.
-- The below wierdness does just that: set dbsrc.mgr.set_no to cmdline parm, 
--	else default to 1.
column 1 new_value 1
select '' "1" from dual where rownum = 0;
exec dbsrc_mgr.set_set_no(&&1);

-- Copy set_no from pl/sql state into sqlplus substitution variable
-- where we can use it from sqlplus stuff.
-- (trim? implicit datatype conversion added spaces, so trim, blah)
col x new_value p_set_no noprint
select trim(dbsrc_mgr.get_set_no()) x from dual;

-- lookup cfg_name for set_no and copy into a sqlplus var
col x new_value p_cfg_name noprint
select dbsrc_mgr.get_cfg_name() x from dual;

-- create a descriptively-named directory to contain all the files we generate.
-- Note, if dir already exists, silently continue
col x new_value p_dirname noprint 
select 'out\&&p_cfg_name' x from dual;
host if not exist "&&p_dirname" mkdir "&&p_dirname"

set termout on
prompt --   Creating &&p_dirname\&&p_cfg_name._drop_dbscript.sql
set termout off

-- assemble output filename and start spooling
-- Note, if file already exists, silently replace and continue
spool &&p_dirname\&&p_cfg_name._drop.sql

-- ============================================================================
-- (1) render header
-- ============================================================================

prompt -- Generated by DBSRC Library, Copyright Steve Rutledge 2019

select 
    '-- This file was generated on '||sysdate||' by '||user||'@'||
        sys_context('userenv', 'db_name') 
from dual;

prompt -- ============================================================================
prompt -- DESCRIPTION
prompt --;
prompt -- This is a companion script to the "&&p_cfg_name._&&p_set_no._create_*.sql" 
prompt -- scripts, intended to drop all objects created by the 
prompt -- "&&p_cfg_name._&&p_set_no._create_*.sql" scripts.
prompt --;
prompt -- ============================================================================

-- describe the source for the current set_no (summarize the objects in the
-- set, the configuration used to generate this set, etc.
exec dbsrc_mgr.describe

-- carriage return 
select chr(10) from dual;

-- Scripts invoking this script have define off, which would 
-- break these defines, so "set define #" and 
-- "set define off" around this section.

-- Also, one semi-colon gets swallowed by prompt.
prompt set define on;;

-- render section in output script to assemble logfile name and start spooling
set def #;
select distinct
    'column logfile new_value v_logfile noprint'||chr(10)||
    'select ''##p_cfg_name._##p_set_no._drop_''||to_char(sysdate,''YYYYMMDD_HH24MISS'')||''.log'' logfile from dual;'||chr(10)||
    'spool &v_logfile'||chr(10)||
    chr(10)||
    'set trimspool on;'||chr(10)||
    'set echo on;'||chr(10)||
    chr(10)||
    'select SYS_CONTEXT (''USEREqV'', ''DB_NAME'') as DATABASE, SYS_CONTEXT (''USERENV'', ''SESSION_USER'') as SESSION_USER, SYSDATE from dual;'||chr(10)
from dual;
set def &;

prompt -- the output script may have embedded ampersands that are NOT substitution variables
prompt set define off;;

prompt -- the output script have blank lines in the middle of a sql statement
prompt set sqlblanklines on;;

-- ============================================================================
-- (2) render body
-- ============================================================================

select chr(10) from dual;
prompt -- ============================================================================
prompt -- script body
prompt -- ============================================================================
select chr(10) from dual;

prompt -- ====================================================================;
prompt -- public dblinks;
prompt -- ====================================================================;

select chr(10) from dual;
select 
    'drop public database link "'||object_name||'";' text
from crnt_dbsrc
where 
    ddl_type = 'DB_LINK' and
    object_owner = 'PUBLIC' and
    dbscript_include_flag = 'Y';
select chr(10) from dual;

prompt -- ====================================================================;
prompt -- user;
prompt -- ====================================================================;

select chr(10) from dual;
select 
    'drop user "'||object_name||'" cascade;' text
from crnt_dbsrc
where 
    ddl_type = 'USER' and
    dbscript_include_flag = 'Y';
select chr(10) from dual;

-- Profiles are not schema objects, so are untouched by the "drop user cascade"
-- above.

prompt -- ====================================================================;
prompt -- profile;
prompt -- ====================================================================;

select chr(10) from dual;
select 
    'drop profile "'||object_name||'";' text
from crnt_dbsrc
where 
    ddl_type = 'PROFILE' and
    dbscript_include_flag = 'Y';
select chr(10) from dual;

-- Roles are not schema objects either, so are untouched by the "drop user
-- cascade" above.

prompt -- ====================================================================;
prompt -- role;
prompt -- ====================================================================;

select chr(10) from dual;
select 
    'drop role "'||object_name||'";' text
from crnt_dbsrc
where 
    ddl_type = 'ROLE' and
    dbscript_include_flag = 'Y';
select chr(10) from dual;

prompt -- ====================================================================;
prompt -- context;
prompt -- ====================================================================;

select chr(10) from dual;
select 
    'drop context "'||object_name||'";' text
from crnt_dbsrc
where 
    ddl_type = 'CONTEXT' and
    dbscript_include_flag = 'Y';
select chr(10) from dual;

-- Note, there are other object types that are also not schema-level, none of
-- which are being handled by this utility. If support is added to this utility
-- in the future for these object types, then this script will need to be
-- extended to handle it.
--
-- There are about 111 object types that are not schema objects in 12.1. More 
-- common examples are AUDIT, TABLESPACE, ROLLBACK SEGMENT, DIRECTORY.
-- For a more complete list, see:
--
-- 		select regexp_replace(object_path, '(DATABASE_EXPORT/)|(SCHEMA/)', '') 
-- 		from sys.dba_export_objects
-- 		where het_type = 'DATABASE_EXPORT'
-- 		minus
-- 		select regexp_replace(object_path, '(SCHEMA_EXPORT/)|(SCHEMA/)', '') 
-- 		from sys.dba_export_objects
-- 		where het_type = 'SCHEMA_EXPORT';

-- ============================================================================
-- (3) suffix
-- ============================================================================

select
    chr(10)||
    '-- ============='||chr(10)||
    '-- END OF SCRIPT'||chr(10)||
    '-- ============='||chr(10)||
    chr(10)||
    'spool off;'||chr(10)||
    'exit;'||chr(10)||
    chr(10)
from dual;

spool off;

set termout on
prompt -- END get_drop_dbscript.

-- done!
exit;


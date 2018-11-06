
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
-- INVOCATION	sqlplus -s user/pw@db @get_def_dbscript (set_no)
--
--			set_no is optional and defaults to max(dbsrc.set_no)
--
-- DESCRIPTION
--
-- get_def_dbscript.sql: get the "defines" database script.
--
-- Generate a "defines" database script where all password references are
-- defined.  The resulting script is named in the pattern of
-- "[cfg_name]_define.sql".
--
-- The resulting script is a helper for companion
-- "[cfg_name]_create*.sql" scripts being generated elsewhere.
--
-- ============================================================================

prompt -- BEGIN get_def_dbscript ...

-- appropriate sqlplus settings for batch spooling to a file
@@_init_batch

-- no headers needed for this output!
set pages 0;
col text for a32767 wrap;

-- stop immediately if something blows up, to minimize wasted time
whenever sqlerror exit rollback;

-- Sqlplus makes this awkward: we want the crnt_dbsrc view to default to the
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
prompt --   Creating &&p_dirname\&&p_cfg_name._define.sql
set termout off

-- assemble output filename and start spooling
-- Note, if file already exists, silently replace and continue
spool &&p_dirname\&&p_cfg_name._define.sql

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
prompt -- script, intended to be a helper for managing password references. Each 
prompt -- password in the "&&p_cfg_name._&&p_set_no._create_*.sql" script has been
prompt -- replaced with a sqlplus substutution variable which is defined here. The
prompt -- define statements in this script will need to be edited to add passwords.
prompt -- ============================================================================

-- describe the source for the current set_no (summarize the objects in the
-- set, the configuration used to generate this set, etc.
exec dbsrc_mgr.describe

-- ============================================================================
-- (2) render body 
-- ============================================================================

-- carriage return
select chr(10) from dual;

-- Scripts invoking this script have define off, which would 
-- break these defines, so render "set define on" and 
-- "set define off" around this section.
--
-- Also, one semi-colon gets swallowed by prompt.
prompt set define on;;

-- Generate a define statement for each dblink password.  Match the define
-- variable naming convention established in post-processing:
--   [object_owner]_[1st 30 chars of db_link]
select distinct
	'def '||
		substr(object_owner||'_'||substr(object_name,1,instr(object_name,'.')-1), 1, 30)||
		' = '''';'
from crnt_dbsrc
where ddl_type = 'DB_LINK'
order by 1;

prompt set define off;;

set termout on
prompt -- END get_def_dbscript.

-- done!
spool off;
exit;


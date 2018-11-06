
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
-- INVOCATION
--      sqlplus -s un/pw@db @post_prcs (set_no)
--
--			set_no is optional and defaults to max(dbsrc.set_no)
--
-- DESCRIPTION
--      Post-process the "latest" database source set in the the dbsrc table.
--		post_prcs is typically called as part of export_ddl. Use this only if
--		you need to re-post-process.
--
-- DEPENDENCIES
--      Executing user must have select_catalog_role role.
--      http://docs.oracle.com/cd/E11882_01/appdev.112/e40758/d_metada.htm#ARPLS66868
--
-- PREREQUISITES
--      appropriate cfg set entries must exist
-- ============================================================================

@@_init_interactive
whenever sqlerror exit rollback;

--  latest dbsrc (the max dbsrc.set_no). But, we also want to have the
--  option to instead pass in a different set_no on the cmdline.
-- The below wierdness does just that: set dbsrc.mgr.set_no to cmdline parm, 
--	else default to 1
column 1 new_value 1
select '' "1" from dual where rownum = 0;
exec dbsrc_mgr.set_set_no(&&1);

-- Copy set_no from pl/sql state into sqlplus substitution variable
-- where we can use it from sqlplus stuff.
-- (trim? implicit datatype conversion added spaces, so trim, blah)
col set_no new_value p_set_no noprint
select trim(dbsrc_mgr.get_set_no()) set_no from dual;

-- log
column logfile new_value v_logfile noprint
select 'log/post_prcs_'||to_char(sysdate,'YYYYMMDD_HH24MISS')||'.log' logfile
from dual;
spool &v_logfile

-- trace
--@@_trc

exec dbsrc_mgr.post_prcs;
exec dbsrc_mgr.desc_post_prcs;

-- done!
spool off;
exit;


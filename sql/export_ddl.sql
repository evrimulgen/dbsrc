
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
--      sqlplus -s un/pw @export_ddl [dbsrc_cfg_set.cfg_name]
--
-- DESCRIPTION
--      Export ddl according to parameters in cfg set into the dbsrc_set table.
--
-- DEPENDENCIES
--      Executing user must have select_catalog_role role.
--      http://docs.oracle.com/cd/E11882_01/appdev.112/e40758/d_metada.htm#ARPLS66868
--
-- PREREQUISITES
--      appropriate cfg set entries must exist
-- ============================================================================

@@_init_interactive

-- log
column logfile new_value v_logfile noprint
select 'log/export_ddl_'||to_char(sysdate,'YYYYMMDD_HH24MISS')||'.log' logfile
from dual;
spool &v_logfile

exec dbsrc_mgr.export_ddl('&1');

-- done!
spool off;
exit;


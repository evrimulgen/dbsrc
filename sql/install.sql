
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

set serveroutput on size unlimited

-- exit/abort on first error, do not continue
-- rollback current transaction on exit
whenever oserror exit failure rollback sql.sqlcode;
whenever sqlerror exit failure rollback sql.sqlcode;

-- ============================================================================
-- install
-- ============================================================================

set echo on;
set feedback on;
set heading off;
set pages 0;
set termout on;
set timing off;
set trimspool on;
set verify off;

column logfile new_value v_logfile noprint
select 'log/install_'||to_char(sysdate,'YYYYMMDD_HH24MISS')||'.log' logfile
from dual;
spool &v_logfile

-- ============================================================================
-- install tables and view (everything but package
-- ============================================================================
@sql\01_install_ddl.sql

-- ============================================================================
-- install package (broken out into independent script because it is useful to
-- be able to re-apply this script without reinstalling tables)
-- ============================================================================
@sql\02_install_pkg.sql

-- ============================================================================
-- install comments
-- ============================================================================
@sql\03_install_comments.sql

spool off;
exit;


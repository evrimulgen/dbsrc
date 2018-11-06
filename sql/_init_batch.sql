
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

-- exit/abort on first error, do not continue
-- rollback current transaction on exit
whenever oserror exit sql.sqlcode rollback;
whenever sqlerror exit sql.sqlcode rollback;

-- appropriate sqlplus settings for batch spooling to a file

set appinfo on;
set arraysize 250;
set echo off;
set embedded on;
set feedback off;
set flush off;
set heading off;
set linesize 32767;
set long 999999;
-- set longchunksize does NOT make this faster!
set pause off;
set serveroutput on size 1000000 format wrapped;
set termout off;
set timing off;
set trimspool on;
set verify off;



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

-- appropriate sqlplus settings for an interactive sqlplus session

set appinfo on;
set arraysize 250;
set echo off;
set embedded off;
set feedback off;
set flush on;
set heading on;
set linesize 32767;
set long 999999;
set pause off;
set serveroutput on size 1000000 format wrapped;
set termout on;
set timing off;
set trimspool on;
set verify off;

-- possible fixes for slow x$ktfbue access:
-- none of which worked with 11.2.0.4 :(
--alter session set statistics_level=all;
--alter session set optimizer_dynamic_sampling=9;
--alter session set "_optimizer_cartesian_enabled" = false;
--alter session set "_smm_auto_cost_enabled" = false;
--alter session set "_FIX_CONTROL" = "11814428:0";
--alter session set "_optimizer_mjc_enabled" = false; 

--10.1.0                              3
--10.1.0.3                            1
--10.1.0.4                            1
--10.1.0.5                            2
--10.2.0.1                           12
--10.2.0.2                           12
--10.2.0.3                           11
--10.2.0.4                           73
--10.2.0.5                          112
--11.1.0.6                           41
--11.1.0.7                           19
--11.2.0.1                           64
--11.2.0.2                          104
--11.2.0.3                           80
--11.2.0.4                          164
--12.1.0.1                           51
--12.1.0.2                          108
--8.0.0                             135
--8.1.6                               1
--8.1.7                               2
--9.2.0                               8
--9.2.0.8                             3
--alter session set optimizer_features_enable='8.0.0';

--ALTER SESSION FORCE PARALLEL QUERY;
--ALTER SESSION FORCE PARALLEL DML;

--alter session set optimizer_adaptive_features=true; 


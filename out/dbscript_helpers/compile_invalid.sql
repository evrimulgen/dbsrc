
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

-- appropriate sqlplus settings for an interactive sqlplus session
@@init_interactive

col text for a80;
set pages 0;

prompt -- before:
select owner||'.'||object_type||'.'||object_name text
from sys.dba_objects
where status = 'INVALID'
order by owner, object_type, object_name;

prompt -- attempt recompile:
begin
for x in ( 
        select distinct owner 
        from sys.dba_objects 
        where 
            status = 'INVALID' and
            owner != 'SYS'
        order by 1
    ) loop
    dbms_utility.compile_schema(x.owner, false);
end loop;
end;
/

-- prompt after:
select owner||'.'||object_type||'.'||object_name text
from sys.dba_objects
where status = 'INVALID'
order by owner, object_type, object_name;

exit;


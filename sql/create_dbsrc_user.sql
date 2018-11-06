
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

create user &&1
      default tablespace users
      identified by "password" temporary tablespace temp;

grant connect, resource, select_catalog_role to &&1;
grant create view to &&1;

alter user &&1 default role all;
alter user &&1 quota unlimited on users;


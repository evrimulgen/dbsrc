
::    Copyright 2019 Steve Rutledge
::    =========================================================================
::    This file is part of DBSRC Librarian.
::
::    DBSRC Librarian is free software: you can redistribute it and/or modify
::    it under the terms of the GNU General Public License as published by
::    the Free Software Foundation, version 3 of the License.
::
::    DBSRC Librarian is distributed in the hope that it will be useful,
::    but WITHOUT ANY WARRANTY; without even the implied warranty of
::    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
::    GNU General Public License for more details.
::
::    You should have received a copy of the GNU General Public License
::    along with DBSRC Librarian (see file COPYING.txt).  
::    If not, see <https://www.gnu.org/licenses/>.
::    =========================================================================

:: set home directory for this program to be able to find its parts
set dbsrc_home=%HOMEPATH%\workspace\dbsrc

:: get database credentials
%dbsrc_home%\bin\_get_db_creds


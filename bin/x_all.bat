
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

@@echo off

:: test that prereqs are met
if [%dbsrc_home%] == [] (
	echo dbsrc_home=%dbsrc_home%
	echo Not initialized. Please configure and execute init.bat in the dbsrc_home directory.
	goto error
)
pushd .
cd %dbsrc_home%

:: export database source then generate database scripts from that source
call bin/_export_ddl all
if %errorlevel% neq 0 goto error
call bin/_get_dbscript 
if %errorlevel% neq 0 goto error
call sqlplus -s %dbsrc_user%/%dbsrc_pw%@%dbsrc_db% @sql/get_create_o_dbscripts
if %errorlevel% neq 0 goto error
call sqlplus -s %dbsrc_user%/%dbsrc_pw%@%dbsrc_db% @sql/get_create_ot_dbscripts
if %errorlevel% neq 0 goto error
goto end

:error
echo Aborting with Error!

:end
popd


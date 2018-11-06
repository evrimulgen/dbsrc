
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

:: might as well reload configurations in case post-processing has changed
call bin/reconfig
if %errorlevel% neq 0 goto error
::now re-post-process the dbsrc.raw_ddl_text into the dbsrc.cooked_ddl_text
call sqlplus -s %dbsrc_user%/%dbsrc_pw%@%dbsrc_db% @sql/re_post_prcs %1%
if %errorlevel% neq 0 goto error
goto end

:error
echo Aborting with Error!

:end
popd


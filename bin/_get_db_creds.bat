
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
::    =========================================================================Q

:: =========================================================================
:: This is a helper script to prompt for the username, password and 
:: database name one time only, then store in environment vairables for future
:: use.
::
:: After collecting credentials it tests logging in and unsets credentials if 
:: login fails.
::
:: Here is an example of valid values for the vars (note quotes around dbsrc_db):
:: c:/> set dbsrc
:: dbsrc_db="(DESCRIPTION = (ADDRESS = (PROTOCOL = TCP)(HOST = 192.168.226.139)(PORT = 1521)) (CONNECT_DATA = (SERVER = DEDICATED) (SERVICE_NAME = sterutlernd2.qworld.quintiles.com)))"
:: dbsrc_pw=password
:: dbsrc_user=dbsrc_u
::		
:: Of course, with a names service, these values are also valid:
:: c:/> set dbsrc
:: dbsrc_db=sterutlernd2
:: dbsrc_pw=password
:: dbsrc_user=dbsrc_u
:: =========================================================================

@echo off

:: ============================================================================
:start
:: ============================================================================

:: if all have values, then skip to test, else get creds
if [%dbsrc_user%]==[] goto get_creds
if [%dbsrc_pw%]  ==[] goto get_creds
if [%dbsrc_db%]  ==[] goto get_creds
goto test

:: ============================================================================
:get_creds
:: ============================================================================

:: get username
set /P dbsrc_user="Enter Username: "

:: get dbsrc_pw, making sure to hide password text
:: btw, avoiding parens in conditional with the goto because it breaks powershell gobbledegook
set "psCommand=powershell -Command "$pword = read-host 'Enter Password' -AsSecureString ; ^
	$BSTR=[System.Runtime.InteropServices.Marshal]::SecureStringToBSTR($pword); ^
		[System.Runtime.InteropServices.Marshal]::PtrToStringAuto($BSTR)""
for /f "usebackq delims=" %%p in (`%psCommand%`) do set dbsrc_pw=%%p

:: get database name
set /P dbsrc_db="Enter Database: "

:: ============================================================================
:test
:: ============================================================================

:: do credentials work?
echo exit | sqlplus -L -S %dbsrc_user%/%dbsrc_pw%@%dbsrc_db%
if %errorlevel% neq 0 (
	:: these don't work, so complain, clear out values and try again
	echo Login fails! Trying again...
	set dbsrc_user=
	set dbsrc_pw=
	set dbsrc_db=
	goto start
)


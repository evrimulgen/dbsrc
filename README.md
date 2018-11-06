# DBSRC Librarian

DBSRC Librarian is a utility for comprehensive, flexible, performant DDL
export of large database systems consisting of hundreds of thousands of
DDL objects (or more).

This is not a complete utility, not is it production ready, so comes with
no warranties in any way whatsoever. This utility has not be productized or
packaged for ease-of-use or understandability. It is simply a prototype to
explore feasibility. Having said all that, I share it freely in case it
may be useful to someone somehow...

# Overview of files and directory structure

## /COPYING.txt

	GNU Public License details.

## /DESIGN_NOTES.md

	"under the hood" notes for those who want to understand how it works.

## /HOW_TO_USE.txt

	Instructions on how to use this program.	

## /init.bat
	
	Edit script values to match your environment. Run this to set file path
	and database credentials within the cmd window you will use to execute
	scripts from /bin.

## /README.md

	This file.

## /WISHLIST.txt
	
	TO-DOs that might be useful one day, recorded so that they are not
	forgotten.

## /bin

	The "user interface": a handful of windows batch scripts.  Scripts
	starting with "_" (underscore) are "helper scripts" called by other
	scripts, not intended to be executed directly.

## /cfg/

	  Each "configuration" for exporting the DDL for a system is captured in a
	  "configuration" script in this dir.

## /log

	Scripts in /bin log to this directory. The logfile naming convention is
	[script_name]_yyyymmdd_hh24miss.log.

## /out 

	Database Source generated by DBSRC Librarian is written to this directory.
	Review EXAMPLE output in the /out directory to see example output.  There
	are two example sets of Database Source Code produced by the DBSRC
	Librarian:

	dbsrc/out/selftest_example/

		EXAMPLE Database source for the DBSRC Librarian, generated by the
		DBSRC Librarian.

	dbsrc/out/all_example/

		EXAMPLE Database source for all interesting objects in an Oracle 12.1
		db.

## /sql

	Most SQL scripts are "under the hood" and are called by Windows batch
	scripts in the /bin dir.


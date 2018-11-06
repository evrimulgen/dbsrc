
	Copyright 2019 Steve Rutledge

	This file is part of DBSRC Librarian.

	DBSRC Librarian is free software: you can redistribute it and/or modify
	it under the terms of the GNU General Public License as published by
	the Free Software Foundation, version 3 of the License.

	DBSRC Librarian is distributed in the hope that it will be useful,
	but WITHOUT ANY WARRANTY; without even the implied warranty of
	MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
	GNU General Public License for more details.

	You should have received a copy of the GNU General Public License
	along with DBSRC Librarian (see file COPYING.txt).  
	If not, see <https://www.gnu.org/licenses/>.

	***

# (1) Introduction

This is a utility for comprehensive, flexible, performant DDL export of
large database systems consisting of hundreds of thousands of DDL objects
(or more).

This is not a complete utility, not is it production ready, so comes with
no warranties in any way whatsoever. This utility has not be productized or
packaged for ease-of-use or understandability. It is simply a prototype to
explore feasibility. Having said all that, I share it freely in case it
may be useful to someone somehow...

# (2) The Problem

## Incomplete database source code

Database source code for a complete build of a database system
typically does not exist.  Database changes are coded with incremental
DDL for each release. DDL or each release depends on the previous
release database.  There exists no baseline DDL to "build from
scratch".

## Primitive source code management tools and processes

Teams use shared development database servers for development work.
Like many conveniences in software development, a shared database is a
tar pit waiting to fossilize a project: Developers overwrite each
others changes, changes made on the database break the code in the
webapp, etc.

Teams have beautiful tools that help us do source management in most
coding environments (java, .NET), but in database environments we are
stuck with an arcane, time-intensive manual process that leaves much
to be desired and offers very little by way of consistency or
reproduceability.

# (3) The Need

There are many different approaches to managing database source code, with varying processes and tools, but one fundamental capability is being able to simply export database source code from an existing database. 

How is this useful? You can:
* Establish baseline database source code for a system that is missing database source code.
* Re-baseline database system source code to incorporate a series of incremental changes into an updated baseline script.
* Produce authoritative database source scripts for performant reverse-engineering into a data modeling tool.
* Create an independent sandbox database from a DDL export of a shared database to support new R&D and development efforts.
* Create a demonstration or training database source script.
* Diff database source code over time.

# (4) The Challenge 

There is a potentially overwhelming amount of unmanageable database source
code.  The size and complexity of large real-world database systems
overwhelms conventional database source code management approaches and
tools. 

... which leads to the question: 

What is the feasibility of a comprehensive, flexible, performant DDL
export for large database systems numbering from thousands to hundreds
of thousands of objects?

Is this even possible?

A viable solution must be:
* comprehensive = ALL database object types
	not just tables and views, but including everything necessary for
	building the database for a system (grants, types, users, packages,
	roles, VPD policies, db_links, etc...)
* flexible = filterable to object subsets, with variety of 
	post-processing requirements to many various build target needs.
* performant = DDL export in seconds to minutes, not hours to days.

# (5) DDL Export Approaches: Considered Alternatives

## (1) ERWin
* Cancelled after running for 5 hours for DDL export of large & complex
system.
* Captive GUI (no effective way to automate)
* Limited coverage of object types.  ERWin is, at its core, a multi-rdbms
data modeling tool, so supports some logicial concepts that are not
relevant to DDL export as well as lacks support for some physical
concepts specific to our rdbms technology and version. 
* ERwin does not know anything about DAC (data access language), so is
blind to object grants, system privileges, roles, role grants, vpd
policies, etc. This is a significant part of the DDL export equation.
Also, ERwin does not know anything about Oracle object and XML
extensions: types, xmlschema, etc. 
* Need to purchase license.

## (2) Oracle SQL Developer
* Free.
* Impossibly slow: one hour for 5% of DDL export.
	The "one-at-a-time" design explains slowness: initially queries against
	sys.all_* dictionary views, then uses dbms_metadata.get_ddl and
	get_dependent_ddl one object at a time.
* Captive GUI (no effective way to automate)
* Limited GUI 
	although it leverages dbms_metadata to do the work, many of the 
	underlying options are hidden (ex: cannot exclude partitioning)

## (3) TOAD
* Runs out of memory 5% through DDL export of large & complex system.
* Captive GUI (no effective way to automate)
* Need to purchase license.

## (4) Oracle Change Management Pack
* Would need significant dba buy-in and involvement for setup and ongoing
	admin of approach. Also, need to purchase license. Not attractive.
	
## (5) oracle supplied dbms_metadata PL/SQL API, wrapped in custom scripts
## (This is the selected approach)

* A 3rd party utility Will be fundamentally less comprehensive and
compatible with the DDL it can export compared to leveraging the
built-in oracle database DDL export functionality. Built-in
functionality is by its nature in a compatibility lock-step with the
database. It is also a critical core component leveraged by the database
product itself to support the datapump utility, so one can expect a
certain amount of quality and comprehensive functionality.
* A 3rd-party client utility will be fundamentally less efficient than a
database server-based approach. With a client, processing will occur
remote to the database and across the network, while database
server-based processing will occur within the database engine itself,
enjoying a several-fold potential performance advantage.
* free (as in "comes-with" something we are alreadying paying for).
* Should be Possibly feasible. Lets do a proof-of-concept.

# (6) Design Notes

## general design approach
* use large complex system as a test case
* wrap oracle dbms_metadata supplied PL/SQL package with custom package
		to adapt to our needs
* maximize leveraging of dbms_metadata by using heterogeneous
		database_export mode instead of one-object-at-a-time approaches.
* two logical parts: 
		(1) export raw DDL from db into table of clobs
		(2) post-process db from table of clobs and write into SQL scripts
* capture dbms_metadata transforms as table data
* capture dbms_metadata filters as table data
* capture post-processing logic as table data
* assemble all transforms, filters and post-processing logic for a single
		system into a "configuration", stored as data.
* use simple SQL scripts and batch files to execute
* generate thorough script "documentation" comments to describe
		configuration set, dbsrc and post-processing details.

## observed performance? OK (not great, but acceptable)
	full DDL export of 16k objects from a 5 million object system in ~70m:
			exporting the DDL  to clobs: ~60m
			post-processing ~45s
			writing clobs to files ~10m
					includes 5 scripts: create, create-ordered, drop, manifest, define
					writing create only takes ~4m

## comprehensive and correct? (tentative) YES
	successfully generated a build script
	success = executed against vanilla oracle db with no errors and no invalid
			objects!

learnings:
* Custom post-processing was the most complex part. Without it, the raw
	  exported DDL was not very useful.
* No clear way to tell from the db which roles are used by which
        "systems" (roles are not schema-level objects), so that
        filter must be set up (at least once) manually.
* Must also identify and filter out about 60 oracle built-in roles.
* Very useful to transform default tablespace names to USERS when creating
	  users unless you want to always also export all tablespaces.
* must transform and parameterize user and dblink passwords.
	  dbms_metadata DDL export API does not include these except for SYS. Very
	  useful to make this flexible anyhow for many reasons.
* Useful and safer to be able rewrite dblinks pointing to production to
	  instead point to dev.
* useful to add "show errors" after stored code.
* Actually quite tricky to manage the creation of private dblinks within
	  the proper schemas. Possibly the most complex post-processing.
* needed to add force option to view creation or inevitable cyclical
	  dependencies caused unnecessary failures.
* Useful to flexibly add/remove storage attributes 
* Useful to flexibly add/remove partition attributes 
* Needed to handle one dbms_metadata weirdness: mv redundant table
	  creation
* Useful to flexibly choose include/exclude invalid objects in export
* Need to handle SQLPlus 2499 char line limitation with expanded "select
	  *" views or else DDL scripts just will not work in SQLPlus.
* Useful to be able to exclude malformed, unusable dblinks.
* Needed to flexibly introduce and manage a custom prologue script.
* Needed to flexibly introduce and manage a custom epilogue script.
* To get clean build, needed to include post-build invalid object
	  recompile across a set of schemas.
* To get a clean build, need to flexibly choose to include dependent
	  objects to the target object set.
* There is very limited documentation on object_paths for set_transform.
	  The object_paths I found that ultimately worked are completely different
	  from those documented.
* Undocumented dbms_metadata.set_transform limitation: If you explicitly
	  include too many filter paths, then you blow a buffer somewhere and
	  dbms_metadata fails with cryptic errors (ORA-06512: at
	  "SYS.DBMS_METADATA", line 7909.  ORA-06502: PL/SQL: numeric or value
	  error: character string buffer too small),  so I include only the
	  minimal high-level paths to and restate filters more succinctly as
	  "WHERE IN ()"  expressions.
* Undocumented dbms_metadata.set_transform limitation: If not excluded,
	  the object path DATABASE_EXPORT/XS_SECURITY causes dbms_metadata to
	  abort with cryptic errors (LPX-00210: expected '<' instead of 'C').
* Undocumented dbms_metadata.set_transform limitation: When turning
	  dbms_metadata back on the oracle built-in objects, You must have
	  EXP_FULL_DATABASE role or you will fail with ORA-01031: insufficient
	  privileges.
* Undocumented dbms_metadata.set_transform limitation: You must exclude
	  object_path DATABASE_EXPORT/SCHEMA/DVPS_STAGING_REALM_MEMBERSHIP or else
	  dbms_metadata aborts with cryptic errors (ORA-01031: insufficient
	  privileges) unless you have EXP_FULL_DATABASE role, which is not a
	  documented requirement.
* Undocumented dbms_metadata.set_transform limitation: You must exclude
	  object_path DATABASE_EXPORT/SCHEMA/PASSWORD_HISTORY or else
	  dbms_metadata aborts with cryptic errors, (ORA-00942: table or view does
	  not exist) unless you have EXP_FULL_DATABASE role, which is not a
	  documented requirement.

## limitations: 
* This approach becomes more useful the larger the system is and
	  the stricter the requirements are for correctness and completeness.  For
	  example, a one-time need for DDL for a few dozen tables used for ad-hoc
	  analysis is better served with Toad, Oracle SQL Developer or ERWin. Only
	  when you need a repeatable method for complete DDL generation for a
	  large system is this approach worthwhile.
* Fundamental complexity is hard to mitigate. A utility similar to this
	  prototype will not be easy to understand, maintain and use except for a
	  small subset of people with mastery of oracle, PL/SQL and SQL.
* Even just sharing the output scripts will be enough to befuddle many,
	  although that may be a more useful way to leverage the utility than
	  expecting people to install and run the utility themselves. In practice,
	  I have found that this is the most useful way of scaling usage of this
	  utility (just share the output scripts and sit down with colleague the
	  first time they try to deploy them).
* Like any custom-built utility, it will likely only survive until its
	  builder and maintainer moves on.

# (7) Data Model

## Logical

![Logical Data Model](https://github.com/SteveRutledge/dbsrc/blob/master/notes/DBSRC_Librarian_Logical_Data_Model.png "Logical Data Model")

## Physical

![Physical Data Model](https://github.com/SteveRutledge/dbsrc/blob/master/notes/DBSRC_Librarian_Physical_Data_Model.png "Physical Data Model")

# (8) PL/SQL Package

![DBSRC_MGR PL/SQL Package](https://github.com/SteveRutledge/dbsrc/blob/master/notes/DBSRC_Librarian_PLSQL_Package.png "DBSRC_MGR PL/SQL Package")

# (9) Files

![Install Files](https://github.com/SteveRutledge/dbsrc/blob/master/notes/DBSRC_Librarian_install_files.png "Install Files")

![Files](https://github.com/SteveRutledge/dbsrc/blob/master/notes/DBSRC_Librarian_files.png "Files")

# (7) Next Steps
* continue use as a personal utility to further evaluate functionality and
	  usefulness. Incremental development/bug fixes as time and attention
	  allows.
* socialize problem and solution approach as opportunities arise.
* continue to evaluate other alternatives. 

# (8) Other Alternatives Not Pursued (Yet)

http://www.red-gate.com

dbForge Schema Compare for Oracle (devart.com)

liquiBase

http://www.sumsoftsolutions.com/svco/

# (9) Interesting References

http://blog.codinghorror.com/get-your-database-under-version-control/

https://www.simple-talk.com/sql/t-sql-programming/when-database-source-control-goes-bad/

http://jonathanlewis.wordpress.com/2013/03/01/source-control/

http://martinfowler.com/articles/evodb.html
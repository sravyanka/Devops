#!/bin/sh
 #checkinstall script for SUNWcadap
#
# This confirms the existence of the required specU database

# First find which database package has been installed.
pkginfo -q SUNWspcdA	# try the older one

if [ $? -ne 0 ]; then
   pkginfo -q SUNWspcdB	# now the latest

	  if [ $? -ne 0 ]; then	# oops
		    echo "No database package can be found. Please install the"
		    echo "SpecU database package and try this installation again."
		    exit 3		# Suspend
	  else
		    DBBASE="`pkgparam SUNWsbcdB BASEDIR`/db"	# new DB software
	  fi
else
	  DBBASE="`pkgparam SUNWspcdA BASEDIR`/db"	# old DB software
fi

# Now look for the database file we will need for this installation
if [ $DBBASE/specUlatte ]; then
	  exit 0		# all OK
else
	  echo "No database file can be found. Please create the database"
	  echo "using your installed specU software and try this"
	  echo "installation again."
	  exit 3		# Suspend
fi

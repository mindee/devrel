#!/bin/sh

#
# This script detect password protected PDFs in the desired folder
#
# ./detectProtectedPDF.sh PATH_TO_FOLDER
#

for file in "$1"/*
do
	output=$(gs -dBATCH -sNODISPLAY "$file" 2>&1)
	gsexit=$?

	if [ "$gsexit" != "0" ]; then
		found=$(echo "$output" |grep -o "This file requires a password")
	if [ -z "$found" ]; then
		echo "Failed to invoke gs"
			exit $gsexit
		else
			echo "Protected: $file"
		fi
	fi
done

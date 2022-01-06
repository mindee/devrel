#!/bin/sh

#
# This script delete all PDFs that have the wrong MIME type
#
# It is useful when you use a new dataset sources & don't want to use malformed
# files, even if detected by our SDKs
#

for file in "$1"/*
do
	fileType=$(file --mime-type -b "$file")
	if [ "$fileType" != "application/pdf" ] ; then
		echo "$fileType"
		rm "$file"
	fi
done

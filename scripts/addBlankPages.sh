#!/bin/zsh

#
# Add 10 blank pages to all PDF in the folder keeping the original file.
# Useful to test the cutPDF feature on our SDKs
#
# ./addBlankPages.sh FOLDER_PATH
#
# You need https://www.pdflabs.com/tools/pdftk-server/ installed
#
# I'm sure there is a better way to do that with code, instead of using a
# document with blank pages and concatenating them, but it was the lazies way
# for my tests
#

if ! command -v pdftk &> /dev/null
then
    echo "You need to install pdftk: https://www.pdflabs.com/tools/pdftk-server/"
    exit
fi

for file in "$1"/*.pdf
do
	pdftk blank.pdf "$file" cat output "$file.pdf"
done

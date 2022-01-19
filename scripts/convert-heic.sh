#!/bin/zsh

#
# Convert HEIC images to JPG
#
# ./convert-heic.sh FOLDER_PATH
#
# You need https://github.com/ImageMagick/ImageMagick installed
#

if ! command -v magick &> /dev/null
then
    echo "You need to install ImageMagick: https://github.com/ImageMagick/ImageMagick"
    exit
fi

for file in "$1"/*.heic
do
	magick convert "$file" "$file.jpg"
done

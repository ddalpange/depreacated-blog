#!/usr/bin/env bash
# absolute path to image folder
FOLDER="`pwd`/source/images/portfolio/travelhow-web"

# max height
WIDTH=1280

# max width
HEIGHT=720

# resize png or jpg to either height or width, keeps proportions using imagemagick

# find ${FOLDER} -iname '*.jpg' -o -iname '*.png' -exec convert \{} -quality 100 -resize $WIDTHx$HEIGHT\> \{} \;

mogrify -verbose -format jpg -background "rgba(0,0,0,0)" -quality 100 ${FOLDER}/*.png

# find ${FOLDER} -iname '*.png' -delete

#!/bin/bash
CWD=$(pwd)
CONV_BIN=$(which convert)

if [[ -z $CONV_BIN ]]; then
	echo ImageMagik convert is not installed
	exit 1
fi

if [[ -z $3 ]]; then
	echo Usage: $0 SRC_FILE DST_NAME WIDTHxHEIGHT
	exit 1
fi

# check size format
if [[ ! $3 =~ [0-9]+x[0-9]+ ]]; then
	echo The size must be in numeric WIDTHxHEIGHT format, e. g. 240x120
	exit 1
fi

NAME=$( echo $2 | sed -e 's/-/_/g' )

FILE_EXT=$( file --mime-type $1 | awk -Fimage/ '{print $2}' )

WIDTH=$( echo $3 | awk -Fx '{print $1}' )
HEIGHT=$( echo $3 | awk -Fx '{print $2}' )

let "WX2 = WIDTH * 2"
let "HX2 = HEIGHT * 2"

let "WX3 = WIDTH * 3"
let "HX3 = HEIGHT * 3"

convert $1 -resize ${WIDTH}x${HEIGHT} -colorspace sRGB $CWD/${NAME}_${3}pt.${FILE_EXT}
convert $1 -resize ${WX2}x${HX2} -colorspace sRGB $CWD/${NAME}_${3}pt@2x.${FILE_EXT}
convert $1 -resize ${WX3}x${HX3} -colorspace sRGB $CWD/${NAME}_${3}pt@3x.${FILE_EXT}

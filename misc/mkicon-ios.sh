#!/bin/bash
CWD=$(pwd)
CONV_BIN=$(which convert)

if [[ -z $CONV_BIN ]]; then
	echo ImageMagik convert is not installed
	exit 1
fi

if [[ -z $3 ]]; then
	echo Usage: $0 SRC_FILE DST_NAME BASE_SIZE
	exit 1
fi

NAME=`echo $2 | sed -e 's/-/_/g'`

SIZE_X1=$3
let "SIZE_X2 = SIZE_X1 * 2"
let "SIZE_X3 = SIZE_X1 * 3"

convert $1 -resize ${SIZE_X1}x${SIZE_X1} -colorspace sRGB $CWD/${NAME}_${3}pt.png
convert $1 -resize ${SIZE_X2}x${SIZE_X2} -colorspace sRGB $CWD/${NAME}_${3}pt@2x.png
convert $1 -resize ${SIZE_X3}x${SIZE_X3} -colorspace sRGB $CWD/${NAME}_${3}pt@3x.png

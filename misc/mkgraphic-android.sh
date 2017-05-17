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

if [[ ! $3 =~ [0-9]+x[0-9]+ ]]; then
	echo The size must be in numeric WIDTHxHEIGHT format
	exit 1
fi

NAME=`echo $2 | sed -e 's/-/_/g'`

FILE_EXT=`file --mime-type $1 | awk -Fimage/ '{print $2}'`

SIZE_MDPI=`echo $3|awk -Fx '{print int($1*1) "x" int($2*1)}'`
SIZE_HDPI=`echo $3|awk -Fx '{print int($1*1.5) "x" int($2*1.5)}'`
SIZE_XHDPI=`echo $3|awk -Fx '{print int($1*2) "x" int($2*2)}'`
SIZE_XXHDPI=`echo $3|awk -Fx '{print int($1*2.5) "x" int($2*2.5)}'`
SIZE_XXXHDPI=`echo $3|awk -Fx '{print int($1*3) "x" int($2*3)}'`

convert $1 -resize ${SIZE_MDPI} -colorspace sRGB $CWD/${NAME}_${3}dp_mdpi.${FILE_EXT}
convert $1 -resize ${SIZE_HDPI} -colorspace sRGB $CWD/${NAME}_${3}dp_hdpi.${FILE_EXT}
convert $1 -resize ${SIZE_XHDPI} -colorspace sRGB $CWD/${NAME}_${3}dp_xhdpi.${FILE_EXT}
convert $1 -resize ${SIZE_XXHDPI} -colorspace sRGB $CWD/${NAME}_${3}dp_xxhdpi.${FILE_EXT}
convert $1 -resize ${SIZE_XXXHDPI} -colorspace sRGB $CWD/${NAME}_${3}dp_xxxhdpi.${FILE_EXT}

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

SIZE_MDPI=0
SIZE_HDPI=0
SIZE_XHDPI=0
SIZE_XXHDPI=0
SIZE_XXXHDPI=0

# 18 => 18, 24, 36, 52, 72
if [[ $3 -eq 18 ]]; then
	SIZE_MDPI=18
	SIZE_HDPI=24
	SIZE_XHDPI=36
	SIZE_XXHDPI=52
	SIZE_XXXHDPI=72
fi
# 24 => 24, 36, 48, 72, 96
if [[ $3 -eq 24 ]]; then
	SIZE_MDPI=24
	SIZE_HDPI=36
	SIZE_XHDPI=48
	SIZE_XXHDPI=72
	SIZE_XXXHDPI=96
fi
# 36 => 36, 54, 72, 108, 144
if [[ $3 -eq 36 ]]; then
	SIZE_MDPI=36
	SIZE_HDPI=54
	SIZE_XHDPI=72
	SIZE_XXHDPI=108
	SIZE_XXXHDPI=144
fi
# 48 => 48, 72, 96, 144, 192
if [[ $3 -eq 48 ]]; then
	SIZE_MDPI=48
	SIZE_HDPI=72
	SIZE_XHDPI=96
	SIZE_XXHDPI=144
	SIZE_XXXHDPI=192
fi

if [[ $3 -eq 512 ]]; then
	SIZE_MDPI=512
fi

if [[ $SIZE_MDPI -eq 0 ]]; then
	echo Wrong size! Must be one of 18\|24\|36\|48\|512
	exit 1
fi

if [[ $SIZE_MDPI -eq 512 ]]; then
	convert "$1" -resize ${SIZE_MDPI}x${SIZE_MDPI} -colorspace sRGB "$CWD/${NAME}_${3}dp.png"
else
	convert "$1" -resize ${SIZE_MDPI}x${SIZE_MDPI} -colorspace sRGB "$CWD/${NAME}_${3}dp_mdpi.png"
	convert "$1" -resize ${SIZE_HDPI}x${SIZE_HDPI} -colorspace sRGB "$CWD/${NAME}_${3}dp_hdpi.png"
	convert "$1" -resize ${SIZE_XHDPI}x${SIZE_XHDPI} -colorspace sRGB "$CWD/${NAME}_${3}dp_xhdpi.png"
	convert "$1" -resize ${SIZE_XXHDPI}x${SIZE_XXHDPI} -colorspace sRGB "$CWD/${NAME}_${3}dp_xxhdpi.png"
	convert "$1" -resize ${SIZE_XXXHDPI}x${SIZE_XXXHDPI} -colorspace sRGB "$CWD/${NAME}_${3}dp_xxxhdpi.png"
fi


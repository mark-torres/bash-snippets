#!/bin/bash

CONV_BIN=$(which convert)

if [ -z $CONV_BIN ]; then
	echo ImageMagik convert is not installed
	exit 1
fi

if [ -z $3 ]; then
	echo Usage: $0 SRC_FILE DST_NAME NEW_COLOR [OLD_COLOR]
	echo NOTE: Default OLD_COLOR value is 'black'
	exit 1
fi

# check color hex format
if [[ ! $3 =~ \#[0-9ABCDEF]{6} ]]; then
	echo The new color must be in hex format \(e.g. \#FFFFFF\)
	exit 1
fi

NEW_COLOR=$3

# default old color is black
OLD_COLOR=$4
if [ -z $OLD_COLOR ]; then
	OLD_COLOR='black'
fi

NAME=`echo $2 | sed -e 's/-/_/g'`

$CONV_BIN -density 1024 -background none -fill \'$NEW_COLOR\' -opaque \'$OLD_COLOR\' -fuzz 99% $1 ${NAME}.png

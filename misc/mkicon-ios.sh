#!/bin/bash
CWD=$(pwd)
convert $1 -resize 58x58 -colorspace sRGB $CWD/${2}_58x58.png
convert $1 -resize 80x80 -colorspace sRGB $CWD/${2}_80x80.png
convert $1 -resize 87x87 -colorspace sRGB $CWD/${2}_87x87.png
convert $1 -resize 120x120 -colorspace sRGB $CWD/${2}_120x120.png
convert $1 -resize 180x180 -colorspace sRGB $CWD/${2}_180x180.png

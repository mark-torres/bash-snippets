#!/bin/bash
CWD=$(pwd)
convert $1 -resize 48x48 -colorspace sRGB $CWD/${2}_mdpi.png
convert $1 -resize 72x72 -colorspace sRGB $CWD/${2}_hdpi.png
convert $1 -resize 96x96 -colorspace sRGB $CWD/${2}_xhdpi.png
convert $1 -resize 144x144 -colorspace sRGB $CWD/${2}_xxhdpi.png
convert $1 -resize 192x192 -colorspace sRGB $CWD/${2}_xxxhdpi.png

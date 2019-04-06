#!/bin/bash

W=400
H=300
COLORS=128

let "W1 = W - 15"
let "H1 = H - 15"

convert $1 -adaptive-resize ${W1}x${H1} -colors $COLORS -background none -gravity center -extent ${W}x${H} ${2}_a.png
convert $1 -adaptive-resize ${W1}x${H1} +dither -colors $COLORS -background none -gravity center -extent ${W}x${H} ${2}_b.png

#!/bin/bash
ICONS_DIR=/Users/markushi/vhosts/material-icons.local/htdocs
find $ICONS_DIR/*/drawable-xxxhdpi -type f -name "ic_*$1*"

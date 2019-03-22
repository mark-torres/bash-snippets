#!/bin/bash
ICONS_DIR=/Users/markushi/vhosts/material-icons.local/htdocs
find $ICONS_DIR/*/svg/production -type f -name "ic_*$1*"

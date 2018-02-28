#!/bin/bash
CMD_CURL=/usr/bin/curl
$CMD_CURL --location --silent --show-error -o $1.jpeg "https://instagram.com/p/$1/media/?size=l"

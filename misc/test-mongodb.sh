#!/bin/bash
MONGO_CLI=$(which mongo)

SRC_FILE="./mongosrc.js"

if [ -z $MONGO_CLI ]; then
	echo Mongo CLI client not found
	exit 1
fi

echo MongoDB shell: [$MONGO_CLI]

$MONGO_CLI $SRC_FILE

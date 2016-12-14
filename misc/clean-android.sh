#!/bin/bash
find . -type d -name build | xargs rm -rf
find . -type d -name .gradle | xargs rm -rf

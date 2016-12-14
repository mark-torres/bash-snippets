#!/bin/bash
find . -type d -name build | xargs du -sh
find . -type d -name .gradle | xargs du -sh

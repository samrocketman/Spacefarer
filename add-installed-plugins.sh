#!/bin/bash

find "${PWD%/*}" -maxdepth 2 -type d -name data | grep -vF "${PWD##*/}" | \
  sed 's#/data$##' | \
  xargs -n1 -- ./generate-plugin-data.sh

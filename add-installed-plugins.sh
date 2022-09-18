#!/bin/bash

set -euo pipefail

plugin_name="Spacefarer plugin"

find "${PWD%/*}" -maxdepth 2 -type d -name data | grep -vF "${PWD##*/}" | \
  sed 's#/data$##' | \
  tr '\n' '\0' | \
  xargs -0 -n1 -- ./generate-plugin-data.sh

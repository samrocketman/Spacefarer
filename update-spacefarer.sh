#!/bin/bash

if [ ! -f "${0##*/}" ] || [ -d .git ]; then
  echo 'ERROR must be in spacefarer submodule.' >&2
  exit 1
fi

rm -rf data

./generate-plugin-data.sh ../..

./add-installed-plugins.sh

find data -type f -name '*.txt' -exec dos2unix {} +

#!/bin/bash

if [ ! -f "${0##*/}" ]; then
  echo 'ERROR must be in same directory as '"${0##*/}" >&2
  exit 1
fi

rm -rf data

./generate-plugin-data.sh "${1:-../..}"

if [ -z "${1:-}" ]; then
  ./add-installed-plugins.sh
fi

find data -type f -name '*.txt' -exec dos2unix {} +

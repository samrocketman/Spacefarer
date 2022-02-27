#!/bin/bash

set -euo pipefail

plugin_name="Spacefarer plugin"

#
# Initial environment checking
#
if [ "$#" -eq 0 ]; then
  echo 'ERROR: first argument must be a local Endless Sky git repo.' >&2
  exit 1
fi
if [ -d "$1"/.git ] && [ ! -f "$1"/endless-sky.desktop ]; then
  echo 'ERROR: first argument must be a local Endless Sky git repo.' >&2
  exit 1
fi
if [ ! -d .git ] || [ ! -f "${0##*/}" ]; then
  echo "ERROR: This script must be run from the ${plugin_name} git repository." >&2
  exit 1
fi

pushd "$1"

#
# Automaically generate outfit constraints
#
echo 'Creating outfit constraints.'
grep -rl -- '^outfit ' data | while read data_file; do
  mkdir -p ~1/"${data_file%/*}"
  grep -ro '^outfit .*' "${data_file}" | \
  grep -vFf ~1/metadata/skip-outfits.txt | \
    tr '\n' '\0' | \
    xargs -0 -n1 -I{} -- echo -e '{}\n\t"unplunderable" 1' > ~1/"${data_file}"
  echo "    Created '${data_file}'."
done

#
# Automaically generate ship constraints
#
echo 'Creating ship constraints.'
grep -rl -- '^ship ' data | while read data_file; do
  mkdir -p ~1/"${data_file%/*}"
  (
    grep -ro '^ship .*' "${data_file}" | \
    grep -vFf ~1/metadata/skip-ships.txt |
      tr '\n' '\0' | \
      xargs -0 -n1 -I{} -- echo -e '{}\n\t"uncapturable"' > ~1/"${data_file}"
    echo "    Created '${data_file}'."
  ) || rm -f ~1/"${data_file}"
done

git rev-parse HEAD > ~1/metadata/endless-sky-commit

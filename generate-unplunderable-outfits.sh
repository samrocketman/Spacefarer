#!/bin/bash

set -eo pipefail

plugin_name="no-cap plugin"

#
# Initial environment checking
#
if [ "$#" -eq 0 ]; then
  echo 'ERROR: first argument must be a local endless sky git repo.' >&2
  exit 1
fi
if [ -d "$1"/.git ] && ! [ -f "$1"/endless-sky.desktop ]; then
  echo 'ERROR: first argument must be a local endless sky git repo.' >&2
  exit 1
fi
if [ ! -d .git ] || [ ! -f "${0##*/}" ]; then
  echo "ERROR: This script must be run from the ${plugin_name} git repository." >&2
  exit 1
fi

pushd "$1"
grep -rl -- '^outfit ' data | while read data_file;do
  mkdir -p ~1/"${data_file%/*}"
  grep -ro '^outfit .*' "${data_file}" | \
    tr '\n' '\0' | \
    xargs -0 -n1 -I{} -- echo -e '{}\n\t"unplunderable" 1' > ~1/"${data_file}"
    echo "Created '${data_file}'."
done

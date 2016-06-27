#!/usr/bin/env bash

set -euo pipefail
IFS=$'\n\t'

mkdir -p bin/
rm bin/*

for i in src/*; do
  bin=bin/${i#src/}
  cat "lib/nodeselektor-lib" "${i}" > $bin
  chmod 755 $bin
done

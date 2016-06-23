#!/usr/bin/env bash

set -euo pipefail
IFS=$'\n\t'

./bin/ns --version
./bin/ns --version test/1/lib/index.js
./bin/ns --version test/1/index.js

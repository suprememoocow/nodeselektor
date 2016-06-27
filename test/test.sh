#!/usr/bin/env bash

set -euo pipefail
IFS=$'\n\t'

set -x

script_dir="$( cd "$( dirname "${BASH_SOURCE[0]}" )" > /dev/null && pwd )"

pushd . > /dev/null
cd ${script_dir}

[[ $(../bin/ns --version) == "v4.4.3" ]];
[[ $(../bin/ns --version 1/lib/index.js) == "v5.10.1" ]];
[[ $(../bin/ns --version 1/index.js) == "v5.10.1" ]];

source ../lib/nodeselektor-lib

[[ $(find_package_root_path .) == "$(cd .. && pwd)" ]]

popd > /dev/null

# nodeselektor

### Usage

```shell
# Install nodeselektor
npm i -g nodeselektor

# nodeselektor is not global
# but rather set on a per-directory
# (including subdirectories) basis

cd /nodeproject

# Configure the path to the node version
# you would like to use in this project

ns-use /path/to/node/4.3.3

# Rebuild the node_modules directory if required
ns-npm-reinit

# Use the configured node
ns index.js
# -> /path/to/node/4.3.3/bin/node index.js

# Note that `ns` works on the script's directory,
# not the current working directory, so calling
# a script from another directory will work
# correctly

cd /
ns /nodeproject/index.js
# -> /path/to/node/4.3.3/bin/node /nodeproject/index.js

# Change the version of node
cd /nodeproject
ns-use /path/to/node/v5.0.0

# Reinstall node_modules as binary dependencies will no
# longer work
ns-npm-reinit

```

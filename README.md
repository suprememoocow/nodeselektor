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

## Why not use `nvm`?

`nvm` is great for a development environment, but it's less suited to server environments. It's implemented as a set of bash functions, which makes it difficult to use from cron scripts, init scripts and upstart. `nodeselektor` is primarily designed to run in a server environment, although it can be used in a development environment too.

## How does it work

`nodeselektor` writes a file alongside the module's `package.json`, called `.node-selektor`. This typically looks something like:

```
; .node-selektor configuration file
; do not check this into source control
; add it to .gitignore
node_path=/Users/andrewn/.nvm/v0.10.36
node_modules_version=11
```

`node_path` is the path to the nodejs installation that this project should use to run.
`node_modules_version` refers to the moduel version (`process.versions.modules`) which was used during the last `ns-npm-reinit` run. This lets `nodeselektor` figure out whether to rebuild the `node_modules` directory for native modules.

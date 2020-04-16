#!/usr/bin/env bash

set -e

pushd "$(dirname "$0")"
git submodule update --init
vim +PlugInstall +PlugUpdate +qa
popd

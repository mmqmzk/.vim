#!/usr/bin/env bash
ROOT=$(cd "$(dirname $0)"; pwd)
cd $ROOT
git submodule update --init
vim -c "PlugInstall" -c "PlugUpdate"  -c "qa"

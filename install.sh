#!/usr/bin/env bash

pushd "$(dirname "$0")"
git submodule update --init
vim -c "PlugInstall | PlugUpdate | qa"
pip3 install --user pynvim -U
npm install -g bash-language-server
sudo apt update -qq && sudo apt install shellcheck -y
popd

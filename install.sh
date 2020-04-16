#!/usr/bin/env bash

set -e

pushd "$(dirname "$0")"
git submodule update --init
vim +PlugInstall +PlugUpdate +qa
pip3 install --user pynvim -U
npm install -g bash-language-server
if which brew &> /dev/null; then
  brew install shellcheck shfmt
else
  sudo apt update -qq && sudo apt install shellcheck -y
fi
popd

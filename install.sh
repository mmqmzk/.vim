#!/usr/bin/env bash

set -e

pushd "$(dirname "$0")"
git submodule update --init
vim +PlugInstall +PlugUpdate +qa
npm install -g bash-language-server || true
if which brew &>/dev/null; then
  brew install shellcheck shfmt
else
  sudo apt update -qq && sudo apt install shellcheck -y
fi
popd

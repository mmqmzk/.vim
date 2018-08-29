#!/bin/bash
cd ~/.vim
git submodule init
git submodule update
vim -c "PlugInstall" -c "PlugUpdate"  -c "qa"

#!/bin/bash
cd ~/.vim
git submodule init
git submodule update
vim -c "PlugInstll" -c "qa"

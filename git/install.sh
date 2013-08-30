#!/bin/bash

echo -n "Installing git config... "

rm -f ~/.gitignore
ln -s $1/gitignore ~/.gitignore

rm -f ~/.gitconfig
ln -s $1/gitconfig ~/.gitconfig

echo "done."

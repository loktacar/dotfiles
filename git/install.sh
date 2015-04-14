#!/bin/bash

echo -n "Installing git config... "

location="${@: -1}"

rm -f ~/.gitignore
ln -s $location/gitignore ~/.gitignore

rm -f ~/.gitconfig
ln -s $location/gitconfig ~/.gitconfig

echo "done."

#!/bin/bash

echo -n "Installing git config... "

location="${@: -1}"

rm ~/.gitignore
ln -s $location/gitignore ~/.gitignore

rm ~/.gitconfig
ln -s $location/gitconfig ~/.gitconfig

echo "done."

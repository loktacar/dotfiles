#!/bin/bash

echo -n "Installing git config... "

location="${@: -1}"

rm ~/.gitignore 2> /dev/null
ln -s $location/gitignore ~/.gitignore

rm ~/.gitconfig 2> /dev/null
ln -s $location/gitconfig ~/.gitconfig

echo "done."

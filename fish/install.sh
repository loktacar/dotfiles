#!/bin/bash

echo -n "Installing fish config... "

location="${@: -1}"

mkdir -p ~/.config/fish

rm ~/.config/fish/config.fish 2> /dev/null
rm ~/.config/fish/functions 2> /dev/null
ln -s $location/config.fish ~/.config/fish/config.fish
ln -s $location/functions ~/.config/fish/functions

echo "done."

#!/bin/bash

echo -n "Installing fish config... "

location="${@: -1}"

mkdir -p ~/.config/fish

rm -f ~/.config/fish/config.fish
rm -f ~/.config/fish/functions
ln -s $location/config.fish ~/.config/fish/config.fish
ln -s $location/functions ~/.config/fish/functions

echo "done."

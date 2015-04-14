#!/bin/bash

echo -n "Installing bash config... "

location="${@: -1}"

rm -f ~/.bashrc
ln -s $location/bashrc ~/.bashrc

echo "done."

#!/bin/bash

echo -n "Installing bash config... "

location="${@: -1}"

rm ~/.bashrc 2> /dev/null
ln -s $location/bashrc ~/.bashrc

echo "done."

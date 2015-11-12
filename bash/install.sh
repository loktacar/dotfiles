#!/bin/bash

echo -n "Installing bash config... "

location="${@: -1}"

rm ~/.bashrc
ln -s $location/bashrc ~/.bashrc

echo "done."

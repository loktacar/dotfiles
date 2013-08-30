#!/bin/bash

echo -n "Installing bash config... "

rm -f ~/.bashrc
ln -s $1/bashrc ~/.bashrc

echo "done."

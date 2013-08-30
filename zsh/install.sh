#!/bin/bash

echo -n "Installing zshrc... "

rm -f ~/.zshrc
ln -s $1/zshrc ~/.zshrc

echo "done."

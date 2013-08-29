#!/bin/bash

echo -n "Installing zsh... "

rm -f ~/.zsh
ln -s $1/zsh ~/.zsh

rm -f ~/.zshrc
ln -s $1/zshrc ~/.zshrc

echo "done."

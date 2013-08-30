#!/bin/bash

echo -n "Installing zsh... "

rm -f ~/.zshrc
ln -s $1/zshrc ~/.zshrc

rm -f ~/.oh-my-zsh
ln -s $1/oh-my-zsh ~/.oh-my-zsh

echo "done."

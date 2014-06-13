#!/bin/bash

echo -n "Installing zsh config... "

rm -f ~/.zshrc
ln -s $1/zshrc ~/.zshrc

rm -f ~/.zprofile
ln -s $1/zprofile ~/.zprofile

rm -f ~/.oh-my-zsh
ln -s $1/oh-my-zsh ~/.oh-my-zsh

echo "done."

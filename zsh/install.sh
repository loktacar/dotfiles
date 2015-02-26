#!/bin/bash

echo -n "Installing zsh config... "

# Install oh-my-zsh
# only installed if the directory doesn't exist, it's updated automatically
if [ ! -d $1/oh-my-zsh ]; then
  git clone https://github.com/robbyrussell/oh-my-zsh.git $1/oh-my-zsh > /dev/null
fi

rm -f ~/.zshrc
ln -s $1/zshrc ~/.zshrc

rm -f ~/.zprofile
ln -s $1/zprofile ~/.zprofile

rm -f ~/.oh-my-zsh
ln -s $1/oh-my-zsh ~/.oh-my-zsh

echo "done."

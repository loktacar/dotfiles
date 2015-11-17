#!/bin/bash

echo -n "Installing zsh config... "

location="${@: -1}"

# Install oh-my-zsh
# only installed if the directory doesn't exist, it's updated automatically
if [ ! -d $location/oh-my-zsh ]; then
  git clone --quiet https://github.com/robbyrussell/oh-my-zsh.git $location/oh-my-zsh
fi

rm ~/.zshrc 2> /dev/null
ln -s $location/zshrc ~/.zshrc

rm ~/.zprofile 2> /dev/null
ln -s $location/zprofile ~/.zprofile

rm ~/.oh-my-zsh 2> /dev/null
ln -s $location/oh-my-zsh ~/.oh-my-zsh

echo "done."

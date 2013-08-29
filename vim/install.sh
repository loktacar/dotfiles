#!/bin/bash

echo -n "Installing vim... "

rm -f ~/.vim
ln -s $1/vim ~/.vim

rm -f ~/.vimrc
ln -s $1/vimrc ~/.vimrc

echo "done."

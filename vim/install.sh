#!/bin/bash

echo -n "Installing vim config... "

rm -f ~/.vim
ln -s $1/vim ~/.vim

rm -f ~/.vimrc
ln -s $1/vimrc ~/.vimrc

# Make shougo-vimproc
if [ -f $1/vim/bundle/vimproc.vim/Makefile ];
then
  cd $1/vim/bundle/vimproc.vim
  make > /dev/null
fi

echo "done."

#!/bin/bash

echo -n "Installing vim config... "

rm -f ~/.vim
ln -s $1/vim ~/.vim

rm -f ~/.vimrc
ln -s $1/vimrc ~/.vimrc

# Make shougo-vimproc
if [ -f $1/vim/bundle/shugo-vimproc/Makefile ];
then
  cd $1/vim/bundle/shugo-vimproc
  make > /dev/null
fi

echo "done."

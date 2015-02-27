#!/bin/bash

echo -n "Installing vim config... "

rm -f ~/.vim
ln -s $1/vim ~/.vim

rm -f ~/.vimrc
ln -s $1/vimrc ~/.vimrc

# Install Vundle.vim
# only installed if the directory doesn't exist, it's updated via BundleUpdate (see next command)
if [ ! -d $1/vim/bundle/Vundle.vim ]; then
  git clone --quiet https://github.com/gmarik/Vundle.vim.git $1/vim/bundle/Vundle.vim
fi

# Install and or update Vundle plugins
vim -c "BundleInstall" -c "BundleUpdate" -c "qall"

# Make shougo-vimproc
if [ -f $1/vim/bundle/vimproc.vim/Makefile ]; then
  cd $1/vim/bundle/vimproc.vim
  make > /dev/null
fi

echo "done."


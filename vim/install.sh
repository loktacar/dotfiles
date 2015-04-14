#!/bin/bash

echo -n "Installing vim config... "

location="${@: -1}"

while [[ $# > 1 ]]; do
  key="$1"

  case $key in
      --skip-vim-plugins)
      SKIP_VIM_PLUGINS=true
      ;;
      *)
              # unknown option
      ;;
  esac

  shift
done

rm -f ~/.vim
ln -s $location/vim ~/.vim

rm -f ~/.vimrc
ln -s $location/vimrc ~/.vimrc

# Install Vundle.vim
# only installed if the directory doesn't exist, it's updated via BundleUpdate (see next command)
if [ ! -d $location/vim/bundle/Vundle.vim ]; then
  git clone --quiet https://github.com/gmarik/Vundle.vim.git $location/vim/bundle/Vundle.vim
fi

# Install and or update Vundle plugins
if [ ! $SKIP_VIM_PLUGINS ]; then
  vim -c "BundleInstall" -c "BundleUpdate" -c "qall"
fi

# Make shougo-vimproc
if [ -f $location/vim/bundle/vimproc.vim/Makefile ]; then
  cd $location/vim/bundle/vimproc.vim
  make > /dev/null
fi

echo "done."


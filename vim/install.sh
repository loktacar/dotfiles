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

rm ~/.vim 2> /dev/null
ln -s $location/vim ~/.vim

rm ~/.vimrc 2> /dev/null
ln -s $location/vimrc ~/.vimrc

rm -f ~/.config/nvim 2> /dev/null
ln -s $location/vim ~/.config/nvim

rm -f ~/.config/nvim/init.vim 2> /dev/null
ln -s $location/vimrc ~/.config/nvim/init.vim

# Install plug.vim plugin manager
# only installed if the directory doesn't exist, it's updated via BundleUpdate (see next command)
if [ ! -d $location/autoload/plug.vim ]; then
  curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
fi

# Install and or update Vundle plugins
if [ ! $SKIP_VIM_PLUGINS ]; then
  #vim -c "BundleInstall" -c "BundleUpdate" -c "qall"
  vim -c "PlugInstall" -c "qall"
fi

echo "done."


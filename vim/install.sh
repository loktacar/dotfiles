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

echo "done."


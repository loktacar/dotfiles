#!/bin/bash

echo -n "Installing tmux config... "

location="${@: -1}"

rm -f ~/.tmux.conf
ln -s $location/tmux.conf ~/.tmux.conf

echo "done."

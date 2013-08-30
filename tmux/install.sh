#!/bin/bash

echo -n "Installing tmux config... "

rm -f ~/.tmux.conf
ln -s $1/tmux.conf ~/.tmux.conf

echo "done."

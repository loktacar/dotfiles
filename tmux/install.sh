#!/bin/bash

echo -n "Installing tmux config... "

location="${@: -1}"

rm ~/.tmux.conf 2> /dev/null
ln -s $location/tmux.conf ~/.tmux.conf

echo "done."

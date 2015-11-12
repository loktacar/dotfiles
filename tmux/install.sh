#!/bin/bash

echo -n "Installing tmux config... "

location="${@: -1}"

rm ~/.tmux.conf
ln -s $location/tmux.conf ~/.tmux.conf

echo "done."

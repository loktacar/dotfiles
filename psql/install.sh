#!/bin/bash

echo -n "Installing psql... "

rm -f ~/.psqlrc
ln -s $1/psqlrc ~/.psqlrc

echo "done."

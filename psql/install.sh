#!/bin/bash

echo -n "Installing psql config... "

rm -f ~/.psqlrc
ln -s $1/psqlrc ~/.psqlrc

echo "done."

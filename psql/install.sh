#!/bin/bash

echo -n "Installing psql config... "

location="${@: -1}"

rm -f ~/.psqlrc
ln -s $location/psqlrc ~/.psqlrc

echo "done."

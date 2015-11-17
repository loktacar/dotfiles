#!/bin/bash

echo -n "Installing psql config... "

location="${@: -1}"

rm ~/.psqlrc 2> /dev/null
ln -s $location/psqlrc ~/.psqlrc

echo "done."

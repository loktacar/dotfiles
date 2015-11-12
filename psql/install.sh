#!/bin/bash

echo -n "Installing psql config... "

location="${@: -1}"

rm ~/.psqlrc
ln -s $location/psqlrc ~/.psqlrc

echo "done."

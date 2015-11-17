#!/bin/bash

echo -n "Installing latexmk config... "

location="${@: -1}"


rm ~/.latexmkrc 2> /dev/null
ln -s $location/latexmkrc ~/.latexmkrc

echo "done."

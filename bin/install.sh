#!/bin/bash

echo -n "Installing bin files... "

eval binfolder="~/.bin"

mkdir -p "$binfolder"

for location in "${@: -1}"/*; do
  filename="$(basename "$location")"
  if [[ -f "$location" && -x "$location" && ! $filename == "install.sh" ]]; then
    rm "$binfolder/$filename" 2> /dev/null
    ln -s "$location" "$binfolder"/"$filename"
  fi
done

echo "done."

#!/bin/bash

eval dotfiles="~/.dotfiles"

if [[ -d "$dotfiles" ]]; then
  echo "Running $dotfiles/*/install.sh"
else
  echo "$dotfiles does not exist"
  exit 1
fi

# Find subfolders of $dotfiles
for location in "$dotfiles"/*; do
  # Check if directory
  if [[ -d "$location" ]]; then
    # Check if install.sh is file and is executable
    if [[ -f "$location"/install.sh && -x "$location"/install.sh ]]; then
      # execute install.sh
      "$location"/install.sh "$location"
    fi
  fi
done

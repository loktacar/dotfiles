#!/bin/bash

PREVDIR="$( pwd )"

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

if [[ -d "$DIR" ]]; then
  echo "Running $DIR/*/install.sh"
else
  echo "$DIR does not exist"
  exit 1
fi

# Update submodules
echo -n "Updating git submodules... "
cd $DIR
git submodule init
git submodule update
echo "done."


# Find subfolders of $DIR
for location in "$DIR"/*; do
  # Check if directory
  if [[ -d "$location" ]]; then
    # Check if install.sh is file and is executable
    if [[ -f "$location"/install.sh && -x "$location"/install.sh ]]; then
      # execute install.sh
      "$location"/install.sh "$location"
    fi
  fi
done

cd $PREVDIR

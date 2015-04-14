#!/bin/bash

# Process command line arguements
ARGUMENTS=$@

while [[ $# > 1 ]]; do
  key="$1"

  case $key in
      -c|--components)
      COMPONENTS=",$2,"
      shift
      ;;
      *)
              # unknown option
      ;;
  esac

  shift
done

PREVDIR="$( pwd )"

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

if [[ -d "$DIR" ]]; then
  echo "Running $DIR/*/install.sh"
else
  echo "$DIR does not exist"
  exit 1
fi

# Find subfolders of $DIR
for location in "$DIR"/*; do
  # If components are selected, skip those that do not match
  if [[ -n $COMPONENTS && ! $COMPONENTS == *",`basename $location`,"* ]]; then
    continue
  fi

  # Check if directory
  if [[ -d "$location" ]]; then
    # Check if install.sh is file and is executable
    if [[ -f "$location"/install.sh && -x "$location"/install.sh ]]; then
      # execute install.sh with location and ARGUMENTS as arguments
      "$location"/install.sh "$location" $ARGUMENTS
    fi
  fi
done

cd $PREVDIR

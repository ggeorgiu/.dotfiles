#!/bin/zsh

printf "CREATING SYMLINKS...\n"

# check if it should be a dry run or not
dry_run=1
while getopts x val
do
	case $val in
  x) dry_run=0;;
  ?) printf "Invalid value provided"
   	  exit 2;;
  esac
done

if [ "$dry_run" -eq 1 ]; then
		stow --restow . -n -v
		printf "SYMLINKS CREATED -- DRY-RUN \n\n"
		exit 0
fi

stow --restow .

printf "SYMLINKS CREATED \n\n"

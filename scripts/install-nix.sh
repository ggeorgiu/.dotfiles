#!/bin/zsh

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

#current path
current_path=$(pwd)

# nix path
nix_path="$HOME/.config/"

if [ "$dry_run" -eq 1 ]; then
 printf "copying %s into %s\n" "$current_path/nix" "$nix_path"
 exit 0
fi

cp -r "$current_path/nix" "$nix_path/"

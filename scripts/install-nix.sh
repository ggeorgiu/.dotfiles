#!/bin/zsh

#current path
current_path=$(pwd)

# nix path
nix_path="$HOME/.config/"

cd "$nix_path" || exit
cp -r "$current_path/nix" "$nix_path/"

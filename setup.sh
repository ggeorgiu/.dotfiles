#!/bin/bash

# target="~/.config"
list_dir_cmd=$(find . -maxdepth 1 -type d -not -path "./.*" -not -path "." | sed -e s/^..//)

echo "Starting configuration..."
for dir in $list_dir_cmd; do 
    echo "$dir -> y/n?"
    read -r yn
    case $yn in 
        [yY])
            stow "$dir"
            ;;
        *)
            echo "Skipping $dir..."
            ;;
    esac
done


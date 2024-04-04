#!/bin/bash

# target="~/.config"
list_dir_cmd=$(find . -maxdepth 1 -type d -not -path "./.*" -not -path "." | sed -e s/^..//)

echo "Starting configuration..."
for dir in $list_dir_cmd; do 
    echo -n "$dir -> y/n? "
    read -r yn
    case $yn in 
        [yY])
            stow -v "$dir"
            echo "Configured $dir"
            ;;
        *)
            echo "Skipped $dir"
            ;;
    esac
done


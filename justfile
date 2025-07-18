
dotfiles_dir := justfile_directory()

stow:
    cd "{{ dotfiles_dir }}"
    ./scripts/stow.sh

stow-execute:
    cd "{{ dotfiles_dir }}"
    ./scripts/stow.sh -x

install-nix:
    cd "{{ dotfiles_dir }}"
    ./scripts/install-nix.sh

install-nix-execute:
    cd "{{ dotfiles_dir }}"
    ./scripts/install-nix.sh

install: install-nix stow

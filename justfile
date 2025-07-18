dotfiles_dir := justfile_directory()

stow:
    @cd "{{ dotfiles_dir }}"
    @./scripts/stow.sh

stow-exec:
    @cd "{{ dotfiles_dir }}"
    @./scripts/stow.sh -x

install-nix:
    @cd "{{ dotfiles_dir }}"
    @./scripts/install-nix.sh

install-nix-exec:
    @cd "{{ dotfiles_dir }}"
    @./scripts/install-nix.sh -x

install: install-nix stow

install-exec: install-nix-exec stow-exec

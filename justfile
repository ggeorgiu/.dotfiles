dotfiles_dir := justfile_directory()

stow-dry-run:
    @cd "{{ dotfiles_dir }}"
    @./zzz-install-scripts/stow.sh

stow:
    @cd "{{ dotfiles_dir }}"
    @./zzz-install-scripts/stow.sh -x

install-nix-dry-run:
    @cd "{{ dotfiles_dir }}"
    @./zzz-install-scripts/install-nix.sh

install-nix:
    @cd "{{ dotfiles_dir }}"
    @./zzz-install-scripts/install-nix.sh -x

install-dry-run: install-nix-dry-run stow-dry-run

install: install-nix stow

{
  description = "Personal nix-darwin system flake";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
    nix-darwin.url = "github:LnL7/nix-darwin/master";
    nix-darwin.inputs.nixpkgs.follows = "nixpkgs";
    nix-homebrew.url = "github:zhaofengli-wip/nix-homebrew";

    # Optional: Declarative tap management
    # utilitywarehouse-tap = {
      # url = "git+ssh://github:utilitywarehouse/homebrew-tap";
      # flake = false;
    # };
    uw-labs-tap = {
       url = "github:uw-labs/homebrew-tap";
       flake = false;
    };
    hashicorp-tap = {
        url = "github:hashicorp/homebrew-tap";
        flake = false;
    };
    homebrew-core = {
      url = "github:homebrew/homebrew-core";
      flake = false;
    };
    homebrew-cask = {
      url = "github:homebrew/homebrew-cask";
      flake = false;
    };
    homebrew-bundle = {
      url = "github:homebrew/homebrew-bundle";
      flake = false;
    };
  };

  outputs = inputs@{ self, nix-darwin, nixpkgs, nix-homebrew, homebrew-core, homebrew-cask, homebrew-bundle, uw-labs-tap, hashicorp-tap }:
  let
    configuration = { pkgs, config, ... }: {
      nixpkgs.config.allowUnfree = true;

      # List packages installed in system profile. To search by name, run:
      # $ nix-env -qaP | grep wget
      environment.systemPackages =
        [ 
            pkgs.mkalias
            pkgs.alacritty
            pkgs.oh-my-posh
            pkgs.neofetch
            pkgs.neovim
            pkgs.efm-langserver
            pkgs.lua
            pkgs.luajit
            pkgs.lua-language-server
            pkgs.luarocks-nix
            pkgs.tree-sitter
            pkgs.eza
            pkgs.fzf
            pkgs.jq
            pkgs.findutils
            pkgs.ripgrep
            pkgs.gnused
            pkgs.tmux
            pkgs.zoxide
            pkgs.curl
            pkgs.buf
            pkgs.grpcurl
            pkgs.google-cloud-sdk
            pkgs.lima
            pkgs.colima
            pkgs.qemu
            pkgs.xz 
            pkgs.k9s
            pkgs.kubectx
            pkgs.kubefwd
            pkgs.kustomize
            pkgs.kubectl
            pkgs.gnutls
            pkgs.stow
            pkgs.direnv
            pkgs.docker
            pkgs.pre-commit
            pkgs.tflint
            pkgs.nodejs
            pkgs.terminal-notifier
            pkgs.timer
            pkgs._1password-cli
            pkgs.awscli
            pkgs.jq
            pkgs.postgresql
            pkgs.gh
            pkgs.go-migrate
            pkgs.just
        ];

      homebrew = {
        enable = true;
        brews = [
            "strongbox"
            "hashicorp/tap/terraform"
            "snzip"
        ];
        onActivation.cleanup = "zap";
      };
      fonts.packages =
        [
            pkgs.nerd-fonts.jetbrains-mono
        ];

      # Activation scripts
      system.activationScripts.applications.text = let
        env = pkgs.buildEnv {
        name = "system-applications";
        paths = config.environment.systemPackages;
        pathsToLink = "/Applications";
      };
      in
        pkgs.lib.mkForce ''
        # Set up applications.
        echo "setting up /Applications..." >&2
        rm -rf /Applications/Nix\ Apps
        mkdir -p /Applications/Nix\ Apps
        find ${env}/Applications -maxdepth 1 -type l -exec readlink '{}' + |
        while read -r src; do
            app_name=$(basename "$src")
            echo "copying $src" >&2
             ${pkgs.mkalias}/bin/mkalias "$src" "/Applications/Nix Apps/$app_name"
        done 
            ''; 
                
      # Necessary for using flakes on this system.
      nix.settings.experimental-features = "nix-command flakes";

      # Enable alternative shell support in nix-darwin.
      # programs.fish.enable = true;

      # Set Git commit hash for darwin-version.
      system.configurationRevision = self.rev or self.dirtyRev or null;

      # Used for backwards compatibility, please read the changelog before changing.
      # $ darwin-rebuild changelog
      system.stateVersion = 6;

      # The platform the configuration will be used on.
      nixpkgs.hostPlatform = "aarch64-darwin";

      system.primaryUser="gabrielgeorgiu";
    };
  in
  {
    # Build darwin flake using:
    # $ darwin-rebuild build --flake .#work
    darwinConfigurations."work" = nix-darwin.lib.darwinSystem {
      modules = [ 
        configuration 
        nix-homebrew.darwinModules.nix-homebrew
        {
            nix-homebrew = {
                enable = true;
                # Apple Silicon 
                enableRosetta = true;
                # User owning the homebrew prefix
                user = "gabrielgeorgiu";
                taps = {
                  "homebrew/homebrew-core" = homebrew-core;
                  "homebrew/homebrew-cask" = homebrew-cask;
                  "homebrew/homebrew-bundle" = homebrew-bundle;
                  "hashicorp/homebrew-tap" = inputs.hashicorp-tap;
                  "uw-labs/homebrew-tap" = inputs.uw-labs-tap;
                };
                mutableTaps = false;
            };
        }
      ];
    };
  };
}

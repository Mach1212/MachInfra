{
  # ✅ make user config easy
  # ✅ Home manager nixvim config
  # Download config to wsl automatically

  description = "A very basic flake";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    nixos-wsl.url = "github:nix-community/NixOS-WSL/main";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nixvim-config = {
      url = "path:../nixvim_config";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    agenix.url = "github:ryantm/agenix";
  };

  outputs = {
    nixpkgs,
    nixos-wsl,
    home-manager,
    agenix,
    ...
  } @ inputs: {
    nixosConfigurations = let
      mkSystem = {
        hostName ? "nixos",
        system ? "x86_64-linux",
        modules,
      }:
        nixpkgs.lib.nixosSystem {
          inherit system;
          specialArgs = {inherit inputs system;};
          modules = modules ++ [{networking.hostName = hostName;}];
        };

      base = [
        home-manager.nixosModules.home-manager
        ({
          pkgs,
          system,
          ...
        }: {
          system.stateVersion = "25.05";
          users.mutableUsers = false;
          home-manager.useGlobalPkgs = true;
          home-manager.useUserPackages = true;
          environment.systemPackages = [agenix.packages.${system}.default];
          programs = {
            zsh.enable = true;
            neovim.enable = true;
            neovim.defaultEditor = true;
          };
          users.defaultUserShell = pkgs.zsh;
        })
      ];
    in {
      mach12wsl = mkSystem {
        hostName = "mach12wsl";
        modules =
          base
          ++ [
            {wsl.defaultUser = "mach12";}
            ({pkgs, ...} @ args:
              import ./users/mach12.nix (args
                // {
                  uid = 1000;
                  extraGroups = ["wheel"];
                }))
            nixos-wsl.nixosModules.default
            ./hosts/wsl.nix
          ];
      };
    };
  };
}

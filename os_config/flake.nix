{
  description = "A very basic flake";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    nixos-wsl.url = "github:nix-community/NixOS-WSL/main";
    nixvim.url = "github:mach1212/neovim-nightly-overlay";
  };

  outputs = {
    nixpkgs,
    nixos-wsl,
    ...
  }: {
    nixosConfigurations = let
      base = [
        {system.stateVersion = "25.05";}
      ];
      dev = [
        ./modules/cli/vim.nix
      ];
    in {
      dev = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        modules =
          base
          ++ [
            nixos-wsl.nixosModules.default
            ./hosts/wsl.nix
            dev
          ];
      };
    };
  };
}

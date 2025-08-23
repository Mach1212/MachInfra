{
  description = "A very basic flake";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    nixos-wsl.url = "github:nix-community/NixOS-WSL/main";
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
    in {
      nixos = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        modules =
          base
          ++ [
            nixos-wsl.nixosModules.default
            ./hosts/wsl.nix
          ];
      };
    };
  };
}

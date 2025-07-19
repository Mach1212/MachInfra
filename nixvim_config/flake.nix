{
  description = "A feature based nixvim configuration";

  inputs = {
    # https://lazamar.co.uk/nix-versions/
    # https://github.com/NixOS/nixpkgs/tags
    # nixpkgs.url = "github:{owner}/{repo}/{commitHash/Tag}";
    nixpkgs.url = "github:nixos/nixpkgs/nixpkgs-unstable";
    nixpkgs-old.url = "github:NixOS/nixpkgs/05bbf675397d5366259409139039af8077d695ce";
    nixvim.url = "github:nix-community/nixvim";
    neovim-nightly-overlay.url = "github:nix-community/neovim-nightly-overlay";
    flake-parts.url = "github:hercules-ci/flake-parts";
    astrotheme = {
      url = "github:AstroNvim/astrotheme";
      flake = false;
    };
    # haumea
  };

  outputs = {
    nixvim,
    flake-parts,
    ...
  } @ inputs:
    flake-parts.lib.mkFlake {inherit inputs;} {
      systems = [
        "x86_64-linux"
        "aarch64-linux"
        "x86_64-darwin"
        "aarch64-darwin"
      ];

      perSystem = {system, ...}: let
        nixvimLib = nixvim.lib.${system};
        nixvim' = nixvim.legacyPackages.${system};
        nixvimModule = {
          inherit system; # or alternatively, set `pkgs`
          module = {
            imports = [
              ./nixvim
              ./features
            ];
          }; # import the module directly
          # You can use `extraSpecialArgs` to pass additional arguments to your module files
          extraSpecialArgs = {
            inherit inputs;
            pkgs-old = import inputs.nixpkgs-old {inherit system;};
          };
        };
        nvim = nixvim'.makeNixvimWithModule nixvimModule;
      in {
        checks = {
          # Run `nix flake check .` to verify that your config is not broken
          default = nixvimLib.check.mkTestDerivationFromNixvimModule nixvimModule;
        };

        packages = {
          # Lets you run `nix run .` to start nixvim
          default = nvim;
        };
      };
    };
}

{
  inputs,
  pkgs,
  ...
}: let
  neovimLibs = [pkgs.gcc14.cc.lib];
  neovimLuaPkgs = ps: [ps.magick];
in {
  # package = pkgs.makeWrapper inputs.neovim-nightly-overlay.packages.${pkgs.system}.default
  package = (inputs.neovim-nightly-overlay.packages.${pkgs.system}.default).overrideAttrs (old: {
    nativeBuildInputs = (old.nativeBuildInputs or []) ++ [pkgs.makeWrapper];
    postFixup =
      (old.postFixup or "")
      + ''
        wrapProgram $out/bin/nvim \
          --prefix LD_LIBRARY_PATH : ${pkgs.lib.makeLibraryPath neovimLibs}
      '';
    meta =
      (old.meta or {})
      // {
        license = pkgs.lib.licenses.vim;
      };
  });
  extraLuaPackages = neovimLuaPkgs;
}

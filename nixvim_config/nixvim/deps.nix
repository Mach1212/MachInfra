{
  inputs,
  pkgs,
  ...
}: let
  neovimLibs = with pkgs; [gcc14.cc.lib];
in {
  extraPackages = with pkgs; [
    ripgrep
    fd
  ];
  extraLuaPackages = ps: [ps.magick];

  # package = pkgs.makeWrapper inputs.neovim-nightly-overlay.packages.${pkgs.system}.default
  package = (inputs.neovim-nightly-overlay.packages.${pkgs.system}.default).overrideAttrs (old: {
    nativeBuildInputs = (old.nativeBuildInputs or []) ++ [pkgs.makeWrapper];
    postFixup =
      (old.postFixup or "")
      +
      # bash
      ''
        wrapProgram $out/bin/nvim \
          --prefix LD_LIBRARY_PATH : ${pkgs.lib.makeLibraryPath neovimLibs}
      '';
    meta =
      (old.meta or {})
      // {
        license = pkgs.lib.licenses.vim;
      };
  });
}

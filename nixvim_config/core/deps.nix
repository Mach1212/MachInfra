{pkgs, ...}: let
  neovimLibs = with pkgs; [gcc15.cc.lib];
in {
  extraPackages = with pkgs; [
    ripgrep # telescope
    fd # telescope
    inotify-tools # lsp
    sccache # lsp
    mold # lsp
    jq # devdocs
    curl # devdocs
    pandoc # devdocs
    fzf # telescope
    fzy # telescope
    difftastic # lazygit, tiny-code-action
    gitflow # lazygit
    gh # octo
  ];
  extraLuaPackages = ps: [ps.magick];
  # extraPython3Packages = ps: with ps; [pynvim-pp jedi];
  # extraConfigVim = ''
  #   let g:python3_host_prog = '/home/mach12/.conda/bin/python'
  # '';

  env = {
    CC = "sccache gcc -fuse-ld=mold";
    CXX = "sccache g++ -fuse-ld=mold";
    RUSTC_WRAPPER = "sccache";
    RUSTFLAGS = "-C linker=mold";
  };

  package = pkgs.neovim-unwrapped.overrideAttrs (old: {
    lua = pkgs.luajit;
    withLuaJIT = true;
    nativeBuildInputs = (old.nativeBuildInputs or []) ++ [pkgs.makeWrapper];
    postFixup =
      (old.postFixup or "")
      +
      # bash
      ''
        wrapProgram $out/bin/nvim \
          --prefix LD_LIBRARY_PATH : ${pkgs.lib.makeLibraryPath neovimLibs}
      '';
  });
}

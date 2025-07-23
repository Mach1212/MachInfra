{
  imports = [
    ./backend/treesitter.nix
    ./color/colorscheme.nix
    ./color/nvim-colorizer.nix
    ./color/render-markdown.nix
    ./code/blink-cmp.nix
    ./code/conform.nix
    ./code/lsp.nix
    # ./ui/barbar.nix
    # ./ui/chadtree.nix
    ./ui/incline.nix
    ./ui/lualine.nix
    ./ui/neotree.nix
    ./ui/noice.nix
    ./ui/notify.nix
    ./ui/number-toggle.nix
    ./ui/telescope.nix
    ./ui/which-key.nix
    ./ux/better-escape.nix
  ];
  # TODO: maybe make this a chain of with ./color, etc?
  # TODO: when I open a new file and it doesn't have anything inside of it "new" then default template should spawn
  # TODO: flash shouldn't be in sidebar
  # TODO: fast nix builds https://github.com/Mic92/nix-fast-build. Requires gcc15
  # TODO: log highlighting, info, error, etc
  # TODO: filter logs lines plugin? like reduce file to only lines matching a regex
  # TODO: incline icon is washed out. Not recognizing dark mode? lualine's icons work

  plugins = {
    web-devicons.enable = true;
    rainbow-delimiters.enable = true;
    todo-comments.enable = true;
    nvim-autopairs = {
      # TODO: explore fastwrap
      enable = true;
      settings = {
        check_ts = true;
        disable_filetype = [
          "TelescopePrompt"
        ];
      };
    };
    ts-autotag = {
      enable = true;
      settings = {
        enable_close_on_slash = true;
      };
    };
    ts-comments.enable = true;
  };
}

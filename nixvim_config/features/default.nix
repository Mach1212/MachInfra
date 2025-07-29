{
  imports = [
    ./backend/toggleterm.nix
    ./backend/treesitter.nix
    ./color/colorscheme.nix
    ./color/indent-blankline.nix
    ./color/nvim-colorizer.nix
    ./color/otter.nix
    ./color/render-markdown.nix
    ./code/blink-cmp.nix
    ./code/blink-cmp-spell.nix
    ./code/conform.nix
    ./code/tailwind-tools.nix
    ./code/guess-indent.nix
    ./code/jupyter.nix
    ./code/lsp.nix
    ./code/rust-tools.nix
    ./code/tailwind-tools.nix
    ./code/ts-comments.nix
    ./code/typescript-tools.nix
    ./ui/barbar.nix
    ./ui/gitsigns.nix
    # ./ui/chadtree.nix
    ./ui/incline.nix
    ./ui/lualine.nix
    ./ui/neotree.nix
    ./ui/noice.nix
    ./ui/notify.nix
    ./ui/number-toggle.nix
    ./ui/telescope.nix
    ./ui/todo-comment.nix
    ./ui/which-key.nix
    ./ui/yazi.nix
    ./ux/auto-session.nix
    ./ux/better-escape.nix
    ./ux/flash.nix
    ./ux/hlsearch.nix
    ./ux/indent-tools.nix
    ./integrations/lazygit.nix
    ./featureToggles.nix
  ];
  # TODO: plugin for automatically replacing [] {} with whatever I replace it with
  # TODO: maybe make this a chain of with ./color, etc?
  # TODO: when I open a new file and it doesn't have anything inside of it "new" then default template should spawn
  # TODO: flash shouldn't be in sidebar
  # TODO: fast nix builds https://github.com/Mic92/nix-fast-build. Requires gcc15
  # TODO: log highlighting, info, error, etc
  # TODO: filter logs lines plugin? like reduce file to only lines matching a regex
  # TODO: incline icon is washed out. Not recognizing dark mode? lualine's icons work
  # TODO: save blinkcmp frecency data in auto-session
  # TODO: dropbar on the same line as incline.nvim

  # jupyter
  # debugger

  plugins = {
    web-devicons.enable = true;
    rainbow-delimiters.enable = true;
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
    dropbar.enable = true;
  };
}

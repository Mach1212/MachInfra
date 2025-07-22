{
  pkgs,
  inputs,
  ...
}: {
  imports = [
    ./code_formatting.nix
    ./diag_linting.nix
    ./diag_lsp.nix
    ./keymaps.nix
    ./lang_jsts.nix
    ./lang_nix.nix
    ./lang_py.nix
    ./lang_rs.nix
    ./navigation.nix
    ./tool_fuzzysearch.nix
    ./tool_git.nix
    ./tool_refactoring.nix
    ./ui_autocomplete.nix
    ./ui_colorscheme.nix
    ./ui_command.nix
    ./ui_diag.nix
    ./ui_docs.nix
    ./ui_folding.nix
    ./ui_formatting.nix
    ./ui_gutter.nix
    ./ui_indentation.nix
    ./ui_notifications.nix
    ./ui_tabs.nix
    ./ui_sidebar.nix
    ./ui_ux.nix
    ./ux_session.nix
  ];

  # decrease repeat-delay time
  # Lazygit include config w/ work profile
  # close all buffers to my right or left / all
  # Grok integration
  # WCA integration
  # Multicursor
  # No astrotheme, just my own quick colorscheme
  # UI glitch, if in a nix file go to root {} and see red initial color replaced with wack white
  # add plugin which adds file templates for new files

  plugins = {
    treesitter.enable = true; # Allows vim to understand programming languages structure
    web-devicons.enable = true; # Adds one character wide icons for plugins to use
    noice.enable = true; # overhauls aspects of ui
    better-escape.enable = true; # enables escape on jk and JK
    which-key.enable = true; # Keymap help bar
    flash.enable = true; # Navigate anywhere on the screen via search
    lsp.enable = true; # Language servers for diagnostics
    blink-cmp.enable = true; # How the user interacts with the lsps
    telescope.enable = true; # Navigate and search files
    lazygit.enable = true; # git tui
    barbar.enable = true; # Ui tabs
    notify.enable = true; # Notifications
    nvim-ufo.enable = true; # Code folding
    neoscroll.enable = true; # Enable mouse scrolling
    gitsigns.enable = true; # Gutter git lines and git keybinds like blame
    gitlinker.enable = true; # Keybinds for quickly linking to lines of code in a commit
    auto-session.enable = true; # Save current open tabs and reopen
    indent-blankline = {
      enable = true; # Nice indentation highlighting
      # settings.scope.enable = false; # Disable rainbow indents
    };
    neo-tree.enable = true; # File explorer sidebar
    rainbow-delimiters.enable = true; # rainbow () {} pairs corresponding to indentation
    conform-nvim.enable = true; # Code formatter
    nvim-autopairs.enable = true; # Pairs quotes, parens and curly's
    todo-comments.enable = true; # Highlights TODO: in the code base
    ts-comments.enable = true; # Enables commenting via <leader-/>
    render-markdown = {
      enable = true;
      # settings = {
      #   render_modes = helpers.listToUnkeyedAttrs ["n" "v" "c" "t" "i"];
      # };
    };
    lualine.enable = true;
    nerdy.enable = true;
  };

  extraPlugins = with pkgs; [
    ( # Colorscheme
      vimUtils.buildVimPlugin {
        pname = "astrotheme";
        version = "latest";
        src = inputs.astrotheme;
        meta.homepage = "https://github.com/AstroNvim/astrotheme";
      }
    )
    ( # Extra highlighting for color
      vimUtils.buildVimPlugin
      {
        pname = "hlargs";
        version = "latest";
        src = fetchFromGitHub {
          owner = "m-demare";
          repo = "hlargs.nvim";
          rev = "a5a7fdacc0ac2f7ca9d241e0e059cb85f0e733bc";
          hash = "sha256-HIQrwlOP/iQoNpH7ETusb7PMaGKrkOrhHlNdQ+fYeCk=";
        };
        meta.homepage = "https://github.com/m-demare/hlargs.nvim";
      }
    )
    (vimUtils.buildVimPlugin
      {
        pname = "hlsearch";
        version = "latest";
        src = fetchFromGitHub {
          owner = "nvimdev";
          repo = "hlsearch.nvim";
          rev = "fdeb60b890d15d9194e8600042e5232ef8c29b0e";
          hash = "sha256-ibizMO16T/SwZIcl+zckbpDHMYQovKPEB5iO2YBRj74=";
        };
        meta.homepage = "https://github.com/nvimdev/hlsearch.nvim.git";
      })
  ];
  plugins.telescope.extensions = {
    fzf-native.enable = true;
    fzy-native.enable = true;
  };
  plugins.treesitter = {
    nixvimInjections = false; #
    settings = {
      incremental_selection.enable = true; #
      parser_install_dir = {
        __raw = "vim.fs.joinpath(vim.fn.stdpath('data'), 'treesitter')"; #
      };
    };
  };
  plugins.noice.settings = {
    lsp.override = {
      "vim.lsp.util.convert_input_to_markdown_lines" = true; #
      "vim.lsp.util.stylize_markdown" = true; #
    };
  };
  plugins.blink-cmp = {
    settings = {
      appearance = {
        nerd_font_variant = "normal"; #
      };
      #
      signature = {
        enabled = false;
        # window = {
        #   border = "none";
        # };
      };
      sources = {
        cmdline = [];
        providers = {
          buffer = {
            score_offset = -7;
          };
          lsp = {
            fallbacks = [];
          };
        };
      };
    };
  };
  plugins.nvim-ufo = {
    settings = {
      enable_get_fold_virt_text = true;
      provider_selector =
        # lua
        ''
          function(bufnr, filetype, buftype)
            local ftMap = {
              vim = "indent",
              python = {"indent"},
              git = ""
            }

           return ftMap[filetype]
          end
        '';
    };
  };
  plugins.gitsigns = {
    settings = {};
  };
}

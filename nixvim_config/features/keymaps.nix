{helpers, ...}: {
  keymaps =
    # FUZZYSEARCH
    let
      findFilesAvoid = ",-g,!**/node_modules/*,-g,!**/*lock*,-g,!**/.git/*,-g,!**/venv/*";
      findStringAvoid = '',"-g","!**/node_modules/*","-g","!**/*lock*","-g","!**/.git/*","-g","!**/venv/*"'';
    in
      [
        {
          key = "<leader>ff";
          action = "<CMD>Telescope find_files find_command=rg,--files,--hidden${findFilesAvoid}<CR>";
          options.desc = "Find Files";
        }
        {
          key = "<leader>fF";
          action = "<CMD>Telescope find_files find_command=rg,--files,--hidden,--no-ignore${findFilesAvoid}<CR>";
          options.desc = "Find Files Ignored";
        }
        {
          key = "<leader>f<A-f>";
          action = "<CMD>Telescope find_files find_command=rg,--files,-uu<CR>";
          options.desc = "Find Files All";
        }
        {
          key = "<leader>fw";
          action = ''<CMD>lua require("telescope.builtin").live_grep({ additional_args = function() return { "--hidden"${findStringAvoid} } end })<CR>'';
          options.desc = "Find String";
        }
        {
          key = "<leader>fW";
          action = ''<CMD>lua require("telescope.builtin").live_grep({ additional_args = function() return { "--hidden","--no-ignore"${findStringAvoid} } end })<CR>'';
          options.desc = "Find String Ignored";
        }
        {
          key = "<leader>f<A-w>";
          action = ''<CMD>lua require("telescope.builtin").live_grep({ additional_args = function() return { "-uu" } end })<CR>'';
          options.desc = "Find String All";
        }
        {
          key = "<leader>fn";
          action = "<CMD>Telescope notify<CR>";
          options.desc = "Find Notifications";
        }
        {
          key = "<leader>fb";
          action = "<CMD>Telescope live_grep grep_open_files=true<CR>";
          options.desc = "Find Notifications";
        }
      ]
      # LSP
      ++ [
        {
          key = "k";
          action = "gk";
        }
        # {
        #   key = "[d";
        #   options.desc = "Previous diagnostic";
        #   action.__raw = ''
        #     function()
        #       vim.diagnostic.goto_prev()
        #     end
        #   '';
        # }
        # {
        #   key = "]d";
        #   options.desc = "Next diagnostic";
        #   action.__raw = ''
        #     function()
        #       vim.diagnostic.goto_next()
        #     end
        #   '';
        # }
        {
          key = "<leader>ln";
          options.desc = "Lsp Diagnostics";
          action = "<CMD>Telescope diagnostics<CR>";
        }
        {
          key = "<leader>li";
          options.desc = "Lsp Info";
          action = "<CMD>LspInfo<CR>";
        }
        {
          key = "<leader>lI";
          options.desc = "Lsp Log";
          action = "<CMD>LspLog<CR>";
        }
        {
          key = "<leader>lN";
          options.desc = "Lsp Notif";
          action = "<CMD>LspInfo<CR>";
        }
        # {
        #   key = "<leader>la";
        #   options.desc = "Lsp Action";
        #   action = "<CMD>lua vim.lsp.buf.code_action()<CR>";
        # }
        # {
        #   key = "<leader>lr";
        #   options.desc = "Lsp Rename";
        #   action = "<CMD>lua vim.lsp.buf.rename()<CR>";
        # }
        # {
        #   key = "<leader>lR";
        #   options.desc = "Lsp References";
        #   action = "<CMD>lua vim.lsp.buf.references()<CR>";
        # }
        {
          key = "<leader>ld";
          options.desc = "Lsp Definition";
          action = "<CMD>lua vim.lsp.buf.definition()<CR>";
        }
        {
          key = "<leader>lD";
          options.desc = "Lsp Declaration";
          action = "<CMD>lua vim.lsp.buf.declaration()<CR>";
        }
        {
          key = "<leader>ud";
          options.desc = "Toggle lsp diagnostics";
          action = "<CMD>ToggleDiagnostics<CR>";
        }
      ]
      # NAVIGATION
      ++ [
        {
          key = "s";
          mode = ["n" "x" "o"];
          action = "<CMD>lua require('flash').jump()<CR>";
          options.desc = "Flash Jump";
        }
        {
          key = "S";
          mode = ["n" "x" "o"];
          action = "<CMD>lua require('flash').treesitter()<CR>";
          options.desc = "Flash Treesitter";
        }
      ]
      # NOTIFICATIONS
      ++ [
        {
          key = "<leader>uN";
          action = "<CMD>lua require('notify').dismiss({pending=true,silent=true})<CR>";
          options.desc = "Notif Clear";
        }
      ]
      #	GIT
      ++ [
        {
          key = "<leader>gg";
          action = "<CMD>LazyGit<CR>";
          options.desc = "Open LazyGit";
        }
        {
          key = "<leader>gb";
          options.desc = "Git Blame Line";
          action = ''<CMD>Gitsigns blame_line<CR>'';
        }
        {
          key = "<leader>ga";
          options.desc = "Git Stage/Unstage Hunk";
          action = ''<CMD>Gitsigns stage_hunk<CR>'';
        }
        {
          key = "<leader>gr";
          options.desc = "Git Reset Hunk";
          action = ''<CMD>Gitsigns reset_hunk<CR>'';
        }
        {
          key = "<leader>gR";
          options.desc = "Git Reset Buffer";
          action = ''<CMD>Gitsigns reset_buffer<CR>'';
        }
        {
          key = "]g";
          options.desc = "Git Next Hunk";
          action = ''<CMD>Gitsigns nav_hunk next<CR>'';
        }
        {
          key = "[g";
          options.desc = "Git Prev Hunk";
          action = ''<CMD>Gitsigns nav_hunk prev<CR>'';
        }
        {
          key = "<leader>ug";
          options.desc = "Toggle Git Diff";
          action = "<CMD>call ToggleGitDiff()<CR>";
        }
        {
          mode = "v";
          key = "ag";
          options.desc = "Select Git Hunk";
          action = ''<CMD>Gitsigns select_hunk<CR>'';
        }
        {
          key = "<leader>gy";
          action = "<CMD>lua require('gitlinker').get_buf_range_url('n')<CR>";
          options.desc = "Git Link Copy";
        }
        {
          key = "<leader>gY";
          action = "<CMD>lua require('gitlinker').get_buf_range_url('n', {action_callback = require('gitlinker.actions').open_in_browser})<CR>";
          options.desc = "Git Link Goto";
        }
        {
          key = "<leader>g<A-y>";
          action = "<CMD>lua require('gitlinker').get_repo_url({action_callback = require('gitlinker.actions').open_in_browser})<CR>";
          options.desc = "Git Homepage Goto";
        }
        # FOLD
        {
          key = "za";
          mode = "n";
          options = {
            desc = "Unfold Buffer";
          };
          action = "<CMD>lua require('ufo').openAllFolds()<CR>";
        }
        {
          key = "zA";
          mode = "n";
          options = {
            desc = "Fold Buffer";
          };
          action = "<CMD>lua require('ufo').closeAllFolds()<CR>";
        }
      ]
      # FOLDING
      ++ [
        {
          key = "<";
          mode = "n";
          options = {
            desc = "Toggle Fold";
            remap = true;
          };
          action = "za";
        }
      ]
      # SIDEBAR
      ++ [
        {
          key = "<leader>e";
          action = "<CMD>Neotree toggle<CR>";
          options.desc = "Neotree Toggle";
        }
      ]
      # TABS
      ++ [
        {
          key = "<A-h>";
          action = "<Cmd>BufferPrevious<CR>";
          options.desc = "Buffer Left";
        }
        {
          key = "<A-l>";
          action = "<Cmd>BufferNext<CR>";
          options.desc = "Buffer Right";
        }
        {
          key = "<C-h>";
          action = "<Cmd>bn<CR>";
          options.desc = "Buffer Next";
        }
        {
          key = "<C-l>";
          action = "<Cmd>bp<CR>";
          options.desc = "Buffer Prev";
        }
        {
          key = "<A-,>";
          action = "<Cmd>BufferMovePrevious<CR>";
          options.desc = "Buffer Move Right";
        }
        {
          key = "<A-.>";
          action = "<Cmd>BufferMoveNext<CR>";
          options.desc = "Buffer Move Left";
        }
        {
          key = "<leader>n";
          action = "<Cmd>tabnew<CR>";
          options.desc = "Buffer Create";
        }
        {
          key = "<leader>c";
          action = "<Cmd>BufferClose<CR>";
          options.desc = "Buffer Close";
        }
        {
          key = "<leader>C";
          action = "<Cmd>BufferClose!<CR>";
          options.desc = "Buffer Close Forced";
        }
      ]
      # CODE_FORMATTING
      ++ [
        {
          key = "<leader>uf";
          action = "<CMD>FormatToggle!<CR>";
          options.desc = "Toggle Buffer Formatting";
        }
        {
          key = "<leader>uF";
          action = "<CMD>FormatToggle<CR>";
          options.desc = "Toggle Global Formatting";
        }
        {
          key = "<leader>u<A-f>";
          action = "<CMD>FormatGitHunksToggleBuffer<CR>";
          options.desc = "Toggle Buffer Git Hunk Formatting";
        }
        {
          key = "<leader>u<A-S-f>";
          action = "<CMD>FormatGitHunksToggle<CR>";
          options.desc = "Toggle Git Hunk Formatting";
        }
      ]
      # COMMENTS
      ++ [
        {
          key = "<leader>/";
          action = "gcc";
          options = {remap = true;};
        }
        {
          key = "<leader>?";
          action = "gbc";
          options = {remap = true;};
        }
        {
          key = "<leader>/";
          action = "gcc";
          options = {remap = true;};
          mode = "v";
        }
        {
          key = "<leader>?";
          action = "gbc";
          options = {remap = true;};
          mode = "v";
        }
      ];

  plugins.telescope = {
    settings.defaults = {
      mappings = {
        n = {
          q = "close";
          "h" = "results_scrolling_left"; # scroll left
          "l" = "results_scrolling_right"; # scroll right
          "j" = "move_selection_next"; # scroll down
          "k" = "move_selection_previous"; # scroll up
          "<c-h>" = "preview_scrolling_left"; # scroll left
          "<c-l>" = "preview_scrolling_right"; # scroll right
          "<c-j>" = "preview_scrolling_down"; # scroll down
          "<c-k>" = "preview_scrolling_up"; # scroll up
        };
        i = {
          # ["<pageup>"] = actions.results_scrolling_up,
          # ["<pagedown>"] = actions.results_scrolling_down,
          "<c-h>" = "preview_scrolling_left"; # scroll left
          "<c-l>" = "preview_scrolling_right"; # scroll right
          "<c-j>" = "preview_scrolling_down"; # scroll down
          "<c-k>" = "preview_scrolling_up"; # scroll up
        };
      };
    };
    keymaps = {};
  };
  plugins.barbar.keymaps = {};
  plugins.blink-cmp.settings.keymap = {
    preset = "super-tab";
    "<Tab>" = let
      select_next_and_move_snippet = helpers.mkRaw ''
        function(cmp)
          if not cmp.snippet_active() then return cmp.select_next() end
        end
      '';
    in [
      select_next_and_move_snippet
      "snippet_forward"
      "fallback"
    ];
    "<S-Tab>" = ["select_prev"];
    "<CR>" = let
      select_and_accept = helpers.mkRaw ''
        function(cmp)
          return cmp.accept()
        end
      '';
    in [
      select_and_accept
      "fallback"
    ];
  };
  plugins.better-escape.settings.mappings = {
    t = {j = helpers.listToUnkeyedAttrs [false];};
    v = {j = helpers.listToUnkeyedAttrs [false];};
  };
  plugins.mini.modules.surround.mappings = {
    add = "Ss"; # Add surrounding in Normal and Visual modes
    delete = "dD"; # Delete surrounding
    find = "Sl"; # Find surrounding (to the right)
    find_left = "SL"; # Find surrounding (to the left)
    highlight = ""; # Highlight surrounding
    replace = "Sr"; # Replace surrounding
    update_n_lines = "Sn"; # Update `n_lines`

    suffix_last = "N"; # Suffix to search with "prev" method
    suffix_next = "n"; # Suffix to search with "next" method
  };
}

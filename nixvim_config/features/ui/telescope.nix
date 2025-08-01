{helpers, ...}: {
  plugins.telescope = {
    enable = true;
    extensions = {
      fzf-native.enable = true;
      fzy-native.enable = true;
    };
    settings.defaults = {
      # path_display = "truncate";
      sorting_strategy = "ascending";
      layout_config = {
        horizontal = {
          prompt_position = "top";
          preview_width = 0.55;
        };
        vertical = {mirror = false;};
        width = 0.87;
        height = 0.80;
        preview_cutoff = 120;
      };
      mappings = {
        n = {
          q = "close";
          h = "results_scrolling_left"; # scroll left
          l = "results_scrolling_right"; # scroll right
          # TODO: enter doesn't open multiple things
          "<Tab>" = "move_selection_next";
          "<S-Tab>" = "move_selection_previous";
          "<Down>".__raw = ''require("telescope.actions").toggle_selection + require("telescope.actions").move_selection_next'';
          "<Up>".__raw = ''require("telescope.actions").toggle_selection + require("telescope.actions").move_selection_previous'';

          "<PageUp>" = "results_scrolling_up";
          "<PageDown>" = "results_scrolling_down";
          "<C-h>" = "preview_scrolling_left"; # scroll left
          "<C-l>" = "preview_scrolling_right"; # scroll right
          "<C-j>" = "preview_scrolling_down"; # scroll down
          "<C-k>" = "preview_scrolling_up"; # scroll up
        };
        i = {
          "<tab>" = "move_selection_next";
          "<S-tab>" = "move_selection_previous";
          "<Down>".__raw = ''require("telescope.actions").toggle_selection + require("telescope.actions").move_selection_next'';
          "<Up>".__raw = ''require("telescope.actions").toggle_selection + require("telescope.actions").move_selection_previous'';

          "<C-h>" = "preview_scrolling_left"; # scroll left
          "<C-l>" = "preview_scrolling_right"; # scroll right
          "<C-j>" = "preview_scrolling_down"; # scroll down
          "<C-k>" = "preview_scrolling_up"; # scroll up
        };
      };

      # Used for live_grep
      vimgrep_arguments = [
        "rg"
        "--color=never"
        "--no-heading"
        "--with-filename"
        "--line-number"
        "--column"
        "--smart-case"
        "--hidden"
      ];
      # Used for find_files
      pickers = {
        find_files = {
          find_command = [
            "rg"
            "--files"
            "--hidden"
          ];
        };
      };
    };
  };
  keymaps = let
    findFilesAvoid = ",-g,!**/node_modules/,-g,!**/.git/,-g,!**/venv/,-g,!**/*.lock";
    findStringAvoid = '',"-g","!**/node_modules/","-g","!**/.git/","-g","!**/venv/","-g","!**/*.lock"'';
  in [
    # TODO: add todo finding
    {
      key = "<leader>ff";
      action = "<CMD>Telescope find_files find_command=rg,--files,--hidden${findFilesAvoid}<CR>";
      options.desc = "FindFiles";
    }
    {
      key = "<leader>fF";
      action = "<CMD>Telescope find_files find_command=rg,--files,--hidden<CR>";
      options.desc = "FindFilesAll";
    }
    {
      key = "<leader>fw";
      action = ''<CMD>lua require("telescope.builtin").live_grep({ additional_args = function() return { "--hidden"${findStringAvoid} } end })<CR>'';
      options.desc = "findstring";
    }
    {
      key = "<leader>fW";
      action = ''<CMD>lua require("telescope.builtin").live_grep({ additional_args = function() return { "-uu" } end })<CR>'';
      options.desc = "FindStringAll";
    }

    {
      key = "<leader>fn";
      action = "<CMD>Telescope notify<CR>";
      options.desc = "Find Notif";
    }
    {
      key = "<leader>fb";
      action = "<CMD>Telescope live_grep grep_open_files=true<CR>";
      options.desc = "Find Buffer";
    }
  ];
  # plugins.snacks.settings.picker = {
  #   enabled = true;
  #   matcher = {
  #     frecency = true;
  #   };
  #   auto_close = true;
  # };
  # keymaps = [
  #   # TODO: add todo finding
  #   {
  #     key = "<leader>ff";
  #     action = "<CMD>lua Snacks.picker.files({hidden=true})<CR>";
  #     options.desc = "FindFiles";
  #   }
  #   {
  #     key = "<leader>fF";
  #     action = "<CMD>lua Snacks.picker.files({exclude={}})<CR>";
  #     options.desc = "FindFilesAll";
  #   }
  #   # {
  #   #   key = "<leader>fw";
  #   #   action = ''<cmd>lua require("telescope.builtin").live_grep({ additional_args = function() return { "--hidden"${findStringAvoid} } end })<cr>'';
  #   #   options.desc = "findstring";
  #   # }
  #   # {
  #   #   key = "<leader>fW";
  #   #   action = ''<CMD>lua require("telescope.builtin").live_grep({ additional_args = function() return { "-uu" } end })<CR>'';
  #   #   options.desc = "FindStringAll";
  #   # }
  #   #
  #   # {
  #   #   key = "<leader>fn";
  #   #   action = "<CMD>Telescope notify<CR>";
  #   #   options.desc = "Find Notif";
  #   # }
  #   # {
  #   #   key = "<leader>fb";
  #   #   action = "<CMD>Telescope live_grep grep_open_files=true<CR>";
  #   #   options.desc = "Find Buffer";
  #   # }
  # ];
}

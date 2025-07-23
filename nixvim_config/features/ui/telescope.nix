{
  plugins.telescope = {
    enable = true;
    settings.defaults = {
      # file_ignore_patterns = ["^%.git[/\\]" "[/\\]%.git[/\\]" "^%*.lock" "[/\\]*.lock*"];
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
          "<Tab>" = "move_selection_next";
          "<S-Tab>" = "move_selection_previous";
          "<Down>".__raw = ''require("telescope.actions").toggle_selection + require("telescope.actions").move_selection_next'';
          "<Up>".__raw = ''require("telescope.actions").toggle_selection + require("telescope.actions").move_selection_previous'';

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

          # ["<PageUp>"] = actions.results_scrolling_up,
          # ["<PageDown>"] = actions.results_scrolling_down,
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
            "fd"
            "--type"
            "f"
            "--hidden"
            "--strip-cwd-prefix"
            # "--exclude"
            # ".git"
          ];
        };
      };
    };
  };

  # extraConfigLua =
  #   # lua
  #   ''
  #     require("telescope").setup({
  #     	defaults = {
  #     		mappings = {
  #     			n = {
  #     				["<Down>"] = require("telescope.actions").toggle_selection
  #     					+ require("telescope.actions").move_selection_next,
  #     				["<Up>"] = require("telescope.actions").toggle_selection
  #     					+ require("telescope.actions").move_selection_previous,
  #     			},
  #     			i = {
  #     				["<Down>"] = require("telescope.actions").toggle_selection
  #     					+ require("telescope.actions").move_selection_next,
  #     				["<Up>"] = require("telescope.actions").toggle_selection
  #     					+ require("telescope.actions").move_selection_previous,
  #     			},
  #     		},
  #     	},
  #     })
  #   '';

  keymaps = [
    # TODO: add todo finding
    {
      key = "<leader>ff";
      action = "<CMD>Telescope find_files<CR>";
      options.desc = "Find Files";
    }
    # {
    #   key = "<leader>fF";
    #   action = "<CMD>Telescope find_files find_command=rg,--files,--hidden,--no-ignore${findFilesAvoid}<CR>";
    #   options.desc = "Find Files Ignored";
    # }
    # {
    #   key = "<leader>f<A-f>";
    #   action = "<CMD>Telescope find_files find_command=rg,--files,-uu<CR>";
    #   options.desc = "Find Files All";
    # }
    {
      key = "<leader>fw";
      action = ''<CMD>lua require("telescope.builtin").live_grep()<CR>'';
      options.desc = "Find String";
    }
    # {
    #   key = "<leader>fW";
    #   action = ''<CMD>lua require("telescope.builtin").live_grep({ additional_args = function() return { "--hidden","--no-ignore"${findStringAvoid} } end })<CR>'';
    #   options.desc = "Find String Ignored";
    # }
    # {
    #   key = "<leader>f<A-w>";
    #   action = ''<CMD>lua require("telescope.builtin").live_grep({ additional_args = function() return { "-uu" } end })<CR>'';
    #   options.desc = "Find String All";
    # }
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
}

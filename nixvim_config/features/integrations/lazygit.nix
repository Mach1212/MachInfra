{
  plugins.remote-nvim.enable = true;
  plugins.lazygit.enable = true;
  keymaps = [
    {
      key = "<leader>gg";
      action = ''<CMD>lua lazygit_toggle()<CR>'';
      options.desc = "Open LazyGit";
    }
  ];
  # TODO: Make these term settings defaults for all terms. Don't want to set explicitly
  # TODO: Fix this vim.g crazyness using .__raw
  extraConfigLua =
    # lua
    ''
      vim.g.lazygit_use_custom_config_file_path = 1
      vim.g.lazygit_config_file_path = vim.fn.stdpath("config") .. "/lazygit/config.yml"

      local Terminal = require("toggleterm.terminal").Terminal
      local lazygit = Terminal:new({
      	cmd = "lazygit",
      	dir = "git_dir",
      	direction = "float",
      	float_opts = {
      		border = "none",
      	},
      	hidden = true,
      	on_open = function(term)
      		vim.cmd("startinsert!")
      		vim.api.nvim_buf_set_keymap(term.bufnr, "n", "q", "<cmd>close<CR>", { noremap = true, silent = true })
      	end,
      	on_close = function(term)
      		vim.cmd("startinsert!")
      	end,
      })

      function lazygit_toggle()
      	lazygit:toggle()
      end
    '';

  # TODO: Make sure this works
  extraFiles = {
    "lazygit/config.yml".text =
      # yaml
      ''
        services:
          'github.ibm.com': 'github:github.ibm.com'
        gui:
          nerdFontsVersion: "3"
          mouseEvents: false
        git:
          overrideGpg: true
        os:
          editPreset: nvim-remote
      '';
  };
}

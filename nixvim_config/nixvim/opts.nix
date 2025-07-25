{
  pkgs,
  inputs,
  ...
}: {
  luaLoader.enable = true;

  viAlias = true;
  vimAlias = true;

  opts = {
    termguicolors = true;
    ignorecase = true;
    smartcase = true;
    undofile = true;
    mouse = "a";
    mousemodel = "extend";
    grepprg = "rg --vimgrep";
  };

  # extraConfigLua = ''
  #   vim.opt.mouse = ""
  # '';

  clipboard.register = "unnamedplus"; #

  extraConfigLua =
    #lua
    ''
      local function my_paste(_)
      	return function(_)
      		local content = vim.fn.getreg('"')
      		return vim.split(content, "\n")
      	end
      end
      if os.getenv("SSH_TTY") then
      	vim.g.clipboard = {
      		name = "OSC 52",
      		copy = {
      			["+"] = require("vim.ui.clipboard.osc52").copy("+"),
      			["*"] = require("vim.ui.clipboard.osc52").copy("*"),
      		},
      		paste = {
      			-- ["+"] = my_paste("+"),
      			-- ["*"] = my_paste("*"),
      			["+"] = require("vim.ui.clipboard.osc52").paste("+"),
      			["*"] = require("vim.ui.clipboard.osc52").paste("*"),
      		},
      	}
      else
      	-- Local: Use default or win32yank (Neovim auto-detects if installed)
      	vim.opt.clipboard = "unnamedplus" -- Sync with system clipboard
      end
    '';
}

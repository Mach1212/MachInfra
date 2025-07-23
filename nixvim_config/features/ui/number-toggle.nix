{
  keymaps = [
    {
      key = "<leader>un";
      action = "<CMD>ToggleLineNumbers<CR>";
      options.desc = "Line Numbers Toggle";
    }
  ];
  extraConfigLua =
    #lua
    ''
      vim.g.mach12toggleLineNumbers = 0
      vim.api.nvim_create_user_command("ToggleLineNumbers", function(args)
      	if vim.g.mach12toggleLineNumbers == 0 then
      		vim.opt.number = false
      		vim.opt.relativenumber = false
      		vim.g.mach12toggleLineNumbers = 1
      	elseif vim.g.mach12toggleLineNumbers == 1 then
      		vim.opt.number = true
      		vim.g.mach12toggleLineNumbers = 2
      	elseif vim.g.mach12toggleLineNumbers == 2 then
      		vim.opt.relativenumber = true
      		vim.g.mach12toggleLineNumbers = 0
      	end
      end, {
      	desc = "Toggle line numbers",
      })
    '';
}

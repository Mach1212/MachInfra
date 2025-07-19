{
  opts = {
    number = true;
    relativenumber = true;
    fillchars = "eob: ,fold: ,foldopen:,foldsep: ,foldclose:";
    foldcolumn = "0";
  };
  extraConfigLua =
    #lua
    ''
      local mach12toggleLineNumbers = 0
      vim.api.nvim_create_user_command("ToggleLineNumbers", function(args)
      	if mach12toggleLineNumbers == 0 then
      		vim.opt.number = false
      		vim.opt.relativenumber = false
      		mach12toggleLineNumbers = 1
      	elseif mach12toggleLineNumbers == 1 then
      		vim.opt.number = true
      		mach12toggleLineNumbers = 2
      	elseif mach12toggleLineNumbers == 2 then
      		vim.opt.relativenumber = true
      		mach12toggleLineNumbers = 0
      	end
      end, {
      	desc = "Toggle line numbers",
      })
    '';
}

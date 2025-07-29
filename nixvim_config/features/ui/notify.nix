{
  plugins.notify = {
    enable = true;
    settings = {
      render = "compact";
    };
  };
  keymaps = [
    {
      key = "<leader>un";
      action = "<CMD>lua require('notify').dismiss({pending=true,silent=true})<CR>";
      options.desc = "Notif Clear";
    }
    {
      key = "<leader>uN";
      action = "<CMD>ToggleNotif<CR>";
      options.desc = "Notif Toggle";
    }
  ];
  extraConfigLua =
    # lua
    ''
      local original_notify = vim.notify

      if vim.g.mach12showNotif == nil then
      	vim.g.mach12showNotif = true
      end

      vim.notify = function(msg, level, opts)
      	if mach12showNotif == false then
      		return
      	end
      	original_notify(msg, level, opts)
      end

      -- TODO: fix this
      vim.api.nvim_create_user_command("ToggleNotif", function()
      	vim.g.mach12showNotif = not vim.g.mach12showNotif
      	vim.notify("NotifShow: " .. tostring(vim.g.mach12showNotif))
      end, {
      	desc = "Notif Toggle",
      })
    '';
}

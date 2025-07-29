{
  plugins.yazi = {
    enable = true;
    settings = {
      enable_mouse_support = true;
      open_for_directories = true;
      open_multiple_tabs = true;
      floating_window_scaling_factor = 1.0;
      yazi_floating_window_border = "none";
      use_ya_for_events_reading = true;
    };
  };
  keymaps = [
    {
      key = "<leader>E";
      action = "<Cmd>Yazi<CR>";
      options.desc = "Open Yazi";
    }
  ];
  # TODO: figure out why nixd can't read values from online?
  extraConfigLua = ''
    vim.g.loaded_netrw = 1
    vim.g.loaded_netrwPlugin = 1
  '';
}

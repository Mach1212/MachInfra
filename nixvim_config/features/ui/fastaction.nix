{
  plugins.fastaction = {
    enable = true;
    settings = {
      popup.title.__raw = "false";
    };
  };
  keymaps = [
    {
      key = "<leader>la";
      action = ''<CMD>lua require("fastaction").code_action()<CR>'';
      options.desc = "LspCodeAction";
    }
  ];
}

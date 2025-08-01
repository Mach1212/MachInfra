{
  plugins.snacks.settings.lazygit = {
    config = {
      git = {
        overrideGpg = true;
        paging.externalDiffCommand = "difft --color=always --display=inline --syntax-highlight=off";
      };
      services = {
        "github.ibm.com" = "github:github.ibm.com";
      };
    };
  };
  keymaps = [
    {
      key = "<leader>gg";
      action = ''<CMD>lua Snacks.lazygit()<CR>'';
      options.desc = "LazygitToggle";
    }
  ];
}

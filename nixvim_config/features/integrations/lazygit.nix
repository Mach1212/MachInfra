{
  plugins.snacks.settings.lazygit = {
    config = {
      git = {
        overrideGpg = true;
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

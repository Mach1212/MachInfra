{
  plugins.snacks.settings = {
    lazygit = {
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
    styles.lazygit.bo.filetype = "lazygit";
  };
  keymaps = [
    {
      key = "<leader>gg";
      action = ''<CMD>lua Snacks.lazygit()<CR>'';
      options.desc = "LazygitToggle";
    }
  ];
  files = {
    "ftplugin/lazygit.lua" = {
      keymaps = [
        {
          key = "q";
          action = "<CMD>close<CR>";
          mode = "t";
          options = {
            desc = "Vim Quit";
            buffer = true;
          };
        }
      ];
    };
  };
}

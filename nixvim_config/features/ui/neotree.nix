{helpers, ...}: {
  plugins.neo-tree = {
    enable = true;
    enableGitStatus = true;
    closeIfLastWindow = true;
    extraOptions = {
      window.width = 32;
    };
    gitStatusAsync = false;
    buffers.followCurrentFile.enabled = true;
    filesystem = {
      hijackNetrwBehavior = "disabled";
      followCurrentFile.enabled = true;
      useLibuvFileWatcher = true;
    };
  };
  keymaps = [
    {
      key = "<leader>e";
      action = "<CMD>Neotree toggle<CR>";
      options.desc = "NeotreeToggle";
    }
  ];
  # plugins.snacks.settings.explorer = {
  #   explorer = {
  #     replace_netrw = false;
  #   };
  # };
  # plugins.snacks.settings.picker.sources.explorer.layout = {
  #   layout.width = 32;
  #   auto_hide = helpers.listToUnkeyedAttrs ["input"];
  # };
  # keymaps = [
  #   {
  #     key = "<leader>e";
  #     action = "<CMD>lua Snacks.explorer()<CR>";
  #     options.desc = "NeotreeToggle";
  #   }
  # ];
}

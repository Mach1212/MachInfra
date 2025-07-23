{
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
      options.desc = "Neotree Toggle";
    }
  ];
}

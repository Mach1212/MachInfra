{
  plugins.flash = {
    enable = true;
  };
  keymaps = [
    {
      key = "s";
      mode = ["n" "x" "o"];
      action = "<CMD>lua require('flash').jump()<CR>";
      options.desc = "Flash Jump";
    }
    {
      key = "S";
      mode = ["n" "x" "o"];
      action = "<CMD>lua require('flash').treesitter()<CR>";
      options.desc = "Flash Treesitter";
    }
  ];
}

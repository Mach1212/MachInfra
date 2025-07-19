{helpers, ...}: {
  plugins.mini.modules.surround = {
    n_lines = 100;
  };
  extraConfigLua =
    #lua
    ''
      -- SCROLL
      require("neoscroll").setup({
      	duration_multiplier = 0.3,
      })
    '';
}

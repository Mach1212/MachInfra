{
  plugins.mini.modules.surround = {
    n_lines = 100;
  };
  # plugins.indent-blankline.settings.scope.enabled = false; # Disable indent markers
  extraConfigLua =
    #lua
    ''
      -- SCROLL
      require("neoscroll").setup({
      	duration_multiplier = 0.3,
      })
    '';
}

{pkgs, ...}: {
  plugins.treesitter.settings.highlight = {
    additional_vim_regex_highlighting = true;
    custom_captures = {};
    enable = true;
    disable = [];
  };
  extraConfigLua =
    #lua
    ''
      -- MAIN THEME
      require("astrotheme").setup()
      local colorscheme = "astrotheme"
      local ok, _ = pcall(vim.cmd, "colorscheme " .. colorscheme)
      -- vim.o.background = "dark" -- or "light" for light mode
      if not ok then
      	vim.notify("Colorscheme " .. colorscheme .. " not found!")
      	return
      end
      -- EXTRA CODE HIGHLIGHTING
      require("hlargs").setup()
      -- SEARCH
      require("hlsearch").setup()
    '';

  highlightOverride = {
    Folded = {
      # Stop folded code having annoying backlight
      ctermbg = "";
    };
  };
  plugins.indent-blankline.settings = {
    indent = {
      highlight = [
        "RainbowRed"
        "RainbowYellow"
        "RainbowBlue"
        "RainbowOrange"
        "RainbowGreen"
        "RainbowViolet"
        "RainbowCyan"
      ];
    };
    scope = {
      highlight = [
        "RainbowRedBold"
        "RainbowYellowBold"
        "RainbowBlueBold"
        "RainbowOrangeBold"
        "RainbowGreenBold"
        "RainbowVioletBold"
        "RainbowCyanBold"
      ];
    };
  };
  highlight = {
    RainbowRed = {fg = "#652E32";};
    RainbowYellow = {fg = "#6C572F";};
    RainbowBlue = {fg = "#254D6D";};
    RainbowOrange = {fg = "#5C452F";};
    RainbowGreen = {fg = "#435535";};
    RainbowViolet = {fg = "#593166";};
    RainbowCyan = {fg = "#2D4A4E";};

    RainbowRedBold = {fg = "#E06C75";};
    RainbowYellowBold = {fg = "#E5C07B";};
    RainbowBlueBold = {fg = "#61AFEF";};
    RainbowOrangeBold = {fg = "#D19A66";};
    RainbowGreenBold = {fg = "#98C379";};
    RainbowVioletBold = {fg = "#C678DD";};
    RainbowCyanBold = {fg = "#56B6C2";};
  };
}

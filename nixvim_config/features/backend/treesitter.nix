{
  plugins.treesitter = {
    enable = true;
    # folding = true;
    nixvimInjections = false;
    settings = {
      indent.enable = true;
      highlight.enable = true;
    };
    # TODO: figure out incremental selection keybinds
  };
  plugins.treesitter-textobjects = {
    enable = true;
    # TODO: figure out lsp_interop and keybinds
  };
  plugins.treesitter-refactor = {
    highlightDefinitions.enable = true;
    highlightCurrentScope.enable = true;
    smartRename = {
      enable = true;
      keymaps.smartRename = "lr";
    };
  };
}

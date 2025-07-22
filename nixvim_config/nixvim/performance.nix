{
  # See
  performance = {
    byteCompileLua = {
      enable = true;
      configs = true;
      initLua = true;
      nvimRuntime = true;
      plugins = true;
    };
    combinePlugins = {
      enable = true;
      standalonePlugins = ["conform.nvim" "hlargs"];
    };
  };
  plugins.lz-n.enable = true;
}

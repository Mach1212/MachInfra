{pkgs, ...}: {
  performance = {
    byteCompileLua = {
      enable = true;
      luaLib = true;
      nvimRuntime = true;
      plugins = true;
    };
    # TODO: figure out how to find pathsToLink and ensure everything is there
    combinePlugins = {
      enable = true;
      standalonePlugins = ["conform.nvim"];
    };
  };
  luaLoader.enable = true;
  # TODO: request lzn-auto-require be added
}

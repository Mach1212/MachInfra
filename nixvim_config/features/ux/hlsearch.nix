{pkgs, ...}: {
  extraPlugins = with pkgs; [
    (vimUtils.buildVimPlugin
      {
        pname = "hlsearch";
        version = "latest";
        src = fetchFromGitHub {
          owner = "nvimdev";
          repo = "hlsearch.nvim";
          rev = "fdeb60b890d15d9194e8600042e5232ef8c29b0e";
          hash = "sha256-ibizMO16T/SwZIcl+zckbpDHMYQovKPEB5iO2YBRj74=";
        };
        meta.homepage = "https://github.com/nvimdev/hlsearch.nvim.git";
      })
  ];
  # performance.combinePlugins.standalonePlugins = ["hlargs"];
  extraConfigLua =
    #lua
    ''
      require("hlsearch").setup()
    '';
}

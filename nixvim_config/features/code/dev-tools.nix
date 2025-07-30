{pkgs, ...}: {
  extraPlugins = with pkgs; [
    (vimUtils.buildVimPlugin
      {
        pname = "devtools";
        version = "latest";
        src = fetchFromGitHub {
          owner = "YaroSpace";
          repo = "dev-tools.nvim";
          rev = "96cf12d605f4f2cee0a0b844f8df5d1e8b33db38";
          hash = "sha256-0P/eOy7FhJjEUyZ5q/wnWzv98GTWU6gLYwY+PnZjoz4=";
        };
        meta.homepage = "https://github.com/YaroSpace/dev-tools.nvim";
      })
  ];
  extraConfigLua =
    #lua
    ''
      require("dev-tools").setup()
    '';
}

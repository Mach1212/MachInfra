{pkgs, ...}: {
  extraPlugins = with pkgs; [
    (vimUtils.buildVimPlugin
      {
        pname = "colorful-menu";
        version = "latest";
        src = vimPlugins.colorful-menu-nvim;
        meta.homepage = "https://github.com/xzbdmw/colorful-menu.nvim";
        doCheck = false;
      })
  ];
  extraConfigLua =
    #lua
    ''
      require("colorful-menu").setup({})
    '';
}

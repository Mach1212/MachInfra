{pkgs, ...}: {
  # extraPlugins = [
  #   (pkgs.vimUtils.buildVimPlugin {
  #     pname = "chadtree";
  #     version = "latest";
  #     src = pkgs.fetchFromGitHub {
  #       owner = "ms-jpq";
  #       repo = "chadtree";
  #       rev = "bc34bbf898c5832fae1390c963365be5f71bb152";
  #       hash = "sha256-y1/AXM2DiYt31LRzYSEDnQamvr68hGXADwi0qIuJ78U=";
  #     };
  #     meta.homepage = "https://github.com/ms-jpq/chadtree/tree/chad";
  #   })
  # ];

  # TODO: Flash shouldn't match spaces before the first letter ^\w
  # extraPlugins = with pkgs.vimPlugins; [
  #   chadtree
  # ];
  plugins.chadtree = {
    enable = true;
  };
  # TODO: zellij pane + - I miss it
  keymaps = [
    {
      key = "<leader>e";
      action = "<CMD>CHADopen<CR>";
      options.desc = "Filebar";
    }
  ];
}

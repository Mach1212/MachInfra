{pkgs, ...}: {
  extraPlugins = with pkgs; [
    (vimUtils.buildVimPlugin
      {
        pname = "action-hints";
        version = "latest";
        src = fetchFromGitHub {
          owner = "roobert";
          repo = "action-hints.nvim";
          rev = "ab10fef255dd4bc933c92d8f9969828f2f856e71";
          hash = "sha256-BTXmb1uGbXKkORnf1hbEa8jEmpPpzjMaerdldo5tkxs=";
        };
        meta.homepage = "https://github.com/roobert/action-hints.nvim";
      })
  ];
  extraConfigLua =
    #lua
    ''
      require("action-hints").setup({
      	template = {
      		definition = { text = " ⊛", color = "#add8e6" },
      		references = { text = " ↱%s", color = "#ff6666" },
      	},
      	use_virtual_text = true,
      })
    '';
}

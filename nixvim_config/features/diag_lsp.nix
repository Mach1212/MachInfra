{
  pkgs,
  pkgs-old,
  ...
}: {
  plugins.lsp = {
    # lazyLoad.settings = {
    #   event = ["BufReadPost" "BufNewFile"];
    #   cmd = ["LspInfo" "LspInstall" "LspUninstall"];
    # };
    servers = {
      nil_ls.enable = true;
      nixd = {
        enable = true;
        package = pkgs-old.nixd;
      };
      bashls.enable = true;

      cmake.enable = true;

      # python
      # pylyzer = {
      #   package = null;
      #   enable = true;
      # };
      basedpyright.enable = true;

      lua_ls.enable = true;

      dockerls.enable = true;
      docker_compose_language_service.enable = true;

      # webdev
      html.enable = true;
      cssls.enable = true;
      tailwindcss.enable = true;
      eslint = {
        enable = true;
        package = pkgs.eslint_d;
      };

      # java
      jdtls.enable = true;

      jsonls.enable = true;
      yamlls.enable = true;
    };
    # inlayHints = true;
  };
}

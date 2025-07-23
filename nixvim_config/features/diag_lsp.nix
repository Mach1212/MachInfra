{pkgs, ...}: {
  plugins.lsp = {
    # lazyLoad.settings = {
    #   event = ["BufReadPost" "BufNewFile"];
    #   cmd = ["LspInfo" "LspInstall" "LspUninstall"];
    # };
    servers = {
      nil_ls.enable = true;
      nixd.enable = true;

      bashls.enable = true;

      cmake.enable = true;

      # python
      pylyzer = {
        enable = true;
        package = pkgs.symlinkJoin {
          name = "pylyzer-patched";
          paths = [pkgs.pylyzer];
          buildInputs = [pkgs.makeWrapper];
          postBuild = ''
            wrapProgram $out/bin/pylyzer \
            --unset CONDA_PREFIX \
            --unset CONDA_PROMPT_MODIFIER \
            --unset CONDA_SHLVL \
            --unset CONDA_DEFAULT_ENV \
            --unset CONDA_ENV_PATH \
            --unset PYTHONPATH \
            --unset PATH
          '';
        };
      };

      lua_ls.enable = true;

      dockerls.enable = true;
      docker_compose_language_service.enable = true;

      # webdev
      html.enable = true;
      cssls.enable = true;
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

{helpers, ...}: {
  plugins.colorizer = {
    enable = true;
    settings = {
      filetypes =
        helpers.listToUnkeyedAttrs [
          "*"
          "!vim"
        ]
        // {
          javascript = {
            tailwind = "lsp";
          };
          javascriptreact = {
            tailwind = "lsp";
          };
          typescript = {
            tailwind = "lsp";
          };
          typescriptreact = {
            tailwind = "lsp";
          };
          css = {
            css = true;
          };
          scss = {
            css = true;
          };
        };
      buftypes = helpers.listToUnkeyedAttrs [
        "*"
        "!prompt"
        "!popup"
      ];
      user_default_options = {
        names = false;
        mode = "virtualtext";
        virtualtext = "■";
        # TODO: Wut this do
        virtualtext_inline = true;
      };
      user_commands = [
        "ColorizerToggle"
        "ColorizerReloadAllBuffers"
      ];
    };
  };
}

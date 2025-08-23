{
  pkgs,
  inputs,
  ...
}: {
  extraPlugins = with pkgs; [
    (vimUtils.buildVimPlugin
      {
        pname = "lsp-ui";
        version = "latest";
        src = inputs.lsp-ui;
        meta.homepage = "https://github.com/jinzhongjia/LspUI.nvim";
      })
  ];
  extraConfigLua =
    #lua
    ''
      require("LspUI").setup({
      	code_action = {
      		gitsigns = false,
      	},
      })
    '';
  keymaps = [
    {
      action = "<CMD>LspUI hover<CR>";
      options.desc = "LspHover";
      key = "K";
    }
    # {
    #   action = "<CMD>LspUI declaration<CR>";
    #   options.desc = "LspDeclaration";
    #   key = "<leader>ld";
    # }
    # {
    #   action = "<CMD>LspUI definition<CR>";
    #   options.desc = "LspDeclaration";
    #   # key = "<leader>lD";
    #   key = "gD";
    # }
    # {
    #   action = "<CMD>LspUI reference<CR>";
    #   options.desc = "LspReferences";
    #   key = "<leader>lr";
    # }
    {
      action = "<CMD>LspUI rename<CR>";
      options.desc = "LspRename";
      key = "<leader>lR";
    }
    {
      action = "<CMD>LspUI type_definition<CR>";
      options.desc = "LspTypeDefinitions";
      key = "<leader>lt";
    }
    {
      action = "<CMD>LspUI implementation<CR>";
      options.desc = "LspImplementations";
      key = "<leader>li";
    }
    {
      action = "<CMD>LspUI code_action<CR>";
      options.desc = "LspCodeAction";
      key = "<leader>la";
    }
    {
      action = "<CMD> LspUI diagnostic next<CR>";
      options.desc = "LspDiagnosticJump";
      key = "]d";
    }
    {
      action = "<CMD> LspUI diagnostic prev<CR>";
      options.desc = "LspDiagnosticJump";
      key = "[d";
    }
  ];
}

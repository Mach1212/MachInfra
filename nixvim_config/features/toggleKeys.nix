{
  keymaps = [
    {
      key = "<leader>~t";
      action = "<CMD>TSToggle highlight<CR>";
      options.desc = "Hl Treesitter";
    }
    {
      key = "<leader>~c";
      action = "<CMD>ColorizerToggle<CR>";
      options.desc = "Hl Colorizor";
    }
    {
      key = "<leader>~i";
      action = "<CMD>lua vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled())<CR>";
      options.desc = "LspInlayHintToggle";
    }
  ];
}

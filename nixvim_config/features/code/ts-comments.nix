{
  plugins.ts-comments.enable = true;
  # TODO: give these guys descriptions
  extraConfigLua =
    #lua
    ''
      vim.keymap.set("n", "<leader>/", "gcc", { remap = true })
      vim.keymap.set("n", "<leader>?", "gbc", { remap = true })
      vim.keymap.set("v", "<leader>/", "gcc", { remap = true })
      vim.keymap.set("v", "<leader>?", "gbc", { remap = true })
    '';
}

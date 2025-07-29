{
  plugins.todo-comments.enable = true;
  keymaps = [
    {
      key = "<leader>ft";
      action = "<CMD>TodoTelescope<CR>";
      options.desc = "Find Todo";
    }
  ];
}

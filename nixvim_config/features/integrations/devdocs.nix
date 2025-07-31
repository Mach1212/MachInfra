{
  plugins.devdocs = {
    enable = true;
    settings = {
    };
  };
  keymaps = [
    {
      key = "<leader>md";
      action = ''<CMD>DevDocs get<CR>'';
      options.desc = "DevDocsOpen";
    }
  ];
}

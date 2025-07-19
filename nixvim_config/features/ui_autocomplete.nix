{
  plugins.blink-cmp.settings.completion = {
    list.selection = {
      auto_insert = true;
      preselect = false;
    };
    menu = {
      enabled = true;
      auto_show = true;
      border = "rounded";
    };
    trigger = {
      prefetch_on_insert = true;
    };
    accept = {
      auto_brackets = {
        enabled = true;
        semantic_token_resolution = {
          #
          enabled = false;
          # blocked_filetypes = ["java"];
          timeout_ms = 400;
        };
      };
    };
  };
}

{
  plugins.blink-cmp = {
    enable = true;
    settings = {
      completion = {
        documentation = {
          auto_show = true;
          auto_show_delay_ms = 1000;
          treesitter_highlighting = false;
        };
        keyword.range = "full";
        list.selection = {
          auto_insert = false;
          preselect = true;
        };
        # TODO: check on this
        trigger.prefetch_on_insert = false;
        sources = {
          cmdline = [];
        };
      };
      signature.enabled = true;
      # TODO: align this with telescope maps
      keymap = {
        preset = "super-tab";
        # "<C-space>" = [
        #   "show"
        #   "show_documentation"
        #   "hide_documentation"
        # ];
        # "<Tab>" = [
        #   "select_next"
        #   "fallback"
        # ];
        # "<S-Tab>" = [
        #   "select_prev"
        #   "fallback"
        # ];
        "<CR>" = [
          "select_and_accept"
        ];
        # TODO: fix <leader>/ on empty space
      };
    };
  };
}

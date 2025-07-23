{
  plugins.barbar = {
    enable = true;
    keymaps = {};
    settings = {
      # TODO: look at this again
      sidebar_filetypes = {
        neo-tree = {event = "BufWipeout";};
      };
    };
  };
  keymaps = [
    {
      key = "<A-h>";
      action = "<Cmd>BufferPrevious<CR>";
      options.desc = "Buffer Left";
    }
    {
      key = "<A-l>";
      action = "<Cmd>BufferNext<CR>";
      options.desc = "Buffer Right";
    }
    # {
    #   key = "<C-h>";
    #   action = "<Cmd>bn<CR>";
    #   options.desc = "Buffer Next";
    # }
    # {
    #   key = "<C-l>";
    #   action = "<Cmd>bp<CR>";
    #   options.desc = "Buffer Prev";
    # }
    {
      key = "<A-,>";
      action = "<Cmd>BufferMovePrevious<CR>";
      options.desc = "Buffer Move Right";
    }
    {
      key = "<A-.>";
      action = "<Cmd>BufferMoveNext<CR>";
      options.desc = "Buffer Move Left";
    }
    {
      key = "<leader>n";
      action = "<Cmd>tabnew<CR>";
      options.desc = "Buffer Create";
    }
    {
      key = "<leader>c";
      action = "<Cmd>BufferClose<CR>";
      options.desc = "Buffer Close";
    }
    {
      key = "<leader>C";
      action = "<Cmd>BufferClose!<CR>";
      options.desc = "Buffer Close Forced";
    }
  ];
}

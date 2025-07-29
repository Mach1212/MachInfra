{
  globals.mapleader = " ";

  keymaps = [
    {
      key = "<leader>q";
      action = "<CMD>q<CR>";
      options.desc = "Vim Quit";
    }
    {
      key = "<leader>Q";
      action = "<CMD>q!<CR>";
      options.desc = "Vim Quit Forced";
    }
    {
      key = "<leader>w";
      action = "<CMD>w<CR>";
      options.desc = "Buffer Write";
    }
    {
      key = "<leader>ww";
      action = "<CMD>wall<CR>";
      options.desc = "Buffer Write All";
    }
    {
      key = "<leader>W";
      action = "<CMD>w!<CR>";
      options.desc = "Buffer Write Forced";
    }
    {
      key = "<C-h>";
      action = "<C-w>h";
      options.desc = "Pane Goto Left";
    }
    {
      key = "<C-l>";
      action = "<C-w>l";
      options.desc = "Pane Goto Right";
    }
    {
      key = "<C-j>";
      action = "<C-w>j";
      options.desc = "Pane Goto Down";
    }
    {
      key = "<C-k>";
      action = "<C-w>k";
      options.desc = "Pane Goto Up";
    }
    {
      key = "<C-Left>";
      action = "<C-w><";
      options.desc = "Pane Goto Left";
    }
    {
      key = "<C-Right>";
      action = "<C-w>>";
      options.desc = "Pane Goto Right";
    }
    {
      key = "<C-Up>";
      action = "<C-w>-";
      options.desc = "Pane Goto Down";
    }
    {
      key = "<C-Down>";
      action = "<C-w>+";
      options.desc = "Pane Goto Up";
    }
    {
      key = "<leader>uw";
      action = "<CMD>set wrap!<CR>";
      options.desc = "Toggle Wrap";
    }
    {
      mode = "v";
      key = "<Tab>";
      action = ">gv";
      options.desc = "Indent Selection";
    }
    {
      mode = "v";
      key = "<S-Tab>";
      action = "<gv";
      options.desc = "UnIndent Selection";
    }
    {
      key = "j";
      action = "gj"; # Move down on screen lines rather than code lines. Super useful when code is wrapped and a line is multiple screen lines
    }
    {
      key = "k";
      action = "gk";
    }
  ];
}

{
  globals.mapleader = " ";
  keymaps =
    [
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
        key = "p";
        action = ''"+p`]'';
      }
      {
        key = "j";
        action = "gj";
      }
      # {
      #   key = "";
      #   action = "";
      #   options.desc = "";
      # }
    ]
    # TABS
    ++ [
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
    ]
    # NUMBER TOGGLE
    ++ [
      {
        key = "<leader>un";
        action = "<CMD>ToggleLineNumbers<CR>";
        options.desc = "Toggle Line Numbers";
      }
    ];
}

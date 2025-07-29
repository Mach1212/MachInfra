{
  plugins.gitsigns = {
    enable = true;
    settings = {};
  };
  keymaps = [
    {
      key = "<leader>gb";
      options.desc = "Git Blame Line";
      action = ''<CMD>Gitsigns blame_line<CR>'';
    }
    {
      key = "<leader>ga";
      options.desc = "Git Stage/Unstage Hunk";
      action = ''<CMD>Gitsigns stage_hunk<CR>'';
    }
    {
      key = "<leader>gr";
      options.desc = "Git Reset Hunk";
      action = ''<CMD>Gitsigns reset_hunk<CR>'';
    }
    {
      key = "<leader>gR";
      options.desc = "Git Reset Buffer";
      action = ''<CMD>Gitsigns reset_buffer<CR>'';
    }
    {
      key = "]g";
      options.desc = "Git Next Hunk";
      action = ''<CMD>Gitsigns nav_hunk next<CR>'';
    }
    {
      key = "[g";
      options.desc = "Git Prev Hunk";
      action = ''<CMD>Gitsigns nav_hunk prev<CR>'';
    }
    {
      key = "<leader>ug";
      options.desc = "Toggle Git Diff";
      action = "<CMD>call ToggleGitDiff()<CR>";
    }
    {
      mode = "v";
      key = "ag";
      options.desc = "Select Git Hunk";
      action = ''<CMD>Gitsigns select_hunk<CR>'';
    }
  ];
  extraConfigVim =
    #vim
    ''
      function! ToggleGitDiff()
          if g:mach12toggleGitDiff == 0
              let g:mach12toggleGitDiff=1
              Gitsigns toggle_linehl
              Gitsigns toggle_word_diff
          elseif g:mach12toggleGitDiff == 1
              let g:mach12toggleGitDiff=0
              Gitsigns toggle_linehl
              Gitsigns toggle_word_diff
          endif
      endfunction
      let g:mach12toggleGitDiff = 0
    '';
}

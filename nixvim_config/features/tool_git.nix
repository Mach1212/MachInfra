{
  plugins.gitsigns = {
    settings = {};
  };
  plugins.gitlinker = {
    mappings = null;
    callbacks = {
      "github.ibm.com".__raw = "require('gitlinker.hosts').get_github_type_url";
    };
  };

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

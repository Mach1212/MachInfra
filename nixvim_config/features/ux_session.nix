{
  plugins.auto-session = {
    settings = {
      cwd_change_handling = true;
      # use_git_branch = true;
      pre_save_cmds.__raw = "{\"Neotree close\"}";
    };
  };
}

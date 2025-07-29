# If having problems, delete all sessions in `echo stdpath('data') .. '/sessions'` asdf
{
  # TODO: git branch sessions
  plugins.auto-session = {
    enable = true;
    settings = {
      cwd_change_handling = true;
      # use_git_branch = true;
      pre_save_cmds.__raw = "{\"Neotree close\"}";
    };
  };
}

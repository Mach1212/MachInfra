{
  plugins.guess-indent = {
    enable = true;
    settings = {
      filetype_exclude = [
        "netrw"
        "tutor"
      ];
      buftype_exclude = [
        "help"
        "nofile"
        "terminal"
        "prompt"
      ];
      on_space_options = {
        expandtab = true;
        tabstop = "detected";
        softtabstop = "detected";
        shiftwidth = "detected";
      };
      on_tab_options = {
        expandtab = false;
      };
    };
  };
}
# TODO: add buttons in lualine to show indent and tabs vs spaces


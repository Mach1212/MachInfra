{
  plugins.telescope.settings = {
    defaults = {
      # Used for live_grep
      vimgrep_arguments = [
        "rg"
        "--color=never"
        "--no-heading"
        "--with-filename"
        "--line-number"
        "--column"
        "--smart-case"
        "--hidden"
      ];
    };
    # Used for find_files
    pickers = {
      find_files = {
        find_command = [
          "fd"
          "--type"
          "f"
          "--hidden"
          "--strip-cwd-prefix"
          "--exclude"
          ".git"
        ];
      };
    };
  };
}

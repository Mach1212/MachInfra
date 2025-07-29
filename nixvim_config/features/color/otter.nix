{
  plugins.otter = {
    enable = true;
    settings = {
      lsp.diagnostic_update_events = ["InsertLeave" "BufWritePost"];
      buffers = {
        set_filetype = true;
      };
      verbose = {
        # set to false to disable all verbose messages
        no_code_found = false; # warn if otter.activate is called, but no injected code was found
      };
    };
  };
}

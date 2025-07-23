{
  # TODO: telescope preview doesn't have highlighting like todo highlighting or colorizor
  plugins.rust-tools = {
    enable = true;
    inlayHints = {
      auto = false;
      highlight = null;
    };
    server.standalone = false;
  };
}

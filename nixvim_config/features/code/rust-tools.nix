{
  # TODO: telescope preview doesn't have highlighting like todo highlighting or colorizor
  plugins.rustaceanvim = {
    enable = true;
    settings.server = {
      default_settings = {
        rust-analyzer = {
          check = {
            command = "clippy";
          };
          inlayHints = {
            lifetimeElisionHints = {
              enable = "always";
            };
          };
        };
      };
      standalone = false;
    };
  };
}

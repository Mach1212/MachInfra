{
  # TODO: telescope preview doesn't have highlighting like todo highlighting or colorizor
  plugins.rustaceanvim = {
    enable = true;
    settings.server = {
      default_settings = {
        rust-analyzer = {
          assist = {
            importEnforceGranularity = true;
            importPrefix = "crate";
          };
          cargo = {
            allFeatures = true;
          };
          check = {
            command = "clippy";
          };
          inlayHints = {
            lifetimeElisionHints = {
              enable = "skip_trivial";
              useParameterNames = true;
            };
          };
        };
      };
      standalone = true;
    };
  };
}

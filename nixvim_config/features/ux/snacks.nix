{
  helpers,
  lib,
  ...
}: {
  plugins.snacks = {
    enable = true;
    settings = {
      quickfile.enabled = true;
      terminal.enabled = true;

      picker = {
        enabled = lib.mkDefault false;
        sources.explorer.layout = {
          layout.width = 32;
          auto_hide = helpers.listToUnkeyedAttrs ["input"];
        };
      };
      indent.enabled = lib.mkDefault false;
      notifier.enabled = false;
      explorer.enabled = lib.mkDefault false;
      bigfile.enabled = false;
      dashboard.enabled = false;
      input.enabled = false;
      scope.enabled = false;
      statuscolumn.enabled = false;
      words.enabled = false;
    };
  };
}

{helpers, ...}: {
  plugins.better-escape = {
    enable = true;
    # TODO: disable jj and kk in a toggleterm
    settings.mappings = {
      c = {
        J = {
          J = "<Esc>";
          K = "<Esc>";
        };
      };
      i = {
        J = {
          J = "<Esc>";
          K = "<Esc>";
        };
      };
      s = {
        J = {
          K = "<Esc>";
        };
      };
      t = {
        j = helpers.listToUnkeyedAttrs [false];
        J = {
          J = "<Esc>";
          K = "<Esc>";
        };
      };
      v = {
        j = helpers.listToUnkeyedAttrs [false];
      };
    };
  };
}

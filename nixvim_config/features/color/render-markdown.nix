{helpers, ...}: {
  plugins.render-markdown = {
    enable = true;
    settings = {
      render_modes = true;
      heading = {
        backgrounds = [
          "RenderMarkdownHeaderBg"
          # TODO: Highlights matching rainbow1 faded or smtn
        ];
        foregrounds = [
          "rainbow1"
          "rainbow2"
          "rainbow3"
          "rainbow4"
          "rainbow5"
          "rainbow6"
        ];
      };
    };
  };
  highlight = {
    RenderMarkdownHeaderBg = {
      bg = "#1d1e29";
    };
  };
  # TODO: fix link rendering. Should render only the link instead of the whole thing
  # TODO: remove vim depreciated from checkhealth
  # TODO: latex2text in rendermarkdown?
}

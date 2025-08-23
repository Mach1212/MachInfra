{helpers, ...}: {
  plugins.blink-cmp = {
    enable = true;
    settings = {
      completion = {
        menu.draw = {
          columns = helpers.listToUnkeyedAttrs [
            (helpers.listToUnkeyedAttrs ["label" "label_description"] // {gap = 1;})
            (helpers.listToUnkeyedAttrs ["kind_icon" "kind"] // {gap = 1;})
            # (helpers.listToUnkeyedAttrs ["kind_icon"])
            # (helpers.listToUnkeyedAttrs ["label"] // {gap = 1;})
          ];
          # components.label.__raw =
          #   #lua
          #   ''
          #     {
          #       text = function(ctx)
          #           return require("colorful-menu").blink_components_text(ctx)
          #       end,
          #       highlight = function(ctx)
          #           return require("colorful-menu").blink_components_highlight(ctx)
          #       end,
          #     }
          #   '';
        };
        documentation = {
          auto_show = true;
          auto_show_delay_ms = 500;
          treesitter_highlighting = true;
        };
        keyword.range = "full";
        list.selection = {
          auto_insert = true;
          preselect = false;
        };
        # TODO: check on this
        trigger.prefetch_on_insert = false;
        accept = {
          auto_brackets.kind_resolution.blocked_filetypes = [];
          resolve_timeout_ms = 500;
        };
        sources = {
          cmdline = [];
        };
      };
      # TODO: add spellcheck
      signature.enabled = false;
      # TODO: align this with telescope maps
      # TODO: indicator when line is out of scope(needs wrapping)
      keymap = {
        preset = "super-tab";
        # "<C-space>" = [
        #   "show"
        #   "show_documentation"
        #   "hide_documentation"
        # ];
        # "<Tab>" = [
        #   "select_next"
        #   "fallback"
        # ];
        # "<S-Tab>" = [
        #   "select_prev"
        #   "fallback"
        # ];
        "<Tab>" = let
          select_next_and_move_snippet = helpers.mkRaw ''
            function(cmp)
              if not cmp.snippet_active() then return cmp.select_next() end
            end
          '';
        in [
          select_next_and_move_snippet
          "snippet_forward"
          "fallback"
        ];
        "<S-Tab>" = ["select_prev"];
        "<CR>" = let
          select_and_accept = helpers.mkRaw ''
            function(cmp)
              return cmp.accept()
            end
          '';
        in [
          select_and_accept
          "fallback"
        ];
        # TODO: <c-o> Doesn't go back to my recently closed file?
        # TODO: fix <leader>/ on empty space
      };
    };
  };
}

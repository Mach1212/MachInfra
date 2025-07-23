{helpers, ...}: {
  plugins = {
    nvim-autopairs.settings = {
      check_ts = true;
      disable_filetype = [
        "TelescopePrompt"
      ];
    };
    nerdy.enableTelescope = true;
    render-markdown.settings = {
      render_modes = helpers.listToUnkeyedAttrs ["n" "v" "c" "t" "i" "r"];
    };
    typescript-tools.settings = {
      # handlers = {
      #   "textDocument/publishDiagnostics" = ''
      #     api.filter_diagnostics(
      #       { 80006 }
      #     )
      #   '';
      # };

      on_attach = ''
        function(client)
        	client.server_capabilities.documentFormattingProvider = false
        	client.server_capabilities.documentRangeFormattingProvider = false
        end
      '';
      settings = {
        tsserver_file_preferences = {
          __raw = ''
            function(ft)
              return {
                includeInlayParameterNameHints = "all",
                includeCompletionsForModuleExports = true,
                quotePreference = "auto",
              }
            end
          '';
        };
        # tsserver_format_options = {
        #   __raw = ''
        #     function(ft)
        #       return {
        #         allowIncompleteCompletions = false,
        #         allowRenameOfImportPath = false,
        #       }
        #     end
        #   '';
        # };
        # tsserver_plugins = [
        #   "@styled/typescript-styled-plugin"
        # ];
      };
    };
  };
}

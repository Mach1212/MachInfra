{helpers, ...}: {
  # lspconfig is same as lsp.enable. https://github.com/neovim/nvim-lspconfig/blob/master/lsp
  plugins.lsp = {
    enable = true;
    # TODO: Research this
    # inlayHints.enable = true;
    servers = {
      nil_ls.enable = true;
      nixd.enable = true;

      markdown_oxide.enable = true;

      lua_ls = {
        enable = true;
        extraOptions = {
          # TODO: Figure this out
          Lua = {
            runtime = {
              version = "LuaJIT";
            };
            diagnostics = {
              # globals = {__raw = "vim";};
              globals = helpers.listToUnkeyedAttrs ["vim"];
            };
            workspace = {
              library.__raw = ''vim.api.nvim_get_runtime_file("", true)'';
            };
          };
        };
      };

      bashls.enable = true;

      basedpyright.enable = true;

      # webdev
      html.enable = true;
      cssls.enable = true;
      tailwindcss.enable = true;
      eslint.enable = true;

      jsonls.enable = true;
      yamlls.enable = true;

      dockerls.enable = true;
      docker_compose_language_service.enable = true;
      # TODO: Research this
      # "*" = {
      #   settings = {
      #     capabilities = {
      #       textDocument = {
      #         semanticTokens = {
      #           multilineTokenSupport = true;
      #         };
      #       };
      #     };
      #     root_markers = [
      #       ".git"
      #     ];
      #   };
      # };
    };
    keymaps = {
      lspBuf = {
        # TODO: make this menu slightly transparent
        K = "hover";
      };
      extra = [
        {
          action.__raw = "require('telescope.builtin').lsp_definitions";
          options.desc = "LspDeclaration";
          key = "<leader>ld";
        }
        {
          action.__raw = "require('telescope.builtin').lsp_references";
          options.desc = "LspReferences";
          key = "<leader>lr";
        }
        {
          action.__raw = "vim.lsp.buf.rename";
          options.desc = "LspRename";
          key = "<leader>lR";
        }
        {
          action.__raw = "require('telescope.builtin').lsp_type_definitions";
          options.desc = "LspTypeDefinitions";
          key = "<leader>lt";
        }
        {
          action.__raw = "require('telescope.builtin').lsp_implementations";
          options.desc = "LspImplementations";
          key = "<leader>li";
        }
        {
          action.__raw = "require('telescope.builtin').lsp_implementations";
          options.desc = "LspImplementations";
          key = "<leader>li";
        }
        {
          action.__raw = "vim.lsp.buf.code_action";
          options.desc = "LspCodeAction";
          key = "<leader>la";
        }
        {
          action.__raw = "function() vim.diagnostic.jump({ count=1, float=true }) end";
          options.desc = "LspDiagnosticJump";
          key = "]d";
        }
        {
          action.__raw = "function() vim.diagnostic.jump({ count=-1, float=true }) end";
          options.desc = "LspDiagnosticJump";
          key = "[d";
        }
        {
          key = "<leader>ud";
          options.desc = "LspDiagnosticsToggle";
          action = "<CMD>ToggleDiagnostics<CR>";
        }
      ];
    };
  };
  diagnostic.settings = {
    virtual_text = {
      source = false;
      severity_sort = true;
    };
    float = {
      source = true;
      severity_sort = true;
    };
  };
  extraConfigLua =
    # lua
    ''
      -- TODO: Reorder diags so errors are first
      -- TODO: Block align diags so lots of them aren't as distracting
      local mach12toggleLspDiagnostics = 2
      local toggleDiagnostics =
      	function()
      		if mach12toggleLspDiagnostics == 0 then
      			vim.diagnostic.config({
      				underline = false,
      				virtual_text = false,
      				signs = false,
      				update_in_insert = false,
      			})
      			mach12toggleLspDiagnostics = 1
      		elseif mach12toggleLspDiagnostics == 1 then
      			vim.diagnostic.config({
      				underline = true,
      				update_in_insert = true,
      				signs = true,
      			})
      			mach12toggleLspDiagnostics = 2
      		elseif mach12toggleLspDiagnostics == 2 then
      			vim.diagnostic.config({
      				virtual_text = true,
      			})
      			mach12toggleLspDiagnostics = 0
      		end
      	end, {
      		desc = "Toggle line numbers",
      	}
      vim.api.nvim_create_user_command("ToggleDiagnostics", toggleDiagnostics, { desc = "Toggle lsp diagnostics" })
    '';
}
# TODO: remove treesitter parsers checkhealth section


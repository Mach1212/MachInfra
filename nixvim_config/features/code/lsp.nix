{
  # TODO: git branch sessions
  # lspconfig is same as lsp.enable. https://github.com/neovim/nvim-lspconfig/blob/master/lsp
  plugins.lsp = {
    enable = true;
    # TODO: Research this
    # inlayHints.enable = true;
    servers = {
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
      nil_ls.enable = true;
      nixd.enable = true;

      markdown_oxide.enable = true;
    };
    keymaps = {
      lspBuf = {
        K = "hover";
      };
      extra = [
        {
          action.__raw = "require('telescope.builtin').lsp_definitions";
          key = "gd";
        }
        {
          action.__raw = "require('telescope.builtin').lsp_references";
          key = "gD";
        }
        {
          action.__raw = "require('telescope.builtin').lsp_type_definitions";
          key = "gt";
        }
        {
          action.__raw = "require('telescope.builtin').lsp_implementations";
          key = "gT";
        }
        {
          action.__raw = "function() vim.diagnostic.jump({ count=-1, float=true }) end";
          key = "]d";
        }
        {
          action = "function() vim.diagnostic.jump({ count=1, float=true }) end";
          key = "[d";
        }
        {
          key = "<leader>ud";
          options.desc = "Toggle lsp diagnostics";
          action = "<CMD>ToggleDiagnostics<CR>";
        }
      ];
    };
  };
  extraConfigLua =
    #lua
    ''
      local mach12toggleLspDiagnostics = 0
      vim.api.nvim_create_user_command("ToggleDiagnostics", function(args)
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
      })
    '';
}
# TODO: remove treesitter parsers checkhealth section


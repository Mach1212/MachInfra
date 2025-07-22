{
  diagnostic.settings = {
    virtual_text = {
      source = "always";
    };
    severity_sort = true;
    float = {
      source = "always";
    };
    signs = true;
    #   text = [
    #     {
    #       name = "DiagnosticSignError";
    #       text = "❌";
    #     }
    #     {
    #       name = "DiagnosticSignWarn";
    #       text = "⚠";
    #     }
    #     {
    #       name = "DiagnosticSignHint";
    #       text = "🔎";
    #     }
    #     {
    #       name = "DiagnosticSignInfo";
    #       text = "ℹ";
    #     }
    #   ];
    # };
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

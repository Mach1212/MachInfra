{helpers, ...}: {
  # lspconfig is same as lsp.enable. https://github.com/neovim/nvim-lspconfig/blob/master/lsp
  plugins.lsp = {
    enable = true;
    inlayHints = false;
    capabilities =
      #lua
      ''
        capabilities = require("blink.cmp").get_lsp_capabilities({
        	textDocument = {
        		semanticTokens = {
        			multilineTokenSupport = true,
        		},
        	},
        })
      '';
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
    };
    keymaps = {
      # lspBuf = {
      #   # TODO: make this menu slightly transparent
      #   K = "hover";
      # };
      extra = [
        {
          action.__raw = "require('telescope.builtin').lsp_definitions";
          options.desc = "LspDeclaration";
          # key = "<leader>ld";
          key = "gd";
        }
        {
          action.__raw = "require('telescope.builtin').lsp_references";
          options.desc = "LspReferences";
          # key = "<leader>lr";
          key = "gr";
        }
        #   {
        #     action.__raw = "vim.lsp.buf.rename";
        #     options.desc = "LspRename";
        #     key = "<leader>lR";
        #   }
        # {
        #   action.__raw = "require('telescope.builtin').lsp_type_definitions";
        #   options.desc = "LspTypeDefinitions";
        #   # key = "<leader>lt";
        #   key = "gt";
        # }
        # {
        #   action.__raw = "require('telescope.builtin').lsp_implementations";
        #   options.desc = "LspImplementations";
        #   # key = "<leader>li";
        #   key = "gi";
        # }
        #   # {
        #   #   action.__raw = "vim.lsp.buf.code_action";
        #   #   options.desc = "LspCodeAction";
        #   #   key = "<leader>la";
        #   # }
        #   {
        #     action.__raw = "function() vim.diagnostic.jump({ count=1, float=true }) end";
        #     options.desc = "LspDiagnosticJump";
        #     key = "]d";
        #   }
        #   {
        #     action.__raw = "function() vim.diagnostic.jump({ count=-1, float=true }) end";
        #     options.desc = "LspDiagnosticJump";
        #     key = "[d";
        #   }
        {
          key = "<leader>li";
          options.desc = "Lsp Info";
          action = "<CMD>LspInfo<CR>";
        }
        {
          key = "<leader>lI";
          options.desc = "Lsp Log";
          action = "<CMD>LspLog<CR>";
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
      vim.keymap.del("n", "grt")
      vim.keymap.del("n", "grr")
      vim.keymap.del("n", "grn")
      vim.keymap.del("n", "gri")
      vim.keymap.del("n", "gra")
      -- vim.keymap.del("n", "gd")

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

      -- ******************************************************************************
      ---@type table<number, {token:lsp.ProgressToken, msg:string, done:boolean}[]>
      local progress = vim.defaulttable()
      vim.api.nvim_create_autocmd("LspProgress", {
      	---@param ev {data: {client_id: integer, params: lsp.ProgressParams}}
      	callback = function(ev)
      		local client = vim.lsp.get_client_by_id(ev.data.client_id)
      		local value = ev.data.params.value --[[@as {percentage?: number, title?: string, message?: string, kind: "begin" | "report" | "end"}]]
      		if not client or type(value) ~= "table" then
      			return
      		end
      		local p = progress[client.id]

      		for i = 1, #p + 1 do
      			if i == #p + 1 or p[i].token == ev.data.params.token then
      				p[i] = {
      					token = ev.data.params.token,
      					msg = ("[%3d%%] %s%s"):format(
      						value.kind == "end" and 100 or value.percentage or 100,
      						value.title or "",
      						value.message and (" **%s**"):format(value.message) or ""
      					),
      					done = value.kind == "end",
      				}
      				break
      			end
      		end

      		local msg = {} ---@type string[]
      		progress[client.id] = vim.tbl_filter(function(v)
      			return table.insert(msg, v.msg) or not v.done
      		end, p)

      		local spinner = { "⠋", "⠙", "⠹", "⠸", "⠼", "⠴", "⠦", "⠧", "⠇", "⠏" }
      		vim.notify(table.concat(msg, "\n"), "info", {
      			id = "lsp_progress",
      			title = client.name,
      			opts = function(notif)
      				notif.icon = #progress[client.id] == 0 and " "
      					or spinner[math.floor(vim.uv.hrtime() / (1e6 * 80)) % #spinner + 1]
      			end,
      		})
      	end,
      })
    '';
}
# TODO: remove treesitter parsers checkhealth section


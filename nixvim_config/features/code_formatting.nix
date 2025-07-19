{
  pkgs,
  lib,
  ...
}: {
  plugins.treesitter.settings.indent.enable = true;
  plugins.conform-nvim = {
    settings = {
      formatters_by_ft = let
        jsFormat = [
          "prettierd"
          "eslint_d"
        ];
      in {
        markdown = [
          "injected"
        ];
        nix = [
          "alejandra"
          "injected"
        ];
        lua = [
          "stylua"
        ];
        javascript = jsFormat;
        typescript = jsFormat;
        javascriptreact = jsFormat;
        "javascript.jsx" = jsFormat;
        typescriptreact = jsFormat;
        "typescript.tsx" = jsFormat;
        python = [
          "ruff_fix"
          "ruff_organize_imports"
          "ruff_format"
        ];
        json = [
          "jq"
        ];
        yaml = [
          "yamlfmt"
        ];
        "_" = [
          "squeeze_blanks"
          "trim_whitespace"
          "trim_newlines"
        ];
      };
      format_on_save =
        # Lua
        ''
          function(bufnr)
            -- Disable with a global or buffer-local variable
            if vim.g.disable_autoformat or vim.b[bufnr].disable_autoformat then
              return
            end
            if vim.g.format_modifications_only then
              -- Prefer to format Git hunks over entire file
              format_hunks(bufnr)
            else
              return default_format_options
            end
          end
        '';
      formatters = {
        injected = {
          options = {
            ignore_errors = false;
            lang_to_ext = {
              lua = "lua";
              bash = "sh";
              markdown = "md";
              python = "py";
              rust = "rs";
            };
          };
        };
        ruff_fix = {
          command = lib.getExe pkgs.ruff;
        };
        ruff_organize_imports = {
          command = lib.getExe pkgs.ruff;
        };
        ruff_format = {
          command = lib.getExe pkgs.ruff;
        };
        shellcheck = {
          command = lib.getExe pkgs.shellcheck;
        };
        shfmt = {
          command = lib.getExe pkgs.shfmt;
        };
        shellharden = {
          command = lib.getExe pkgs.shellharden;
        };
        alejandra = {
          command = lib.getExe pkgs.alejandra;
        };
        prettierd = {
          command = lib.getExe pkgs.prettierd;
        };
        stylua = {
          command = lib.getExe pkgs.stylua;
        };
        jq = {
          command = lib.getExe pkgs.jq;
        };
        squeeze_blanks = {
          command = lib.getExe' pkgs.coreutils "cat";
        };
        ruff = {
          command = lib.getExe pkgs.ruff;
        };
        yamlfmt = {
          command = lib.getExe pkgs.yamlfmt;
        };
      };
    };
  };
  # vim.o.formatexpr = "v:lua.require'conform'.formatexpr()"
  userCommands = {
    Format = {
      command = ''lua require("conform").format()'';
    };
  };
  extraConfigLua =
    #lua
    ''
      -- CODE_FORMATTING
      default_format_options = {
      	lsp_fallback = true,
      	async = false,
      	timeout_ms = 20000,
      }
      local range_ignore_filetypes = { "lua" }
      local format = require("conform").format
      function format_hunks(bufnr)
      	if vim.tbl_contains(range_ignore_filetypes, vim.bo.filetype) then
      		format(default_format_options)
      		return
      	end
      	local hunks = require("gitsigns").get_hunks()
      	if not hunks then
      		return
      	end
      	local function format_range()
      		if next(hunks) == nil then
      			vim.notify("GitHunks done", "info", { title = "Format" })
      			return
      		end
      		local hunk = nil
      		while next(hunks) ~= nil and (hunk == nil or hunk.type == "delete") do
      			hunk = table.remove(hunks)
      		end

      		if hunk ~= nil and hunk.type ~= "delete" then
      			local start = hunk.added.start
      			local last = start + hunk.added.count
      			-- nvim_buf_get_lines uses zero-based indexing -> subtract from last
      			local last_hunk_line = vim.api.nvim_buf_get_lines(0, last - 2, last - 1, true)[1]
      			local range = { start = { start, 0 }, ["end"] = { last - 1, last_hunk_line:len() } }
      			format({ range = range, async = false, lsp_fallback = true, timeout = 5000 }, function()
      				vim.defer_fn(function()
      					format_range()
      				end, 1)
      			end)
      		end
      	end
      	format_range()
      end
      vim.api.nvim_create_user_command("FormatDisable", function(args)
      	if args.bang then
      		-- FormatDisable! will disable formatting just for this buffer
      		vim.b.disable_autoformat = true
      	else
      		vim.g.disable_autoformat = true
      	end
      end, {
      	desc = "Disable autoformat-on-save",
      	bang = true,
      })
      vim.api.nvim_create_user_command("FormatEnable", function()
      	vim.b.disable_autoformat = false
      	vim.g.disable_autoformat = false
      end, {
      	desc = "Re-enable autoformat-on-save",
      })
      vim.api.nvim_create_user_command("FormatToggle", function(args)
      	if args.bang then
      		-- Toggle formatting for current buffer
      		vim.b.disable_autoformat = not vim.b.disable_autoformat
      		vim.notify("BufferFormat: " .. tostring(not vim.b.disable_autoformat))
      	else
      		-- Toggle formatting globally
      		vim.g.disable_autoformat = not vim.g.disable_autoformat
      		vim.notify("GlobalFormat: " .. tostring(not vim.g.disable_autoformat))
      	end
      end, {
      	desc = "Toggle autoformat-on-save",
      	bang = true,
      })
      vim.api.nvim_create_user_command("FormatGitHunksToggle", function(args)
      	vim.g.format_modifications_only = not vim.g.format_modifications_only
      	vim.notify("GitHunksGlobalFormat: " .. tostring(vim.g.format_modifications_only))
      end, {
      	desc = "Toggle git hunks autoformat-on-save",
      	bang = true,
      })
      vim.api.nvim_create_user_command("FormatGitHunksToggleBuffer", function(args)
      	vim.b.format_modifications_only = not vim.b.format_modifications_only
      	vim.notify("GitHunksBufferFormat: " .. tostring(vim.b.format_modifications_only))
      end, {
      	desc = "Toggle git hunks autoformat-on-save in buffer",
      	bang = true,
      })
    '';
}

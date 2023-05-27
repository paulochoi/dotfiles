local null_ls = require("null-ls")

local group = vim.api.nvim_create_augroup("lsp_format_on_save", { clear = false })
-- for conciseness
local formatting = null_ls.builtins.formatting -- to setup formatters
local diagnostics = null_ls.builtins.diagnostics -- to setup linters

null_ls.setup({
	-- setup formatters & linters
	sources = {
		--  to disable file types use
		formatting.prettierd, -- js/ts formatter
		formatting.stylua, -- lua formatter
		diagnostics.eslint_d.with({
			-- js/ts linter
			-- only enable eslint if root has .eslintrc.js or .eslintrc.js
			condition = function(utils)
				return utils.root_has_file(".eslintrc.js")
				-- change file extension if you use something else
			end,
		}),
	},
})

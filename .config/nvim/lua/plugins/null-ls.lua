return {
  "jose-elias-alvarez/null-ls.nvim",
  event = { "BufReadPre", "BufNewFile" },
  dependencies = { "mason.nvim" },
  opts = function()
    local nls = require("null-ls")
    return {
      root_dir = require("null-ls.utils").root_pattern(".null-ls-root", ".neoconf.json", "Makefile", ".git"),
      debug = true,
      sources = {
        nls.builtins.formatting.fish_indent,
        nls.builtins.diagnostics.fish,
        nls.builtins.formatting.stylua,
        nls.builtins.formatting.shfmt,
        nls.builtins.formatting.fixjson,
        nls.builtins.formatting.prettier.with({
          condition = function(utils)
            return utils.root_has_file_matches("prettier")
          end,
        }),
        nls.builtins.diagnostics.eslint_d.with({
          -- js/ts linter
          -- only enable eslint if root has .eslintrc.js or .eslintrc.js
          condition = function(utils)
            return utils.root_has_file(".eslintrc.js")
            -- change file extension if you use something else
          end,
        }),
      },
    }
  end,
}

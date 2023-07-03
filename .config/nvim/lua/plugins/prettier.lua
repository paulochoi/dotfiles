return {
  "MunifTanjim/prettier.nvim",
  keys = { { "<leader>f", ":Prettier<CR>", { desc = "Format with Prettier" } } },
  config = function()
    local prettier = require("prettier")

    prettier.setup({
      bin = "prettierd",
      filetypes = {
        "css",
        "graphql",
        "html",
        "javascript",
        "javascriptreact",
        "json",
        "less",
        "markdown",
        "scss",
        "typescript",
        "typescriptreact",
        "yaml",
      },
      ["null-ls"] = {
        condition = function()
          return prettier.config_exists({
            check_package_json = true,
          })
        end,
      },
    })
  end,
}

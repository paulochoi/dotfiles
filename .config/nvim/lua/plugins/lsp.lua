-- LSP keymaps
local format = function()
  require("lazyvim.plugins.lsp.format").format({ force = true })
end
return {
  "neovim/nvim-lspconfig",
  opts = {
    autoformat = true,
    format_notify = false,
  },
  init = function()
    local keys = require("lazyvim.plugins.lsp.keymaps").get()
    -- disable a keymap
    keys[#keys + 1] = { "K", false }
    keys[#keys + 1] = { "<leader>cf", false }
    keys[#keys + 1] = { "<leader>cF", false }

    keys[#keys + 1] = { "gh", "<cmd>lua vim.lsp.buf.hover()<cr>" }
    keys[#keys + 1] = { "<leader>vd", "<cmd>lua vim.diagnostic.open_float()<cr>" }
    -- keys[#keys + 1] = { "<leader>vws", vim.lsp.buf.workspace_symbol()}
    keys[#keys + 1] = { "<leader>vca", "<cmd>lua vim.lsp.buf.code_action()<cr>" }
    keys[#keys + 1] = {
      "<leader>vcA",
      function()
        vim.lsp.buf.code_action({
          context = {
            only = {
              "source",
            },
            diagnostics = {},
          },
        })
      end,
      desc = "Source Action",
      has = "codeAction",
    }
    keys[#keys + 1] = { "<leader>vcr", "<cmd>lua vim.lsp.buf.rename()<cr>" }
    keys[#keys + 1] = { "<leader>f", format, "Formats buffer" }
  end,
}

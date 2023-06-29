-- LSP keymaps
return {
  "neovim/nvim-lspconfig",
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
    keys[#keys + 1] = { "<leader>vrr", "<cmd>lua vim.lsp.buf.references()<cr>" }
    keys[#keys + 1] = { "<leader>vrn", "<cmd>lua vim.lsp.buf.rename()<cr>" }
    keys[#keys + 1] = { "<leader>f", "<cmd>lua vim.lsp.buf.format({async = true})<cr>" }
    --
  end,
}

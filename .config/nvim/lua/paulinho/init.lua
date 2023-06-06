require("paulinho.functions")
require("paulinho.remap")
require("paulinho.set")

-- recommended settings from nvim-tree documentation
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1
vim.g.copilot_no_tab_map = true
vim.g.copilot_assume_mapped = true
vim.g.copilot_tab_fallback = ""

vim.cmd([[command! -nargs=0 GoToFile :Telescope find_files]])
vim.cmd([[command! -nargs=0 GoToCommand :Telescope commands]])
require'alpha'.setup(require'alpha.themes.startify'.config)

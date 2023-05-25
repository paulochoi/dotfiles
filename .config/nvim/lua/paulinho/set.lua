vim.opt.guicursor=  "n-v-c-sm:block,i-ci-ve:ver25,r-cr-o:hor20" 
vim.opt.nu = true
vim.opt.relativenumber = true

vim.opt.tabstop = 2
vim.opt.softtabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true
vim.opt.autoindent = true

vim.opt.smartindent = true
vim.opt.wrap = false

vim.opt.ignorecase = true
vim.opt.smartcase = true

vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
vim.opt.undofile = true

vim.opt.hlsearch = true
vim.opt.incsearch = true

vim.opt.termguicolors = true
vim.opt.background = "dark"

vim.opt.scrolloff = 8
vim.opt.signcolumn = "yes"
vim.opt.isfname:append("@-@")

vim.opt.backspace = "indent,eol,start"

vim.opt.updatetime = 50

vim.g.mapLeaderKey = " "

vim.opt.clipboard:append("unnamedplus")

vim.opt.splitright = true
vim.opt.splitbelow = true

vim.g.settermguicolors = true
vim.opt.title = true
vim.opt.titlestring = [[%f %h%m%r%w %{v:progname} (%{tabpagenr()} of %{tabpagenr('$')})]]
vim.o.background = "dark" -- or "light" for light mode
vim.o.foldlevel = 20
vim.o.foldmethod = "expr"

vim.cmd([[let g:gruvbox_material_background = 'soft']])
vim.cmd([[let g:gruvbox_material_palette = 'material']])
vim.cmd([[let g:gruvbox_material_better_performance = 1]])
vim.cmd([[let g:gruvbox_material_transparent_background = 1]])
vim.cmd([[colorscheme gruvbox-material]])


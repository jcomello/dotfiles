vim.opt.number  = true
vim.opt.relativenumber = true

vim.opt.swapfile = false

vim.opt.splitbelow = true
vim.opt.splitright = true

vim.opt.wrap = false

vim.opt.expandtab = true
vim.opt.tabstop = 2
vim.opt.softtabstop = 2
vim.opt.shiftwidth = 2

-- Do not crash nvim when type Ctrl+z
vim.keymap.set({'n', 'v'}, '<C-z>', ':echo "NO"', {})

-- syncronizes the system clipboard
-- with nvim's clipboard.
vim.opt.clipboard = "unnamedplus"
vim.opt.scrolloff = 999

vim.opt.virtualedit = "block"

vim.opt.inccommand = "split"

vim.opt.ignorecase = true

vim.opt.termguicolors = true

vim.g.mapleader = " "

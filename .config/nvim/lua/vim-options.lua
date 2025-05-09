vim.g.python_host_prog = '~/.pyenv/versions/py3nvim/bin/python'
vim.g.python3_host_prog = '~/.pyenv/versions/py3nvim/bin/python'

vim.opt.number  = true
vim.opt.relativenumber = false

vim.opt.swapfile = false

vim.opt.splitbelow = true
vim.opt.splitright = true

vim.opt.wrap = false

vim.opt.expandtab = true
vim.opt.tabstop = 2
vim.opt.softtabstop = 2
vim.opt.shiftwidth = 2

-- Add one blank line
vim.keymap.set('n', '<CR>', ':normal o<CR>')
-- vim.keymap.set('n', '<S-CR>', ':normal O<CR>')
-- Worked only using `vim.cmd`
vim.cmd [[nmap <S-CR> :normal O<CR>]]

-- Tmux Navigation
vim.keymap.set('n', '<c-k>', ':wincmd k<CR>')
vim.keymap.set('n', '<c-j>', ':wincmd j<CR>')
vim.keymap.set('n', '<c-h>', ':wincmd h<CR>')
vim.keymap.set('n', '<c-l>', ':wincmd l<CR>')

-- syncronizes the system clipboard
-- with nvim's clipboard.
vim.opt.clipboard = "unnamedplus"
vim.opt.scrolloff = 999

vim.opt.virtualedit = "block"

vim.opt.inccommand = "split"

vim.opt.ignorecase = true

vim.opt.termguicolors = true

vim.g.mapleader = " "

vim.diagnostic.config {
    float = { border = "rounded" },
}

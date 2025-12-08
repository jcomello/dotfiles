vim.g.python_host_prog = "~/.pyenv/versions/py3nvim/bin/python"
vim.g.python3_host_prog = "~/.pyenv/versions/py3nvim/bin/python"

vim.opt.number = true
vim.opt.relativenumber = false

vim.opt.swapfile = false

vim.opt.splitbelow = true
vim.opt.splitright = true

vim.opt.wrap = false

vim.opt.expandtab = true
vim.opt.tabstop = 2
vim.opt.softtabstop = 2
vim.opt.shiftwidth = 2

vim.opt.wrap = true
vim.opt.linebreak = true

-- To check the directory the backup is beeing saved
-- just run `:echo &backupdir
vim.opt.backup = false

vim.opt.list = true
vim.opt.listchars = { tab = "» ", trail = "·", nbsp = "␣" }

-- Add one blank line
vim.keymap.set("n", "no", ":normal o<CR>")
-- Add one blank line above
vim.keymap.set("n", "NO", ":normal O<CR>")

-- Tmux Navigation
vim.keymap.set("n", "<c-k>", ":wincmd k<CR>")
vim.keymap.set("n", "<c-j>", ":wincmd j<CR>")
vim.keymap.set("n", "<c-h>", ":wincmd h<CR>")
vim.keymap.set("n", "<c-l>", ":wincmd l<CR>")

-- Open/Close completions
vim.keymap.set("i", "{", "{}<Esc>i")
vim.keymap.set("i", "(", "()<Esc>i")
vim.keymap.set("i", "[", "[]<Esc>i")
vim.keymap.set("i", '"', '""<Esc>i')
vim.keymap.set("i", "'", "''<Esc>i")

-- Move current line up and down
vim.keymap.set("n", "<A-J>", ":m .+1<CR>>==")
vim.keymap.set("n", "<A-K>", ":m .-2<CR>>==")

-- Remove search highlight on Esc
vim.keymap.set("n", "<Esc>", "<cmd>nohlsearch<CR>")

-- Surround selected text with...
vim.keymap.set("v", "<leader>(", "c()<Esc>P")
vim.keymap.set("v", "<leader>[", "c[]<Esc>P")
vim.keymap.set("v", "<leader>{", "c{}<Esc>P")
vim.keymap.set("v", "<leader>'", "c''<Esc>P")
vim.keymap.set("v", '<leader>"', 'c""<Esc>P')

-- syncronizes the system clipboard
-- with nvim's clipboard.
vim.opt.clipboard = "unnamedplus"
vim.opt.scrolloff = 999

vim.opt.virtualedit = "block"

vim.opt.inccommand = "split"

vim.opt.ignorecase = true
vim.opt.smartcase = true

vim.opt.termguicolors = true

vim.g.mapleader = " "

vim.o.winborder = "rounded"

vim.diagnostic.config({
  float = { border = "rounded" },
})

return {
  "vim-test/vim-test",
  dependencies = {
    "preservim/vimux",
  },
  vim.keymap.set("n", "<leader>t", ":TestNearest<CR>", { desc = "Vim Test: Run nearest test" }),
  vim.keymap.set("n", "<leader>T", ":TestFile<CR>", { desc = "Vim Test: Run all tests in file" }),
  vim.keymap.set("n", "<leader>a", ":TestSuite<CR>", { desc = "Vim Test: Run all tests" }),
  vim.keymap.set("n", "<leader>l", ":TestLast<CR>", { desc = "Vim Test: Run last test" }),
  vim.keymap.set("n", "<leader>g", ":TestVisit<CR>", { desc = "Vim Test: Visit" }),
  vim.cmd("let test#strategy = 'vimux'"),
}

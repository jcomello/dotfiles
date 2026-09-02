return {
  {
    "lewis6991/gitsigns.nvim",
    config = function()
      require("gitsigns").setup()

      vim.keymap.set("n", "<Leader>gp", ":Gitsigns preview_hunk<CR>", { desc = "Gitsigns: Preview hunk" })
      vim.keymap.set(
        "n",
        "<Leader>gt",
        ":Gitsigns toggle_current_line_blame<CR>",
        { desc = "Gitsigns: Toggle current line blame" }
      )
      vim.keymap.set("n", "<Leader>gb", ":Gitsigns blame<CR>", { desc = "Gitsigns: Blame" })
      vim.keymap.set("n", "<Leader>ghn", ":Gitsigns next_hunk<CR>", { desc = "Gitsigns: Goes to next hunk" })
      vim.keymap.set("n", "<Leader>ghp", ":Gitsigns prev_hunk<CR>", { desc = "Gitsigns: Goes to prev hunk" })
    end,
  },
  {
    "tpope/vim-fugitive",
  },
}

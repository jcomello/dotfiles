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
    end,
  },
  {
    "tpope/vim-fugitive",
  },
}

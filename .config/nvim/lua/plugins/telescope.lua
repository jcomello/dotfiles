return {
  {
    "nvim-telescope/telescope.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim",
      { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
    },
    config = function()
      local builtin = require("telescope.builtin")
      vim.keymap.set("n", "<leader>ff", builtin.find_files, { desc = "Telescope: Find file" })
      vim.keymap.set("n", "<leader>fc", function()
        builtin.find_files({
          cwd = vim.fn.stdpath("config"),
        }, { desc = "Telescope: Find configuration file" })
      end, {})
      vim.keymap.set("n", "<leader>fg", builtin.live_grep, { desc = "Telescope: Open live grep" })
    end,
  },
  {
    "nvim-telescope/telescope-ui-select.nvim",
    config = function()
      require("telescope").setup({
        pickers = {
          find_files = {
            hidden = true,
          },
        },
        { defaults = { file_ignore_patterns = { ".git" } } },
        extensions = {
          ["ui-select"] = {
            require("telescope.themes").get_dropdown({}),
          },
        },
      })
      require("telescope").load_extension("ui-select")
    end,
  },
}

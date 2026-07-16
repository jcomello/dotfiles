return {
  "serenevoid/kiwi.nvim",
  keys = {
    { "<leader>ww", ':lua require("kiwi").open_wiki_index()<cr>', desc = "Kiwi: Open Wiki index" },
    { "T", ':lua require("kiwi").todo.toggle()<cr>', desc = "Kiwi: Toggle Markdown Task" },
  },
  lazy = true,
}

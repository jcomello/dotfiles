return {
  "ThePrimeagen/harpoon",
  branch = "harpoon2",
  dependencies = { "nvim-lua/plenary.nvim" },
  config = function()
    local harpoon = require("harpoon")
    -- REQUIRED
    harpoon:setup()
    -- REQUIRED

    vim.keymap.set("n", "<leader>cl", function()
      harpoon:list():clear()
    end)
    vim.keymap.set("n", "<leader>add", function()
      harpoon:list():add()
    end)
    vim.keymap.set("n", "<leader>re", function()
      harpoon:list():remove()
    end)
    vim.keymap.set("n", "<leader>e", function()
      harpoon.ui:toggle_quick_menu(harpoon:list())
    end)

    -- Set keymap to change for each buffer by numbers from 1 to 9
    for i = 1, 9, 1 do
      vim.keymap.set("n", "<leader>" .. i, function()
        harpoon:list():select(i)
      end)
    end

    -- Toggle previous & next buffers stored within Harpoon list
    vim.keymap.set("n", "<C-S-P>", function()
      harpoon:list():prev()
    end)
    vim.keymap.set("n", "<C-S-N>", function()
      harpoon:list():next()
    end)
  end,
}

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
    end, { desc = "Harpoon: Clear list" })
    vim.keymap.set("n", "<leader>add", function()
      harpoon:list():add()
    end, { desc = "Harpoon: Add current file to the list" })
    vim.keymap.set("n", "<leader>re", function()
      harpoon:list():remove()
    end, { desc = "Harpoon: Remove current file from the list" })
    vim.keymap.set("n", "<leader>e", function()
      harpoon.ui:toggle_quick_menu(harpoon:list())
    end, { desc = "Harpoon: Toogle quick menu" })

    -- Set keymap to change for each buffer by numbers from 1 to 9
    for i = 1, 9, 1 do
      vim.keymap.set("n", "<leader>" .. i, function()
        harpoon:list():select(i)
      end, { desc = "Harpoon: Change to buffer number " .. i })
    end

    -- Toggle previous & next buffers stored within Harpoon list
    vim.keymap.set("n", "<C-S-P>", function()
      harpoon:list():prev()
    end, { desc = "Harpoon: Toggle previous buffer stored in the list" })
    vim.keymap.set("n", "<C-S-N>", function()
      harpoon:list():next()
    end, { desc = "Harpoon: Toggle next buffer stored in the list" })
  end,
}

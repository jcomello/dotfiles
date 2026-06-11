return {
  "nvim-tree/nvim-web-devicons",
  config = function()
    require("nvim-web-devicons").setup({
      override = {
        yml = {
          icon = "", -- Paste the actual glyph inside the quotes
          color = "#cb171e", -- Classic YAML red tint (or use #6efb2d for Devicon style)
          name = "Yml",
        },
        yaml = {
          icon = "",
          color = "#cb171e",
          name = "Yaml",
        },
      },
    })
  end,
}

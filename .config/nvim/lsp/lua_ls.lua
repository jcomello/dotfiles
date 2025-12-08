local capabilities = require("blink.cmp").get_lsp_capabilities()

return {
  cmd = { "lua-language-server" },
  filetypes = { "lua" },
  root_markers = {
    ".git",
    ".luacheckrc",
    ".luarc.json",
    ".stylua.toml",
    "selene.toml",
    "selene.yml",
    "stylua.toml",
    "lazy-lock.json",
  },
  capabilities = capabilities,
  settings = {
    Lua = {
      diagnostics = {
        disable = { "missing-parameters", "missing-fields" },
        globals = { "vim" },
      },
    },
  },
  single_file_support = true,
  log_level = vim.lsp.protocol.MessageType.Warning,
}

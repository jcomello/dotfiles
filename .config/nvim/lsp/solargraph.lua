local capabilities = require("blink.cmp").get_lsp_capabilities()
return {
  cmd = { "solargraph", "stdio" },
  settings = {
    solargraph = {
      diagnostics = true,
    },
  },
  init_options = { formatting = true },
  filetypes = { "ruby" },
  root_markers = { "Gemfile", ".git" },
  capabilities = capabilities,
}

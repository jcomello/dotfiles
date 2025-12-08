local capabilities = require("blink.cmp").get_lsp_capabilities()

return {
  cmd = { "rubocop", "--lsp" },
  filetypes = { "ruby", "rb" },
  root_markers = { "Gemfile", ".git" },
  capabilities = capabilities,
}

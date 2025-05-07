return {
	"nvimtools/none-ls.nvim",
	dependencies = {
		"nvimtools/none-ls-extras.nvim",
	},
	config = function()
		local null_ls = require("null-ls")

		null_ls.setup({
			sources = {
				require("none-ls.diagnostics.flake8").with({
					extra_args = { "--max-line-length", "120" },
				}),
				null_ls.builtins.formatting.stylua,
				null_ls.builtins.formatting.rubocop,
				null_ls.builtins.formatting.prettier,
				require("none-ls.formatting.ruff"),

				null_ls.builtins.diagnostics.rubocop,
				require("none-ls.diagnostics.ruff"),
			},
		})
		vim.keymap.set("n", "<leader>gf", vim.lsp.buf.format, {})
	end,
}

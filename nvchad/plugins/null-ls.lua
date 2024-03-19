return {
	"nvimtools/none-ls.nvim",
	event = "VeryLazy",
	opts = function(_, opts)
		-- local augroup = vim.api.nvim_create_augroup("LspFormatting", {})
		local null_ls = require("null-ls")
		opts.sources = {
			null_ls.builtins.formatting.prettier,
			null_ls.builtins.formatting.clang_format,
			null_ls.builtins.formatting.gofumpt,
			null_ls.builtins.formatting.goimports_reviser,
			null_ls.builtins.formatting.golines,
			null_ls.builtins.formatting.stylua,
			null_ls.builtins.completion.spell,
			null_ls.builtins.diagnostics.mypy,
			null_ls.builtins.formatting.black,
			null_ls.builtins.formatting.isort,
		}
	end,
}

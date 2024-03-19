return {
	"echasnovski/mini.indentscope",
	version = "*",
	ft = { "go", "lua", "python", "rust", "typescript", "javascript", "json", "yaml", "markdown" },
	config = function()
		require("mini.indentscope").setup({
			symbol = "│",
			options = { try_as_border = true },
		})
	end,
}

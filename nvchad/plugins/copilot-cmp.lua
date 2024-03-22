return {
	"zbirenbaum/copilot-cmp",
	lazy = true,
	after = { "copilot.lua" },
	config = function()
		require("copilot_cmp").setup()
	end,
}

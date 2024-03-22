return {
	"AckslD/swenv.nvim",
	ft = "python",
	swenv = require("swenv").setup({

		get_venvs = function(venvs_path)
			return require("swenv.api").get_venvs(venvs_path)
		end,
		venvs_path = vim.fn.expand("~/venvs"),
		post_set_venv = function()
			vim.cmd("LspRestart")
		end,
	}),
	config = function()
		require("swenv.api").setup()
		require("core.utils").load_mappings("python")
	end,
}

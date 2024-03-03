-- local moveline = require("moveline")

---@type MappingsTable
local M = {}

M.general = {
	n = {
		[";"] = { ":", "enter command mode", opts = { nowait = true } },

		--  format with conform
		["<leader>fm"] = {
			function()
				require("conform").format()
			end,
			"formatting",
		},
		["<leader>sc"] = {
			":setlocal spell! spelllang=en_us<CR>",
		},
		["<leader>z"] = {
			function()
				require("zen-mode").toggle()
			end,
			"Zen Mode",
		},
		["<C-s>"] = { ":Telescope FIles <CR>", "Telescope Files" },

		["<M-k>"] = {
			function()
				require("moveline").up()
			end,
		},
		["<M-j>"] = {
			function()
				require("moveline").down()
			end,
		},

		["<C-.>"] = {
			"<cmd>vertical resize +5<cr>",
			"+Window Resize",
		},
		["<C-,>"] = {
			"<cmd>vertical resize -5<cr>",
			"-Window Resize",
		},

		-- ["<leader>.t0"] = { "<cmd>let g:neovide_transparency=1.0<cr>", "Transparency off" },
	},
	v = {
		[">"] = { ">gv", "indent" },

		["<M-k>"] = {
			function()
				require("moveline").block_up()
			end,
		},
		["<M-j>"] = {
			function()
				require("moveline").block_down()
			end,
		},
	},
}

-- M.abc = {
--   n = {
--     ["<C-s>"] = { ":Telescope Files <CR>", "Telescope Files" }
--   },
--
--   i = {
--     ["jk"] = { "<ESC>", "escape insert mode", opts = { nowait = true } },
--   }
-- }
-- more keybinds!

return M

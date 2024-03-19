return {
	"hrsh7th/nvim-cmp",
	lazy = false,
	dependencies = { "hrsh7th/cmp-emoji" },
	opts = function(_, opts)
		local cmp = require("cmp")
		opts.sources = {
			{ name = "copilot", group_index = 2 },
			{ name = "nvim_lsp", group_index = 2 },
			{ name = "mkdnflow", group_index = 2 },
			{ name = "emoji", group_index = 2 },
			{ name = "luasnip", group_index = 2 },
			{ name = "buffer", group_index = 2 },
			{ name = "nvim_lua", group_index = 2 },
			{ name = "obsidian", group_index = 2 },
			{ name = "path", group_index = 2 },
		}
		opts.mapping = {
			["<C-e>"] = cmp.mapping.close(),
			["<S-Tab>"] = cmp.mapping.select_next_item(),
			["<A-Tab>"] = cmp.mapping.select_prev_item(),
			["<C-CR>"] = cmp.mapping.confirm({ select = true }),
			-- ["<C-Return>"] = cmp.mapping.confirm({ select = true }),
			["<C-y>"] = cmp.mapping.confirm({ select = true }),
		}
	end,
}

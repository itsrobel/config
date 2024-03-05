local overrides = require("custom.configs.overrides")

---@type NvPluginSpec[]
local plugins = {

	-- Override plugin definition options

	-- System Basics
	{
		"neovim/nvim-lspconfig",
		config = function()
			require("plugins.configs.lspconfig")
			require("custom.configs.lspconfig")
		end, -- Override to setup mason-lspconfig
	},
	{
		"williamboman/mason.nvim",
		opts = overrides.mason,
	},

	{
		"nvim-treesitter/nvim-treesitter",
		opts = overrides.treesitter,
	},

	{
		"nvim-tree/nvim-tree.lua",
		opts = overrides.nvimtree,
	},
	{
		"stevearc/conform.nvim",
		--  for users those who want auto-save conform + lazyloading!
		event = "BufWritePre",
		config = function()
			require("custom.configs.conform")
		end,
	},

	-- Install a plugin
	{
		"max397574/better-escape.nvim",
		event = "InsertEnter",
		config = function()
			require("better_escape").setup()
		end,
	},

	{
		"zbirenbaum/copilot.lua",
		event = "InsertEnter",
		lazy = false,
		opts = overrides.copilot,
	},
	{

		"zbirenbaum/copilot-cmp",
		lazy = false,
		after = { "copilot.lua" },
		config = function()
			require("copilot_cmp").setup()
		end,
	},

	{
		"hrsh7th/nvim-cmp",
		lazy = false,
		opts = {
			sources = {
				{ name = "copilot", group_index = 2 },
				{ name = "nvim_lsp", group_index = 2 },
				{ name = "mkdnflow", group_index = 2 },
				{ name = "emoji", group_index = 2 },
				{ name = "luasnip", group_index = 2 },
				{ name = "buffer", group_index = 2 },
				{ name = "nvim_lua", group_index = 2 },
				{ name = "obsidian", group_index = 2 },
				{ name = "path", group_index = 2 },
			},
		},
	},
	{
		"jose-elias-alvarez/null-ls.nvim",
		config = function()
			local null_ls = require("null-ls")

			null_ls.setup({
				null_ls.builtins.formatting.stylua,
				null_ls.builtins.formatting.prettier,
				null_ls.builtins.formatting.eslint_d,
				null_ls.builtins.formatting.black,
				null_ls.builtins.formatting.isort,
				null_ls.builtins.completion.spell,
				null_ls.builtins.diagnostics.shellcheck,
				null_ls.builtins.diagnostics.mypy,
				null_ls.builtins.diagnostics.ruff,
			})
		end,
		lazy = false,
	},
	-- Editor enhancement
	{
		"willothy/moveline.nvim",
		build = "make",
		lazy = false,
	},

	{
		"folke/zen-mode.nvim",
	},

	-- Markdown
	{
		"lukas-reineke/headlines.nvim",
		dependencies = "nvim-treesitter/nvim-treesitter",
		config = true, -- or `opts = {}`
		ft = { "markdown" },
	},
	{
		"iamcco/markdown-preview.nvim",
		cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
		ft = { "markdown" },
		build = function()
			vim.fn["mkdp#util#install"]()
		end,
	},

	{
		"jakewvincent/mkdnflow.nvim",
		ft = "markdown",
		config = function()
			require("mkdnflow").setup()
		end,
	},
	{
		"epwalsh/obsidian.nvim",
		version = "*", -- recommended, use latest release instead of latest commit
		lazy = false,
		ft = "markdown",
		opts = overrides.obsidian,
		dependencies = {
			-- Required.
			"nvim-lua/plenary.nvim",
			"hrsh7th/nvim-cmp",
			"nvim-telescope/telescope.nvim",
			"nvim-treesitter/nvim-treesitter",
			-- see below for full list of optional dependencies 👇
		},
	},
	-- Latex
	{
		"lervag/vimtex",
		ft = "tex",
	},
	{
		"KeitaNakamura/tex-conceal.vim",
		ft = "tex",
	},
	{
		"iurimateus/luasnip-latex-snippets.nvim",
		dependencies = { "L3MON4D3/LuaSnip" },
		config = function()
			require("luasnip-latex-snippets").setup({ use_treesitter = true, allow_on_markdown = true })
			require("luasnip").config.setup({ enable_autosnippets = false })
		end,
		lazy = false,
	},
	-- All NvChad plugins are lazy-loaded by default
	-- For a plugin to be loaded, you will need to set either `ft`, `cmd`, `keys`, `event`, or set `lazy = false`
	-- If you want a plugin to load on startup, add `lazy = false` to a plugin spec, for example
	-- {
	--   "mg979/vim-visual-multi",
	--   lazy = false,
	-- }
}

return plugins

local plugins = {
	-- Override plugin definition options
	-- System Basics
	{ require("custom.plugins.lspconfig") },
	{ require("custom.plugins.mason") },

	{ require("custom.plugins.tree") },
	{ require("custom.plugins.indentscope") },
	-- formatting
	{ require("custom.plugins.conform") },
	-- Debugging
	{ require("custom.plugins.dap-ui") },
	{ require("custom.plugins.dap-mason") },
	{ require("custom.plugins.dap") },
	-- Install a plugin
	{ require("custom.plugins.better-escape") },
	{ require("custom.plugins.copilot") },
	{ require("custom.plugins.copilot-cmp") },
	{ require("custom.plugins.nvim-cmp") },
	{ require("custom.plugins.null-ls") },
	-- Editor enhancement
	{ require("custom.plugins.moveline") },
	{ require("custom.plugins.zen") },
	-- AI
	{ require("custom.plugins.gpt") },
	-- python
	{ require("custom.plugins.venv") },
	-- Golang
	{ require("custom.plugins.dap-go") },
	{ require("custom.plugins.gopher") },
	-- Markdown
	{ require("custom.plugins.headlines") },
	{ require("custom.plugins.markdown-preview") },
	{ require("custom.plugins.mkdnflow") },
	{ require("custom.plugins.obsidian") },
	{ require("custom.plugins.pandoc") },
	-- Latex
	{ require("custom.plugins.vimtex") },
	{ require("custom.plugins.conceal") },
	{ require("custom.plugins.latex-snippets") },
	-- Diabled stuff
	{ require("custom.plugins.colorizer") },

	-- { require("custom.plugins.trouble") },
	-- { "windwp/nvim-autopairs", enabled = false },
	{ "NvChad/nvterm", enabled = false },
}

return plugins

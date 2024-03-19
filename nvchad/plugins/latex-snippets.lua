return {
  "iurimateus/luasnip-latex-snippets.nvim",
  dependencies = { "L3MON4D3/LuaSnip", "neovim/nvim-lspconfig" },
  config = function()
    require("luasnip-latex-snippets").setup({
      use_treesitter = true,
      allow_on_markdown = true,
    })
    require("luasnip").config.setup({ enable_autosnippets = true })
  end,
  ft = { "tex", "markdown" },
}

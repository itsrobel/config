-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here
vim.opt.textwidth = 80
local opts = {
  -- LazyVim will use these options when formatting with the conform.nvim formatter
  event = { "BufReadPre", "BufNewFile" },
  format = {
    lsp_fallback = true,
    timeout_ms = 3000,
    async = false, -- not recommended to change
    quiet = false, -- not recommended to change
  },
  ---@type table<string, conform.FormatterUnit[]>
  formatters_by_ft = {
    fish = { "fish_indent" },
    sh = { "shfmt" },
    md = { "markdownlint" },
    javascript = { "prettier" },
    typescript = { "prettier" },
    javascriptreact = { "prettier" },
    typescriptreact = { "prettier" },
    svelte = { "prettier" },
    css = { "prettier" },
    html = { "prettier" },
    json = { "prettier" },
    yaml = { "prettier" },
    markdown = { "prettier" },
    graphql = { "prettier" },
    lua = { "stylua" },
    python = { "isort", "black" },
  },
  -- The options you set here will be merged with the builtin formatters.
  -- You can also define any custom formatters here.
  ---@type table<string, conform.FormatterConfigOverride|fun(bufnr: integer): nil|conform.FormatterConfigOverride>
  -- formatters = {
  --   prettier = {
  --     args = { "--stdin-filepath", vim.api.nvim_buf_get_name(0) },
  --     rootPatterns = { ".git" },
  --   },
  -- injected = { options = { ignore_errors = true } },
  -- },
}
return opts

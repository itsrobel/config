return {
  "stevearc/conform.nvim",
  --  for users those who want auto-save conform + lazyloading!
  event = "BufWritePre",
  config = function()
    local options = {
      lsp_fallback = true,

      formatters_by_ft = {
        lua = { "stylua" },
        python = { "black" },
        javascript = { "prettier" },
        css = { "prettier" },
        html = { "prettier" },
        markdown = { "prettier" },
        sh = { "shfmt" },
        cpp = { "clang-format" },
      },

      -- adding same formatter for multiple filetypes can look too much work for some
      -- instead of the above code you could just use a loop! the config is just a table after all!

      format_on_save = {
        timeout_ms = 500,
        lsp_fallback = true,
      },
    }

    require("conform").setup(options)
  end,
}

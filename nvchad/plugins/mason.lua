return {
  "williamboman/mason.nvim",
  opts = {
    ensure_installed = {
      -- lua stuff
      "lua-language-server",

      -- java
      "jdtls",
      "java-language-server",
      "stylua",
      "julia-lsp",

      -- python
      "black",
      "mypy",
      "ruff",
      "pyright",
      "isort",
      -- web dev stuff
      "css-lsp",
      "html-lsp",
      "typescript-language-server",
      "deno",
      "prettier",
      -- c/cpp stuff
      "clangd",
      "clang-format",
      "codelldb",
      --go
      "gopls",
      -- shell stuff
      "shfmt",
      -- other
      "impl",
      --markdown
      "ltex-ls",
      "yaml-language-server",
    },
  },
}

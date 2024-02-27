return {
  {
    "mfussenegger/nvim-lint",
    enabled = false,
    opts = {
      linters = {
        markdownlint = {
          args = { "--disable", "MD013", "MD025", "--" },
        },
      },
    },
  },
}

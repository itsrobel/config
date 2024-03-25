return {
  "neovim/nvim-lspconfig",
  opts = {
    servers = {
      pyright = {
        enabled = false,
        -- enabled = vim.g.lazyvim_python_lsp ~= "basedpyright",
      },
      basedpyright = {
        enabled = false,
        -- enabled = vim.g.lazyvim_python_lsp == "basedpyright",
      },
      ruff_lsp = {
        keys = {
          {
            "<leader>co",
            function()
              vim.lsp.buf.code_action({
                apply = true,
                context = {
                  only = { "source.organizeImports" },
                  diagnostics = {},
                },
              })
            end,
            desc = "Organize Imports",
          },
        },
      },
    },
    setup = {
      ruff_lsp = function()
        LazyVim.lsp.on_attach(function(client, _)
          if client.name == "ruff_lsp" then
            -- Disable hover in favor of Pyright
            client.server_capabilities.hoverProvider = true
          end
        end)
      end,
    },
  },
}

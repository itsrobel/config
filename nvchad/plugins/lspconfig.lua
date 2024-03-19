return {
  "neovim/nvim-lspconfig",
  config = function()
    require("plugins.configs.lspconfig")
    local on_attach = require("plugins.configs.lspconfig").on_attach
    local capabilities = require("plugins.configs.lspconfig").capabilities
    local lspconfig = require("lspconfig")

    -- if you just want default config for the servers then put them in a table
    local servers = { "html", "cssls", "tsserver", "clangd", "pyright", "jdtls" }

    for _, lsp in ipairs(servers) do
      lspconfig[lsp].setup({
        on_attach = function(client, bufnr)
          client.resolved_capabilities.document_formatting = false

          on_attach(client, bufnr)
        end,
        capabilities = capabilities,
      })
    end

    lspconfig.gopls.setup({
      on_attach = on_attach,
      capabilities = capabilities,
      cmd = { "gopls" },
      filetype = { "go", "gomod", "gowork", "gotmpl" },
      root_dir = lspconfig.util.root_pattern("go.mod", ".git", "go.work"),
      settings = {
        gopls = {
          completeUnimported = true,
          usePlaceholders = true,
          analyses = {
            unusedparams = true,
            shadow = true,
          },
          staticcheck = true,
        },
      },
    })
  end, -- Override to setup mason-lspconfig
}

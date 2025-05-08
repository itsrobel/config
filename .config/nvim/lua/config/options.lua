-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

-- vim.g.lazyvim__python_lsp = "basedpyright"
--

vim.opt.clipboard = "unnamedplus"
vim.g.python3_host_prog = "/home/stef/config/.config/nvim/nvim-python/bin/python"
vim.g.lazyvim_python_lsp = "pyright"
vim.g.lazyvim_python_ruff = "ruff"
vim.g.loaded_perl_provider = 0
vim.o.statuscolumn = "%!v:lua.require'snacks.statuscolumn'.get()"
vim.opt.statuscolumn = [[%!v:lua.require'snacks.statuscolumn'.get()]]
vim.filetype.add({
  extension = {
    mdx = "mdx",
  },
})

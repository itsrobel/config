local config = function()
    local cmp = require("cmp")
    local kind_icons = {
        -- https://github.com/hrsh7th/nvim-cmp/wiki/Menu-Appearance#basic-customisations
        Text = " ",
        Method = "󰆧",
        Function = "ƒ ",
        Constructor = " ",
        Field = "󰜢 ",
        Variable = " ",
        Constant = " ",
        Class = " ",
        Interface = "󰜰 ",
        Struct = " ",
        Enum = "了 ",
        EnumMember = " ",
        Module = "",
        Property = " ",
        Unit = " ",
        Value = "󰎠 ",
        Keyword = "󰌆 ",
        Snippet = " ",
        File = " ",
        Folder = " ",
        Color = " ",
    }
    cmp.setup({
        sources = {
            { name = "copilot" },
            { name = "nvim_lsp" },
            { name = "mkdnflow" },
            { name = "emoji" },
            { name = "luasnip" },
            { name = "buffer" },
            { name = "nvim_lua" },
            { name = "obsidian" },
            { name = "path" },
        },
        mapping = {
            ["<C-e>"] = cmp.mapping.close(),
            ["<S-Tab>"] = cmp.mapping.select_next_item(),
            ["<S-CR>"] = cmp.mapping.confirm({ select = true }),
        },
        formatting = {
            format = function(entry, vim_item)
                -- Kind icons
                vim_item.kind = string.format("%s %s", kind_icons[vim_item.kind], vim_item.kind) -- This concatonates the icons with the name of the item kind
                -- Source
                vim_item.menu = ({
                    buffer = "[Buffer]",
                    nvim_lsp = "[LSP]",
                    luasnip = "[LuaSnip]",
                    nvim_lua = "[NvimAPI]",
                    path = "[Path]",
                })[entry.source.name]
                return vim_item
            end,
        },
    })
end
return config

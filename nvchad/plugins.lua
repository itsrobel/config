local overrides = require("custom.configs.overrides")
local plugins = {
    -- Override plugin definition options

    -- System Basics
    {
        "neovim/nvim-lspconfig",
        config = function()
            require("plugins.configs.lspconfig")
            require("custom.configs.lspconfig")
        end, -- Override to setup mason-lspconfig
    },
    {
        "williamboman/mason.nvim",
        opts = overrides.mason,
    },

    {
        "nvim-treesitter/nvim-treesitter",
        opts = overrides.treesitter,
    },

    {
        "nvim-tree/nvim-tree.lua",
        opts = overrides.nvimtree,
    },
    -- Debugging
    {
        "rcarriga/nvim-dap-ui",
        event = "VeryLazy",
        dependencies = "mfussenegger/nvim-dap",
        config = function()
            local dap = require("dap")
            local dapui = require("dapui")
            dapui.setup()
            dap.listeners.after.event_initialized["dapui_config"] = function()
                dapui.open()
            end
            dap.listeners.before.event_terminated["dapui_config"] = function()
                dapui.close()
            end
            dap.listeners.before.event_exited["dapui_config"] = function()
                dapui.close()
            end
        end,
    },
    {
        "jay-babu/mason-nvim-dap.nvim",
        event = "VeryLazy",
        dependencies = {
            "williamboman/mason.nvim",
            "mfussenegger/nvim-dap",
        },
        opts = {
            handlers = {},
        },
    },
    {
        "mfussenegger/nvim-dap",
        config = function(_, _)
            require("core.utils").load_mappings("dap")
        end,
    },
    {
        "stevearc/conform.nvim",
        --  for users those who want auto-save conform + lazyloading!
        event = "BufWritePre",
        config = function()
            require("custom.configs.conform")
        end,
    },

    -- Install a plugin
    {
        "max397574/better-escape.nvim",
        event = "InsertEnter",
        config = function()
            require("better_escape").setup()
        end,
    },

    {
        "zbirenbaum/copilot.lua",
        event = "InsertEnter",
        lazy = false,
        opts = overrides.copilot,
    },
    {

        "zbirenbaum/copilot-cmp",
        lazy = false,
        after = { "copilot.lua" },
        config = function()
            require("copilot_cmp").setup()
        end,
    },
    {
        "hrsh7th/nvim-cmp",
        lazy = false,
        dependencies = { "hrsh7th/cmp-emoji" },
        opts = function(_, opts)
            local cmp = require("cmp")
            opts.sources = {
                { name = "copilot",  group_index = 2 },
                { name = "nvim_lsp", group_index = 2 },
                { name = "mkdnflow", group_index = 2 },
                { name = "emoji",    group_index = 2 },
                { name = "luasnip",  group_index = 2 },
                { name = "buffer",   group_index = 2 },
                { name = "nvim_lua", group_index = 2 },
                { name = "obsidian", group_index = 2 },
                { name = "path",     group_index = 2 },
            }
            opts.mapping = {
                ["<C-e>"] = cmp.mapping.close(),
                ["<S-Tab>"] = cmp.mapping.select_next_item(),
                ["<S-CR>"] = cmp.mapping.confirm({ select = true }),
            }
        end,
    },
    {
        "jose-elias-alvarez/null-ls.nvim",
        event = "VeryLazy",
        opts = function()
            return require("custom.configs.null-ls")
        end,
        -- lazy = false,
    },
    -- Editor enhancement
    {
        "willothy/moveline.nvim",
        build = "make",
        lazy = false,
    },

    {
        "folke/zen-mode.nvim",
    },

    -- AI
    {
        "jackMort/ChatGPT.nvim",
        event = "VeryLazy",
        config = function()
            local home = vim.fn.expand("$HOME")
            require("chatgpt").setup({
                api_key_cmd = "cat " .. home .. "/config/keychain/decrypted/neogpt.txt",
            })
        end,
        dependencies = {
            "MunifTanjim/nui.nvim",
            "nvim-lua/plenary.nvim",
            "folke/trouble.nvim",
            "nvim-telescope/telescope.nvim",
        },
    },
    -- Golang
    {
        "dreamsofcode-io/nvim-dap-go",
        ft = "go",
        dependencies = "mfussenegger/nvim-dap",
        config = function(_, opts)
            require("dap-go").setup(opts)
            require("core.utils").load_mappings("dap_go")
        end,
    },
    {
        "olexsmir/gopher.nvim",
        ft = "go",
        config = function(_, opts)
            require("gopher").setup(opts)
            require("core.utils").load_mappings("gopher")
        end,
        bulid = function()
            vim.cmd([[silent! GoInstallDeps]])
        end,
    },

    -- Markdown
    {
        "lukas-reineke/headlines.nvim",
        dependencies = "nvim-treesitter/nvim-treesitter",
        config = true, -- or `opts = {}`
        ft = { "markdown" },
    },
    {
        "iamcco/markdown-preview.nvim",
        cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
        ft = { "markdown" },
        build = function()
            vim.fn["mkdp#util#install"]()
        end,
    },

    {
        "jakewvincent/mkdnflow.nvim",
        ft = "markdown",
        config = function()
            require("mkdnflow").setup()
        end,
    },
    {
        "epwalsh/obsidian.nvim",
        version = "*", -- recommended, use latest release instead of latest commit
        lazy = false,
        ft = "markdown",
        opts = overrides.obsidian,
        dependencies = {
            -- Required.
            "nvim-lua/plenary.nvim",
            "hrsh7th/nvim-cmp",
            "nvim-telescope/telescope.nvim",
            "nvim-treesitter/nvim-treesitter",
            -- see below for full list of optional dependencies 👇
        },
    },
    {
        "jghauser/auto-pandoc.nvim",
        dependencies = { "nvim-lua/plenary.nvim" },
        ft = "markdown",
    },

    -- Latex
    {
        "lervag/vimtex",
        ft = "tex",
    },
    {
        "KeitaNakamura/tex-conceal.vim",
        ft = "tex",
    },
    {
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
    },
    {
        "NvChad/nvim-colorizer.lua",
        opts = {
            user_default_options = {
                names = false,
            },
        },
    },
    { "windwp/nvim-autopairs", enabled = false },
}

return plugins

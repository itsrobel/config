-- local moveline = require("moveline")

---@type MappingsTable
local M = {}

M.general = {
    n = {
        [";"] = { ":", "enter command mode", opts = { nowait = true } },

        --  format with conform
        ["<leader>fm"] = {
            function()
                require("conform").format()
            end,
            "formatting",
        },
        ["<leader>sc"] = {
            ":setlocal spell! spelllang=en_us<CR>",
        },
        ["<leader>z"] = {
            function()
                require("zen-mode").toggle()
            end,
            "Zen Mode",
        },
        ["<leader>ct"] = {
            ":ColorizerToggle<CR>",
            "Toggle Colorizer",
        },
        ["<C-s>"] = { ":Telescope find_files <CR>", "Telescope Files" },

        ["<M-k>"] = {
            function()
                require("moveline").up()
            end,
        },
        ["<M-j>"] = {
            function()
                require("moveline").down()
            end,
        },

        ["<C-.>"] = {
            ":vertical resize +5<cr>",
            "+Window Resize",
        },
        ["<C-,>"] = {
            ":vertical resize -5<cr>",
            "-Window Resize",
        },

        -- ["<leader>.t0"] = { ":let g:neovide_transparency=1.0<cr>", "Transparency off" },
    },
    v = {
        [">"] = { ">gv", "indent" },

        ["<M-k>"] = {
            function()
                require("moveline").block_up()
            end,
        },
        ["<M-j>"] = {
            function()
                require("moveline").block_down()
            end,
        },
    },
}
M.dap = {
    plugin = true,
    n = {
        ["<leader>db"] = {
            ": DapToggleBreakpoint<CR>",
            "Add breakpoint at line",
        },
        ["<leader>dc"] = {
            ": DapContinue<CR>",
            "Continue",
        },
        -- ["<leader>di"] = {
        --     ": DapStepInto<CR>",
        --     "Step Into",
        -- },
        -- ["<leader>do"] = {
        --     ": DapStepOut<CR>",
        --     "Step Out",
        -- },
        ["<leader>dt"] = {
            ": DapTerminate<CR>",
            "Stop",
        },
        ["<leader>dus"] = {
            function()
                local widgets = require("dap.ui.widgets")
                local siderbar = widgets.sidebar(widgets.scopes)
                siderbar.open()
            end,
        },
    },
}

M.dap_go = {
    plugin = true,
    n = {
        ["<leader>dgt"] = {
            function()
                require("dap-go").debug_test()
            end,
            "debug go test",
        },
        ["<leader>dgl"] = {
            function()
                require("dap-go").debug_last()
            end,
            "Debug last go test",
        },
    },
}
M.gopher = {
    plugin = true,
    n = {
        ["<leader>gsj"] = {
            ": GoTagAdd json <CR>",
        },
        ["<leader>gsy"] = {
            ": GoTagAdd yaml <CR>",
        },
    },
}

-- M.abc = {
--   n = {
--     ["<C-s>"] = { ":Telescope Files <CR>", "Telescope Files" }
--   },
--
--   i = {
--     ["jk"] = { "<ESC>", "escape insert mode", opts = { nowait = true } },
--   }
-- }
-- more keybinds!

return M

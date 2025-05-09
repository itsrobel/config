return {
  "mrjones2014/smart-splits.nvim",
  event = "VeryLazy",
  config = function()
    local smart_splits = require("smart-splits")

    -- Initialize smart-splits
    smart_splits.setup({
      -- Recommended settings
      ignored_filetypes = {
        "nofile",
        "quickfix",
        "qf",
        "prompt",
      },
      ignored_buftypes = { "NvimTree" },
    })

    -- Load WhichKey if it exists
    local status_ok, which_key = pcall(require, "which-key")
    if not status_ok then
      return
    end

    -- Register all keymaps with WhichKey
    which_key.register({
      -- Window navigation
      ["<C-h>"] = {
        function()
          smart_splits.move_cursor_left()
        end,
        "Move to left window",
      },
      ["<C-j>"] = {
        function()
          smart_splits.move_cursor_down()
        end,
        "Move to bottom window",
      },
      ["<C-k>"] = {
        function()
          smart_splits.move_cursor_up()
        end,
        "Move to top window",
      },
      ["<C-l>"] = {
        function()
          smart_splits.move_cursor_right()
        end,
        "Move to right window",
      },

      -- Window resizing
      ["<M-h>"] = {
        function()
          smart_splits.resize_left(2)
        end,
        "Resize window left",
      },
      ["<M-j>"] = {
        function()
          smart_splits.resize_down(2)
        end,
        "Resize window down",
      },
      ["<M-k>"] = {
        function()
          smart_splits.resize_up(2)
        end,
        "Resize window up",
      },
      ["<M-l>"] = {
        function()
          smart_splits.resize_right(2)
        end,
        "Resize window right",
      },

      -- Previous window
      ["<C-\\>"] = { "<C-w>p", "Jump to previous window" },

      -- Window swapping
      ["<leader>"] = {
        ["<C-h>"] = {
          function()
            smart_splits.swap_buf_left()
          end,
          "Swap window left",
        },
        ["<C-j>"] = {
          function()
            smart_splits.swap_buf_down()
          end,
          "Swap window down",
        },
        ["<C-k>"] = {
          function()
            smart_splits.swap_buf_up()
          end,
          "Swap window up",
        },
        ["<C-l>"] = {
          function()
            smart_splits.swap_buf_right()
          end,
          "Swap window right",
        },
      },
    })
  end,
  dependencies = {
    "folke/which-key.nvim",
  },
}

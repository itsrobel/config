-- return {}
return {
  "nvimdev/dashboard-nvim",
  opts = function()
    local logo = [[
                 ▄ ▄
             ▄   ▄▄▄     ▄ ▄▄▄ ▄ ▄
             █ ▄ █▄█ ▄▄▄ █ █▄█ █ █
          ▄▄ █▄█▄▄▄█ █▄█▄█▄▄█▄▄█ █
        ▄ █▄▄█ ▄ ▄▄ ▄█ ▄▄▄▄▄▄▄▄▄▄▄▄▄▄
        █▄▄▄▄ ▄▄▄ █ ▄ ▄▄▄ ▄ ▄▄▄ ▄ ▄ █ ▄
      ▄ █ █▄█ █▄█ █ █ █▄█ █ █▄█ ▄▄▄ █ █
      █▄█ ▄ █▄▄█▄▄█ █ ▄▄█ █ ▄ █ █▄█▄█ █
          █▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄█ █▄█▄▄▄█
      ]]
    logo = string.rep("\n", 8) .. logo .. "\n\n"
    -- local builtin = require("telescope.builtin")
    --
    local opts = {
      theme = "doom",
      hide = {
        -- this is taken care of by lualine
        -- enabling this messes up the actual laststatus setting after loading a file
        statusline = false,
      },
      config = {
        header = vim.split(logo, "\n"),
        -- -- stylua: ignore
        center = {
          {
            action = LazyVim.pick("files", { root = false }),
            desc = " Find file",
            icon = " ",
            key = "ff",
          },
          { action = "ene | startinsert", desc = " New file", icon = " ", key = "dn" },
          { action = "Lazy", desc = " Lazy", icon = "󰒲 ", key = "dl" },
          { action = "qa", desc = " Quit", icon = " ", key = "dq" },
        },
        footer = function()
          local stats = require("lazy").stats()
          local ms = (math.floor(stats.startuptime * 100 + 0.5) / 100)
          return { "  Neovim loaded " .. stats.loaded .. "/" .. stats.count .. " plugins in " .. ms .. "ms" }
        end,
      },
    }

    if vim.o.filetype == "lazy" then
      vim.cmd.close()
      vim.api.nvim_create_autocmd("User", {
        pattern = "DashboardLoaded",
        callback = function()
          require("lazy").show()
        end,
      })
    end

    return opts
  end,
}

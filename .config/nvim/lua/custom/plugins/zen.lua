return {
  'folke/zen-mode.nvim',
  keys = {
    {
      '<leader>cz',
      function()
        require('zen-mode').toggle()
      end,
      desc = 'ZenMode',
    },
  },
}

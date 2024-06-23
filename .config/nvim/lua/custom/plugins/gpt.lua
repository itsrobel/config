return {
  'jackMort/ChatGPT.nvim',
  event = 'VeryLazy',
  dependencies = {
    'MunifTanjim/nui.nvim',
    'nvim-lua/plenary.nvim',
    'folke/trouble.nvim',
    'nvim-telescope/telescope.nvim',
  },

  config = function()
    require('chatgpt').setup { api_key_cmd = 'pass API/openai/nvim', api_model = 'gpt-3.5-turbo', popup_input = {
      submit = '<CR>',
    } }
  end,
}

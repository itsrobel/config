-- which loads which-key before all the UI elements are loaded. Events can be
-- normal autocommands events (`:help autocmd-events`).
--
-- Then, because we use the `config` key, the configuration only runs
-- after the plugin has been loaded:
--  config = function() ... end
-- return { -- Useful plugin to show you pending keybinds.
--   'folke/which-key.nvim',
--   event = 'VimEnter', -- Sets the loading event to 'VimEnter'
--   config = function() -- This is the function that runs, AFTER loading
--     require('which-key').setup()
--     -- Document existing key chains
--
--     require('which-key').register {
--       ['<leader>c'] = { name = '[C]ode', _ = 'which_key_ignore' },
--       ['<leader>d'] = { name = '[D]ocument', _ = 'which_key_ignore' },
--       ['<leader>r'] = { name = '[R]ename', _ = 'which_key_ignore' },
--       ['<leader>s'] = { name = '[S]earch', _ = 'which_key_ignore' },
--       ['<leader>w'] = { name = '[W]orkspace', _ = 'which_key_ignore' },
--       ['<leader>t'] = { name = '[T]oggle', _ = 'which_key_ignore' },
--       ['<leader>x'] = { name = 'Trouble fi[X] ', _ = 'which_key_ignore' },
--       ['<leader>g'] = { name = '[G]it Hunk', _ = 'which_key_ignore' },
--       ['<leader>h'] = { name = '[H]arpoon', _ = 'which_key_ignore' },
--       -- v = {
--       --   name = 'ChatGPT',
--       --   c = { '<cmd>ChatGPT<CR>', 'ChatGPT' },
--       --   e = { '<cmd>ChatGPTEditWithInstruction<CR>', 'Edit with instruction', mode = { 'n', 'v' } },
--       --   g = { '<cmd>ChatGPTRun grammar_correction<CR>', 'Grammar Correction', mode = { 'n', 'v' } },
--       --   t = { '<cmd>ChatGPTRun translate<CR>', 'Translate', mode = { 'n', 'v' } },
--       --   k = { '<cmd>ChatGPTRun keywords<CR>', 'Keywords', mode = { 'n', 'v' } },
--       --   d = { '<cmd>ChatGPTRun docstring<CR>', 'Docstring', mode = { 'n', 'v' } },
--       --   a = { '<cmd>ChatGPTRun add_tests<CR>', 'Add Tests', mode = { 'n', 'v' } },
--       --   o = { '<cmd>ChatGPTRun optimize_code<CR>', 'Optimize Code', mode = { 'n', 'v' } },
--       --   s = { '<cmd>ChatGPTRun summarize<CR>', 'Summarize', mode = { 'n', 'v' } },
--       --   f = { '<cmd>ChatGPTRun fix_bugs<CR>', 'Fix Bugs', mode = { 'n', 'v' } },
--       --   x = { '<cmd>ChatGPTRun explain_code<CR>', 'Explain Code', mode = { 'n', 'v' } },
--       --   r = { '<cmd>ChatGPTRun roxygen_edit<CR>', 'Roxygen Edit', mode = { 'n', 'v' } },
--       --   l = { '<cmd>ChatGPTRun code_readability_analysis<CR>', 'Code Readability Analysis', mode = { 'n', 'v' } },
--       -- },
--     }
--     -- visual mode
--     require('which-key').register({
--       ['<leader>g'] = { '[G]it Hunk' },
--     }, { mode = 'v' })
--   end,
-- }

return {

  'folke/which-key.nvim',
  event = 'VimEnter', -- Sets the loading event to 'VimEnter'
  config = function() -- This is the function that runs, AFTER loading
    local wk = require 'which-key'
    wk.add {
      -- { '<leader>f', group = 'file' }, -- group
      -- { '<leader>ff', '<cmd>Telescope find_files<cr>', desc = 'Find File', mode = 'n' },
      {
        '<leader>fb',
        function()
          print 'hello'
        end,
        desc = 'Foobar',
      },
      { '<leader>fn', desc = 'New File' },
      { '<leader>f1', hidden = true }, -- hide this keymap
      { '<leader>w', proxy = '<c-w>', group = 'windows' }, -- proxy to window mappings
      { '<leader>h', group = '[H]arpoon' },
      { '<leader>c', group = '[C]ode' },
      { '<leader>d', group = '[D]ocument' },
      { '<leader>r', group = '[R]ename' },
      { '<leader>s', group = '[S]earch' },
      { '<leader>w', group = '[W]orkspace' },
      { '<leader>t', group = '[T]oggle' },
      { '<leader>x', group = 'Trouble fi[X] ' },
      { '<leader>g', group = '[G]it Hunk' },
      {
        '<leader>b',
        group = 'buffers',
        expand = function()
          return require('which-key.extras').expand.buf()
        end,
      },
      {
        -- Nested mappings are allowed and can be added in any order
        -- Most attributes can be inherited or overridden on any level
        -- There's no limit to the depth of nesting
        mode = { 'n', 'v' }, -- NORMAL and VISUAL mode
        { '<leader>q', '<cmd>q<cr>', desc = 'Quit' }, -- no need to specify mode since it's inherited
        { '<leader>w', '<cmd>w<cr>', desc = 'Write' },
      },
    }
  end,
}

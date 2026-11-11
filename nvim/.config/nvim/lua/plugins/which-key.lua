return {
  'folke/which-key.nvim',
  event = 'VeryLazy',
  opts = {
    delay = 300,
    -- Manual triggers (no "<auto>") so a lone <leader> doesn't open the popup
    triggers = {
      { 'g', mode = { 'n', 'x' } },
      { 'z', mode = { 'n', 'x' } },
      { '[', mode = 'n' },
      { ']', mode = 'n' },
      { '<c-w>', mode = 'n' },
      { '"', mode = { 'n', 'x' } },
      { '`', mode = { 'n', 'x' } },
    },
    -- Hide the <leader>1-9 bufferline mappings from the popup
    filter = function(mapping)
      return mapping.desc ~= 'Go to Buffer'
    end,
    spec = {
      { '<leader>m', group = 'Minimap' },
      { '<leader>g', group = 'LSP goto' },
      { '<leader>c', group = 'Code' },
      { '<leader>d', group = 'Document' },
      { '<leader>r', group = 'Rename' },
      { '<leader>w', group = 'Workspace' },
    },
  },
  keys = {
    {
      '<leader>?',
      function()
        require('which-key').show { keys = '<leader>' }
      end,
      desc = 'Show leader keymaps (which-key)',
    },
  },
}

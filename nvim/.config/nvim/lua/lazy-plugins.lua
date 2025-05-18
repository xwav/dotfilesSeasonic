require('lazy').setup({
  'NMAC427/guess-indent.nvim', -- Detect tabstop and shiftwidth automatically

  require 'plugins.gitsigns',
  require 'plugins.telescope',
  require 'plugins.lsp',
  require 'plugins.autocompletion',
  require 'plugins.dropbar',
  require 'plugins.lualine',
  -- require 'plugins.conform',
  -- require 'plugins.blink-cmp',
  require 'plugins.mini',
  require 'plugins.treesitter',

  require 'plugins.debug',
  require 'plugins.indent_line',
 -- require 'plugins.lint',
  require 'plugins.autopairs',
  require 'plugins.comment',
  require 'plugins.alpha',
  require 'plugins.bufferline',
  require 'plugins.database',
  require 'plugins.misc',
  require 'plugins.toggleterm',
  require 'plugins.render-markdown',

}, {
  ui = {
    -- If you are using a Nerd Font: set icons to an empty table which will use the
    -- default lazy.nvim defined Nerd Font icons, otherwise define a unicode icons table
    icons = vim.g.have_nerd_font and {} or {
      cmd = '⌘',
      config = '🛠',
      event = '📅',
      ft = '📂',
      init = '⚙',
      keys = '🗝',
      plugin = '🔌',
      runtime = '💻',
      require = '🌙',
      source = '📄',
      start = '🚀',
      task = '📌',
      lazy = '💤 ',
    },
  },
})

-- vim: ts=2 sts=2 sw=2 et

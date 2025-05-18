-- Set <space> as the leader key
-- See `:help mapleader`
vim.cmd.colorscheme("retrobox")
-- vim.cmd.colorscheme("peachpuff")

-- Set to true if you have a Nerd Font installed and selected in the terminal
vim.g.have_nerd_font = false

-- [[ Setting options ]]
require 'options'
require 'keymaps'
require 'lazy-bootstrap'
require 'lazy-plugins'

-- The line beneath this is called `modeline`. See `:help modeline`
-- vim: ts=2 sts=2 sw=2 et

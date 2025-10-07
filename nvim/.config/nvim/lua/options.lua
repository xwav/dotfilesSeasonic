-- [[ Setting options ]]
-- See `:help vim.o`
vim.cmd.colorscheme("retrobox")
-- vim.o.background = "light"
vim.o.background = "dark"

vim.o.number = true
vim.o.relativenumber = true
vim.o.mouse = 'a'
vim.o.showmode = false

-- Sync clipboard between OS and Neovim.
--  Schedule the setting after `UiEnter` because it can increase startup-time.
--  Remove this option if you want your OS clipboard to remain independent.
--  See `:help 'clipboard'`
vim.schedule(function()
  vim.o.clipboard = 'unnamedplus'
end)

vim.o.breakindent = true
vim.o.undofile = true
-- Case-insensitive searching UNLESS \C or one or more capital letters in the search term
vim.o.ignorecase = true
vim.o.smartcase = true
vim.o.signcolumn = 'yes'
vim.o.updatetime = 250
vim.o.timeoutlen = 300
vim.o.shiftwidth = 4 -- the number of spaces inserted for each indentation
vim.o.tabstop = 4 -- insert n spaces for a tab
vim.o.softtabstop = 4 -- Number of spaces that a tab counts for while performing editing operations
vim.o.expandtab = true -- convert tabs to spaces
vim.o.whichwrap = 'bs<>[]hl' -- which "horizontal" keys are allowed to travel to prev/next line
vim.o.wrap = false -- display lines as one long line
vim.o.linebreak = true -- companion to wrap don't split words

-- Configure how new splits should be opened
vim.o.splitright = true
vim.o.splitbelow = true

vim.o.list = true
vim.opt.listchars = { tab = '» ', trail = '·', nbsp = '␣' }
-- Preview substitutions live, as you type!
vim.o.inccommand = 'split'
vim.o.cursorline = true
-- Minimal number of screen lines to keep above and below the cursor.
vim.o.scrolloff = 10
vim.o.confirm = true



-- vim: ts=2 sts=2 sw=2 et

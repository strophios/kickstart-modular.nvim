-- [[ Setting options ]]
-- See `:help vim.o`
-- NOTE: You can change these options as you wish!
--  For more options, you can see `:help option-list`

-- Proper colors (I think true was the default too)
vim.opt.termguicolors = true

-- Make line numbers default
vim.o.number = true
-- You can also add relative line numbers, to help with jumping.
--  Experiment for yourself to see if you like it!
vim.o.relativenumber = true

-- Enable mouse mode, can be useful for resizing splits for example!
vim.o.mouse = 'a'

-- Don't show the mode, since it's already in the status line
vim.o.showmode = false

-- Sync clipboard between OS and Neovim.
--  Schedule the setting after `UiEnter` because it can increase startup-time.
--  Remove this option if you want your OS clipboard to remain independent.
--  See `:help 'clipboard'`
vim.schedule(function()
  vim.o.clipboard = 'unnamedplus'
end)

-- Enable break indent
vim.o.breakindent = true
vim.o.smartindent = true -- NOTE: Currently testing.

-- Set default tab width and space behaviors
-- Note that these will be overridden in individual buffers by guess-indent,
-- but setting reasonable defaults here means that newly created files will
-- start with sensible defaults.
local tabsize = 2
vim.o.expandtab = true
vim.o.shiftwidth = tabsize
vim.o.tabstop = tabsize

-- Ensure that wrapping lines don't split words
vim.o.linebreak = true

-- Save undo history
vim.o.undofile = true

-- Case-insensitive searching UNLESS \C or one or more capital letters in the search term
vim.o.ignorecase = true
vim.o.smartcase = true

-- Keep signcolumn on by default
vim.o.signcolumn = 'yes'

-- Decrease update time
vim.o.updatetime = 250

-- Decrease mapped sequence wait time
vim.o.timeoutlen = 300

-- How to show autocomplete menu
vim.opt.completeopt = 'menuone,noinsert,popup' --NOTE: Currently testing, previously "menu,popup"

-- Configure how new splits should be opened
vim.o.splitright = true
vim.o.splitbelow = true
--  See `:help 'list'`
--  and `:help 'listchars'`
--
--  Notice listchars is set using `vim.opt` instead of `vim.o`.
--  It is very similar to `vim.o` but offers an interface for conveniently interacting with tables.
--   See `:help lua-options`
--   and `:help lua-options-guide`
vim.o.list = true
vim.opt.listchars = { tab = '» ', trail = '·', nbsp = '␣' }

-- Preview substitutions live, as you type!
vim.o.inccommand = 'split'

-- Show which line your cursor is on
vim.o.cursorline = true

-- Minimal number of screen lines to keep above and below the cursor.
vim.o.scrolloff = 10

-- if performing an operation that would fail due to unsaved changes in the buffer (like `:q`),
-- instead raise a dialog asking if you wish to save the current file(s)
-- See `:help 'confirm'`
vim.o.confirm = true

-- Setup options for displaying diagnostics
-- Desired behavior is to show diagnostic messages on virtual lines (not as virtual text on the same line),
-- but only on the line where the cursor currently is. So we can use the signs column on the left to see where
-- errors and warnings are, but only see the details (and therefore have them cluttering up the document) when
-- I'm on the line to look at them.
vim.diagnostic.config { virtual_lines = { current_line = true } } -- I *think* this does what I want, but it's possible it's not quite right.

-- NOTE: Potential alternative would be to keep showing all diagnostics in your immediate surroundings, so if
-- you have to navigate a few lines away to fix something, the message doesn't go away while you do it. Could
-- conceivably do this using Treesitter? Like, display diagnostics within the immediate scope or something.

-- vim: ts=2 sts=2 sw=2 et

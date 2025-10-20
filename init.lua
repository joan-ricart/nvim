-- :help options
vim.opt.clipboard = "unnamedplus"
vim.opt.relativenumber = true

vim.opt.shiftwidth = 2
vim.opt.tabstop = 2

vim.opt.termguicolors = true

-- Clear highlights on search when pressing <Esc> in normal mode
vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>')

vim.opt.winborder = 'solid' -- single, double, rounded, solid, shadow

-- Show diagnostic inline
vim.diagnostic.config({ virtual_text = true })

-- Set colorscheme
vim.cmd('colorscheme wildcharm')

-- Enable LSP servers
vim.lsp.enable({'luals', 'gopls'})

require("config.lazy")
require("config.lsp-settings")

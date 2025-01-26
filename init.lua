vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- :help options
vim.opt.clipboard = "unnamedplus"
vim.opt.relativenumber = true

vim.opt.shiftwidth = 2
vim.opt.tabstop = 2

vim.opt.termguicolors = true

-- Clear highlights on search when pressing <Esc> in normal mode
--  See `:help hlsearch`
vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>')

require("config.lazy")

vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- :help options
vim.opt.clipboard = "unnamedplus"
vim.opt.relativenumber = true

vim.opt.shiftwidth = 2
vim.opt.tabstop = 2

vim.opt.termguicolors = true

require("config.lazy")

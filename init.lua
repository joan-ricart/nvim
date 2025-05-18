vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- :help options
vim.opt.clipboard = "unnamedplus"
vim.opt.relativenumber = true

vim.opt.shiftwidth = 2
vim.opt.tabstop = 2

vim.opt.termguicolors = true

-- Disable showmode as lualine does this
vim.opt.showmode = false

-- Clear highlights on search when pressing <Esc> in normal mode
vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>')

vim.opt.winborder = 'solid' -- single, double, rounded, solid, shadow

-- Show diagnostic inline
vim.diagnostic.config({ virtual_text = true })

-- Enable LSP servers
vim.lsp.enable('luals')
vim.lsp.enable('gopls')

-- USING BLINK.CMP FOR NOW.
-- Enable completion
-- vim.opt.completeopt = "fuzzy,menu,noinsert"
-- vim.api.nvim_create_autocmd('LspAttach', {
-- 	callback = function(ev)
-- 		local client = vim.lsp.get_client_by_id(ev.data.client_id)
-- 		if client ~= nil and client:supports_method('textDocument/completion') then
-- 			vim.lsp.completion.enable(true, client.id, ev.buf, { autotrigger = true })
-- 		end
-- 	end
-- })

require("config.lazy")

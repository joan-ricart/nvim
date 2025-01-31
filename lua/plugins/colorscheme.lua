local M = {
	"drewxs/ash.nvim",
	lazy = false,
	priority = 1000,
	config = function()
		vim.cmd.colorscheme('ash')
	end
}

return { M }

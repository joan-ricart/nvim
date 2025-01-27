local M = {
	"sainnhe/everforest",
	lazy = false,
	priority = 1000,
	config = function()
		-- Optionally configure and load the colorscheme
		-- directly inside the plugin declaration.
		vim.g.everforest_enable_italic = true
		vim.g.everforest_background = 'hard'
		vim.g.everforest_float_style = 'dim'
		vim.cmd.colorscheme('everforest')
	end
}

return { M }

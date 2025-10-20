local M = {
	"nvim-treesitter/nvim-treesitter",
	build = ":TSUpdate",
	config = function ()
		local configs = require("nvim-treesitter.configs")

		configs.setup({
			ensure_installed = { "c", "lua", "luadoc", "vim", "vimdoc", "query", "elixir", "heex", "javascript", "html", "go"},
			auto_install = false,
			highlight = {
				enable = true
			},
			indent = {
				enable = true
			},
		})
	end
}

return { M }

return {
	{
		'nvim-lualine/lualine.nvim',
		dependencies = { 'nvim-tree/nvim-web-devicons', "ficcdaf/ashen.nvim", },
		opts = function()
			local ashen = require("ashen.plugins.lualine").lualine_opts
			-- you can set any other options
			-- expected by lualine, since this
			-- table will be passed directly to `setup`
			ashen.extensions = { "lazy", "fzf" }
			return ashen
		end,
	}
}

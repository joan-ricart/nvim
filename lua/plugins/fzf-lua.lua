return {
	{
		"ibhagwan/fzf-lua",
		config = function()
			local fzflua = require("fzf-lua")
			local wk = require("which-key")

			fzflua.setup({
				fzf_colors = false,
			})

			wk.add({
				{ "<leader>f", group = "Find" }
			})

			vim.keymap.set("n", "<leader>fb", function()
				fzflua.buffers()
			end, { desc = "[f]ind [b]uffers" })

			vim.keymap.set("n", "<leader>fg", function()
				fzflua.live_grep_native()
			end, { desc = "[f]ind [g]rep" })

			vim.keymap.set("n", "<leader>ff", function()
				fzflua.files()
			end, { desc = "[f]ind [f]iles" })

			vim.keymap.set("n", "<leader>fr", function()
				fzflua.oldfiles()
			end, { desc = "[f]ind [r]ecent" })

			-- vim.keymap.set("n", "<leader>d", function()
			-- 	fzflua.lsp_document_diagnostics()
			-- end, { desc = "[d]iagnostics" })

			vim.keymap.set("n", "<leader>ca", function()
				fzflua.lsp_code_actions()
			end, { desc = "[c]ode [a]ctions" })

			vim.keymap.set("n", "<leader>q", function()
				fzflua.quickfix()
			end, { desc = "[q]uickfix" })
		end
	}
}

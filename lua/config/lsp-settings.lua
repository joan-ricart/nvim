local function organize_imports()
	local clients = vim.lsp.get_clients({ bufnr = vim.api.nvim_get_current_buf() })
	if #clients == 0 then return end

	local client = clients[1]
	local encoding = client.offset_encoding or "utf-16"

	local params = vim.lsp.util.make_range_params(nil, encoding)
	params.context = { only = { "source.organizeImports" } }

	local result = vim.lsp.buf_request_sync(0, "textDocument/codeAction", params, 2000)
	for _, res in pairs(result or {}) do
		for _, r in pairs(res.result or {}) do
			if r.edit then
				vim.lsp.util.apply_workspace_edit(r.edit, encoding)
			elseif r.command then
				vim.lsp.buf.execute_command(r.command)
			end
		end
	end
end

-- Autocommand before saving
vim.api.nvim_create_autocmd("BufWritePre", {
	pattern = "*.go",
	callback = function()
		organize_imports()
		vim.lsp.buf.format({ async = false })
	end,
})

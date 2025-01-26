return {
	{
		"neovim/nvim-lspconfig",
		dependencies = { 'saghen/blink.cmp' },
		config = function()
			vim.api.nvim_create_autocmd('LspAttach', {
				callback = function(args)
					local client = vim.lsp.get_client_by_id(args.data.client_id)
					if not client then return end

					---@diagnostic disable-next-line: missing-parameter
					if client.supports_method('textDocument/formatting') then
						-- Format the current buffer on save
						vim.api.nvim_create_autocmd('BufWritePre', {
							buffer = args.buf,
							callback = function()
								vim.lsp.buf.format({ bufnr = args.buf, id = client.id })
							end,
						})
					end

					vim.keymap.set("n", "<leader>df", function()
						vim.diagnostic.open_float();
					end, { desc = "[d]iagnostic [f]loat" })
				end,
			})

			vim.keymap.set("n", "gd", function()
					vim.lsp.buf.definition()
				end, {desc = "[g]o to [g]efinition"})

			local capabilities = require('blink.cmp').get_lsp_capabilities()


			require 'lspconfig'.gopls.setup {
				capabilities = capabilities,
			}

			require 'lspconfig'.clangd.setup {
				capabilities = capabilities,
			}

			require 'lspconfig'.lua_ls.setup {
				capabilities = capabilities,
				on_init = function(client)
					if client.workspace_folders then
						local path = client.workspace_folders[1].name
						if vim.loop.fs_stat(path .. '/.luarc.json') or vim.loop.fs_stat(path .. '/.luarc.jsonc') then
							return
						end
					end

					client.config.settings.Lua = vim.tbl_deep_extend('force', client.config.settings.Lua, {
						runtime = {
							-- Tell the language server which version of Lua you're using
							-- (most likely LuaJIT in the case of Neovim)
							version = 'LuaJIT'
						},
						-- Make the server aware of Neovim runtime files
						workspace = {
							checkThirdParty = false,
							library = {
								vim.env.VIMRUNTIME
								-- Depending on the usage, you might want to add additional paths here.
								-- "${3rd}/luv/library"
								-- "${3rd}/busted/library",
							}
							-- or pull in all of 'runtimepath'. NOTE: this is a lot slower and will cause issues when working on your own configuration (see https://github.com/neovim/nvim-lspconfig/issues/3189)
							-- library = vim.api.nvim_get_runtime_file("", true)
						}
					})
				end,
				settings = {
					Lua = {}
				}
			}

			-- set floating window borders
			vim.cmd [[autocmd! ColorScheme * highlight NormalFloat guibg=#1f2335]]
			vim.cmd [[autocmd! ColorScheme * highlight FloatBorder guifg=white guibg=#1f2335]]

			local border = {
				{ '┌', 'FloatBorder' },
				{ '─', 'FloatBorder' },
				{ '┐', 'FloatBorder' },
				{ '│', 'FloatBorder' },
				{ '┘', 'FloatBorder' },
				{ '─', 'FloatBorder' },
				{ '└', 'FloatBorder' },
				{ '│', 'FloatBorder' },
			}

			local orig_util_open_floating_preview = vim.lsp.util.open_floating_preview
			function vim.lsp.util.open_floating_preview(contents, syntax, opts, ...)
				opts = opts or {}
				opts.border = opts.border or border
				return orig_util_open_floating_preview(contents, syntax, opts, ...)
			end

			-- add keymap to toggle signature help
			local wk = require("which-key")

			wk.add({
				{ "<leader>s", group = "Signature" }
			})

			vim.keymap.set("n", "<leader>sh", function()
				vim.lsp.buf.signature_help()
			end, { desc = "[s]ignature [h]elp" })

		end
	}
}

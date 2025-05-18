vim.lsp.config['tsserver'] = {
  cmd = { 'typescript-language-server', '--stdio' },
  filetypes = { 'javascript', 'javascriptreact', 'typescript', 'typescriptreact', 'typescript.tsx' },
  root_markers = { { 'package.json', 'tsconfig.json' }, '.git' },
  settings = {}, -- tsserver doesn't really use settings
}

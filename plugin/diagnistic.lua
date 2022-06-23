vim.fn.sign_define('DiagnosticSignError', { text = '', texthl = 'DiagnosticSignError' })
vim.fn.sign_define('DiagnosticSignWarn', { text = '', texthl = 'DiagnosticSignWarn' })
vim.fn.sign_define('DiagnosticSignInfo', { text = '', texthl = 'DiagnosticSignInfo' })
vim.fn.sign_define('DiagnosticSignHint', { text = '', texthl = 'DiagnosticSignHint' })

vim.diagnostic.config({
  virtual_text = { prefix = '' },
  float = {
    border = 'rounded',
  },
})

vim.lsp.handlers['textDocument/hover'] = vim.lsp.with(vim.lsp.handlers.hover, {
  border = 'rounded',
})

vim.api.nvim_create_user_command('LspDiagnosticsEnable', function()
  vim.diagnostic.enable()
end, { desc = 'Enable LSP diagnostics' })
vim.api.nvim_create_user_command('LspDiagnosticsDisable', function()
  vim.diagnostic.disable()
end, { desc = 'Disable LSP diagnostics' })

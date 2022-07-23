require('lsp_lines').setup()

vim.fn.sign_define('DiagnosticSignError', { text = '', texthl = 'DiagnosticSignError' })
vim.fn.sign_define('DiagnosticSignWarn', { text = '', texthl = 'DiagnosticSignWarn' })
vim.fn.sign_define('DiagnosticSignInfo', { text = '', texthl = 'DiagnosticSignInfo' })
vim.fn.sign_define('DiagnosticSignHint', { text = '', texthl = 'DiagnosticSignHint' })

local virtual_text = { prefix = '' }
local virtual_lines = false

vim.diagnostic.config({
  virtual_text = virtual_text,
  virtual_lines = virtual_lines,
  float = {
    border = 'rounded',
  },
})

vim.lsp.handlers['textDocument/hover'] = vim.lsp.with(vim.lsp.handlers.hover, {
  border = 'rounded',
})

local diagnostic_enabled = true
vim.keymap.set('n', 'yoD', function()
  if diagnostic_enabled then
    vim.diagnostic.disable()
    diagnostic_enabled = false
  else
    vim.diagnostic.enable()
    diagnostic_enabled = true
  end
end, { noremap = true })

vim.keymap.set('n', 'yol', function()
  virtual_lines = not virtual_lines
  vim.diagnostic.config({ virtual_lines = virtual_lines, virtual_text = not virtual_lines and virtual_text or false })
end, { noremap = true })

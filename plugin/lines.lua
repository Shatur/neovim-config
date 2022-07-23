require('lsp_lines').setup()

local lines_enabled = false
vim.keymap.set('n', 'yol', function()
  lines_enabled = not lines_enabled
  vim.diagnostic.config({ virtual_lines = lines_enabled, virtual_text = not lines_enabled })
end, { noremap = true })

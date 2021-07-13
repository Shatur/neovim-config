local diagnostics_active = true
local diagnostics = {}

function diagnostics.toggle_diagnostics()
  if diagnostics_active then
    diagnostics_active = false
    vim.lsp.diagnostic.clear(0)
    vim.lsp.handlers['textDocument/publishDiagnostics'] = function() end
  else
    diagnostics_active = true
    vim.lsp.handlers['textDocument/publishDiagnostics'] = vim.lsp.with(vim.lsp.diagnostic.on_publish_diagnostics, {
      virtual_text = true,
      signs = true,
      underline = true,
      update_in_insert = false,
    })
  end
end

return diagnostics

local lspconfig = require('lspconfig')
local telescope_builin = require('telescope.builtin')
local null_ls = require('null-ls')

local function setup_lsp_keymaps(_, buffer)
  vim.keymap.set('n', '<C-LeftMouse>', telescope_builin.lsp_definitions, { noremap = true, buffer = buffer, desc = 'Go to definition' })
  vim.keymap.set('n', 'gd', telescope_builin.lsp_definitions, { noremap = true, buffer = buffer, desc = 'Go to definition' })
  vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, { noremap = true, buffer = buffer, desc = 'Go to declaration' })
  vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, { noremap = true, buffer = buffer, desc = 'Go to implementation' })
  vim.keymap.set({ 'n', 'v' }, 'ga', vim.lsp.buf.code_action, { noremap = true, buffer = buffer, desc = 'Code action' })
  vim.keymap.set('n', 'gr', telescope_builin.lsp_references, { noremap = true, buffer = buffer, desc = 'Go to reference' })
  vim.keymap.set('n', 'go', telescope_builin.lsp_workspace_symbols, { noremap = true, buffer = buffer, desc = 'Go to workspace symbol' })
  vim.keymap.set('n', 'gO', telescope_builin.lsp_document_symbols, { noremap = true, buffer = buffer, desc = 'Go to document symbol' })
  vim.keymap.set('n', '<F2>', vim.lsp.buf.rename, { noremap = true, buffer = buffer, desc = 'Rename symbol' })
  vim.keymap.set({ 'n', 'v' }, '<Leader>=', vim.lsp.buf.format, { noremap = true, buffer = buffer, desc = 'Format document' })
  vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, { noremap = true, buffer = buffer, desc = 'Jump to previous diagnostic' })
  vim.keymap.set('n', ']d', vim.diagnostic.goto_next, { noremap = true, buffer = buffer, desc = 'Jump to next diagnostic' })
end

local capabilities = require('cmp_nvim_lsp').default_capabilities()

-- Language servers configuration
lspconfig.clangd.setup({
  cmd = { 'clangd', '--cross-file-rename', '--header-insertion=never', '--suggest-missing-includes', '--pch-storage=memory' },
  init_options = {
    clangdFileStatus = true,
  },
  on_attach = function(client, buffer)
    setup_lsp_keymaps(client, buffer)
    vim.keymap.set('n', 'gh', lspconfig.clangd.commands['ClangdSwitchSourceHeader'][1], { noremap = true, buffer = buffer, desc = 'Switch source / header' })
  end,
  capabilities = capabilities,
})

lspconfig.lua_ls.setup({
  on_attach = function(client, buffer)
    setup_lsp_keymaps(client, buffer)
    -- Use stylua instead
    client.server_capabilities.documentFormattingProvider = false
    client.server_capabilities.documentRangeFormattingProvider = false
  end,
  capabilities = capabilities,
  settings = {
    Lua = {
      diagnostics = {
        globals = { 'vim' },
      },
    },
  },
})

lspconfig.rust_analyzer.setup({
  capabilities = capabilities,
  on_attach = setup_lsp_keymaps,
  commands = {
    RustOpenDocs = {
      function()
        vim.lsp.buf_request(vim.api.nvim_get_current_buf(), 'experimental/externalDocs', vim.lsp.util.make_position_params(), function(err, url)
          if err then
            error(tostring(err))
          else
            if url then
              vim.ui.open(url)
            end
          end
        end)
      end,
      description = 'Open documentation for the symbol under the cursor in default browser',
    },
  },
})
lspconfig.pylsp.setup({
  capabilities = capabilities,
  on_attach = setup_lsp_keymaps,
})
lspconfig.taplo.setup({
  capabilities = capabilities,
  on_attach = setup_lsp_keymaps,
})

null_ls.setup({
  on_attach = setup_lsp_keymaps,
  sources = {
    null_ls.builtins.formatting.stylua,
    null_ls.builtins.formatting.cmake_format,
    null_ls.builtins.formatting.prettier,
  },
})

vim.api.nvim_create_autocmd('BufWritePre', {
  pattern = { '*.rs', '*.lua' },
  callback = function() vim.lsp.buf.format() end,
})

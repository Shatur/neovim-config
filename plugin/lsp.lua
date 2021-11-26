local lspconfig = require('lspconfig')
local lsp_signature = require('lsp_signature')
local lsp_status = require('lsp-status')

lsp_status.config({
  status_symbol = '',
  current_function = false,
  diagnostics = false, -- Will be displayed via lualine
})
lsp_status.register_progress()

local capabilities = require('cmp_nvim_lsp').update_capabilities(lsp_status.capabilities)

-- Buffer with LSP settings
local on_attach = function(client, bufnr)
  lsp_status.on_attach(client, bufnr)
  lsp_signature.on_attach({
    hint_enable = false,
  })

  vim.api.nvim_buf_set_keymap(bufnr, 'n', '<C-LeftMouse>', '<Cmd>Telescope lsp_definitions<CR>', { noremap = true })
  vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gd', '<Cmd>Telescope lsp_definitions<CR>', { noremap = true })
  vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gD', '<Cmd>lua vim.lsp.buf.declaration()<CR>', { noremap = true })
  vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gi', '<Cmd>lua vim.lsp.buf.implementation()<CR>', { noremap = true })
  vim.api.nvim_buf_set_keymap(bufnr, 'n', 'ga', '<Cmd>Telescope lsp_code_actions<CR>', { noremap = true })
  vim.api.nvim_buf_set_keymap(bufnr, 'v', 'ga', '<Cmd>Telescope lsp_range_code_actions<CR>', { noremap = true })
  vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gr', '<Cmd>Telescope lsp_references<CR>', { noremap = true })
  vim.api.nvim_buf_set_keymap(bufnr, 'n', 'go', '<Cmd>Telescope lsp_workspace_symbols<CR>', { noremap = true })
  vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gO', '<Cmd>Telescope lsp_document_symbols<CR>', { noremap = true })
  vim.api.nvim_buf_set_keymap(bufnr, 'n', '[d', '<Cmd>lua vim.lsp.diagnostic.goto_prev()<CR>', { noremap = true })
  vim.api.nvim_buf_set_keymap(bufnr, 'n', ']d', '<Cmd>lua vim.lsp.diagnostic.goto_next()<CR>', { noremap = true })
  vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gh', '<Cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>', { noremap = true })

  vim.api.nvim_buf_set_keymap(bufnr, 'n', 'K', '<Cmd>lua vim.lsp.buf.hover()<CR>', { noremap = true })
  vim.api.nvim_buf_set_keymap(bufnr, 'n', '<F2>', '<Cmd>lua vim.lsp.buf.rename()<CR>', { noremap = true })

  if vim.fn.exists('ClangdSwitchSourceHeader') then
    vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gh', '<Cmd>ClangdSwitchSourceHeader<CR>', { noremap = true })
  end

  -- Set some keybinds conditional on server capabilities
  if client.resolved_capabilities.document_formatting then
    vim.api.nvim_buf_set_keymap(bufnr, 'n', '<A-=>', '<Cmd>lua vim.lsp.buf.formatting()<CR>', { noremap = true })
  elseif client.resolved_capabilities.document_range_formatting then
    vim.api.nvim_buf_set_keymap(bufnr, 'n', '<A-=>', '<Cmd>lua vim.lsp.buf.range_formatting()<CR>', { noremap = true })
  end
end

-- Language servers configuration
lspconfig.clangd.setup({
  cmd = { 'clangd', '--background-index', '--cross-file-rename', '--header-insertion=never', '--suggest-missing-includes', '--pch-storage=memory' },
  handlers = lsp_status.extensions.clangd.setup(),
  init_options = {
    clangdFileStatus = true,
  },
  on_attach = on_attach,
  capabilities = capabilities,
})

lspconfig.sumneko_lua.setup({
  cmd = { 'lua-language-server' },
  on_attach = on_attach,
  capabilities = capabilities,
  settings = {
    Lua = {
      runtime = {
        version = 'LuaJIT',
        path = vim.split(package.path, ';'),
      },
      diagnostics = {
        globals = { 'vim' },
      },
      workspace = {
        library = {
          [vim.fn.expand('$VIMRUNTIME/lua')] = true,
          [vim.fn.expand('$VIMRUNTIME/lua/vim/lsp')] = true,
        },
      },
    },
  },
})

lspconfig.gdscript.setup({
  capabilities = capabilities,
  on_attach = on_attach,
})
lspconfig.cmake.setup({
  capabilities = capabilities,
  on_attach = on_attach,
})
lspconfig.rust_analyzer.setup({
  capabilities = capabilities,
  on_attach = on_attach,
})

-- Diagnistic signs
vim.fn.sign_define('LspDiagnosticsSignError', { text = '' })
vim.fn.sign_define('LspDiagnosticsSignWarning', { text = '' })
vim.fn.sign_define('LspDiagnosticsSignInformation', { text = '' })
vim.fn.sign_define('LspDiagnosticsSignHint', { text = '' })

-- Use circle for diagnostic icon
vim.lsp.handlers['textDocument/publishDiagnostics'] = vim.lsp.with(vim.lsp.diagnostic.on_publish_diagnostics, {
  virtual_text = { prefix = '' },
  signs = true,
  update_in_insert = false,
})

vim.lsp.handlers['textDocument/hover'] = vim.lsp.with(vim.lsp.handlers.hover, {
  border = 'rounded',
})

vim.lsp.handlers['textDocument/signatureHelp'] = vim.lsp.with(vim.lsp.handlers.signature_help, {
  border = 'rounded',
})

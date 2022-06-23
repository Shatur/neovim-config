local lspconfig = require('lspconfig')
local lsp_status = require('lsp-status')
local telescope_builin = require('telescope.builtin')
local null_ls = require('null-ls')

local function setup_lsp_keymaps(client, buffer)
  lsp_status.on_attach(client)

  vim.keymap.set('n', '<C-LeftMouse>', telescope_builin.lsp_definitions, { noremap = true, buffer = buffer })
  vim.keymap.set('n', 'gd', telescope_builin.lsp_definitions, { noremap = true, buffer = buffer })
  vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, { noremap = true, buffer = buffer })
  vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, { noremap = true, buffer = buffer })
  vim.keymap.set('n', 'ga', vim.lsp.buf.code_action, { noremap = true, buffer = buffer })
  vim.keymap.set('v', 'ga', vim.lsp.buf.range_code_action, { noremap = true, buffer = buffer })
  vim.keymap.set('n', 'gr', telescope_builin.lsp_references, { noremap = true, buffer = buffer })
  vim.keymap.set('n', 'go', telescope_builin.lsp_workspace_symbols, { noremap = true, buffer = buffer })
  vim.keymap.set('n', 'gO', telescope_builin.lsp_document_symbols, { noremap = true, buffer = buffer })
  vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, { noremap = true, buffer = buffer })
  vim.keymap.set('n', ']d', vim.diagnostic.goto_next, { noremap = true, buffer = buffer })
  vim.keymap.set('n', '<Leader>k', vim.diagnostic.open_float, { noremap = true, buffer = buffer })
  vim.keymap.set('n', 'K', vim.lsp.buf.hover, { noremap = true, buffer = buffer })
  vim.keymap.set('n', '<F2>', vim.lsp.buf.rename, { noremap = true, buffer = buffer })

  -- Set some keybinds conditional on server capabilities
  if client.resolved_capabilities.document_formatting then
    vim.keymap.set('n', '<A-=>', vim.lsp.buf.formatting, { noremap = true, buffer = buffer })
  elseif client.resolved_capabilities.document_range_formatting then
    vim.keymap.set('n', '<A-=>', vim.lsp.buf.range_formatting, { noremap = true, buffer = buffer })
  end
end

lsp_status.config({
  status_symbol = '',
  current_function = false,
  diagnostics = false, -- Will be displayed via lualine
})
lsp_status.register_progress()

local capabilities = require('cmp_nvim_lsp').update_capabilities(lsp_status.capabilities)

-- Language servers configuration
lspconfig.clangd.setup({
  cmd = { 'clangd', '--cross-file-rename', '--header-insertion=never', '--suggest-missing-includes', '--pch-storage=memory' },
  handlers = lsp_status.extensions.clangd.setup(),
  init_options = {
    clangdFileStatus = true,
  },
  on_attach = function(client, bufnr)
    setup_lsp_keymaps(client, bufnr)
    vim.keymap.set('n', 'gh', lspconfig.clangd.commands['ClangdSwitchSourceHeader'][1], { noremap = true, buffer = bufnr })
  end,
  capabilities = capabilities,
})

lspconfig.sumneko_lua.setup({
  cmd = { 'lua-language-server' },
  on_attach = function(client, bufnr)
    setup_lsp_keymaps(client, bufnr)
    client.resolved_capabilities.document_formatting = false -- Use stylua instead
  end,
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

lspconfig.cmake.setup({
  capabilities = capabilities,
  on_attach = setup_lsp_keymaps,
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
            vim.fn['netrw#BrowseX'](url, 0)
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
    null_ls.builtins.diagnostics.vint,
  },
})

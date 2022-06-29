local lspconfig = require('lspconfig')
local lsp_status = require('lsp-status')
local telescope_builin = require('telescope.builtin')
local null_ls = require('null-ls')
local cmake = require('cmake')
local rust = require('rust')

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

local function setup_cmake_keymaps(buffer)
  vim.keymap.set({ '', 'i' }, '<C-BS>', cmake.cancel, { noremap = true, buffer = buffer })
  vim.keymap.set({ '', 'i' }, '<F5>', cmake.build_and_debug, { noremap = true, buffer = buffer })
  vim.keymap.set({ '', 'i' }, '<S-F5>', cmake.set_target_args, { noremap = true, buffer = buffer })
  vim.keymap.set({ '', 'i' }, '<A-F5>', cmake.debug, { noremap = true, buffer = buffer })
  vim.keymap.set({ '', 'i' }, '<F6>', cmake.build_and_run, { noremap = true, buffer = buffer })
  vim.keymap.set({ '', 'i' }, '<A-F6>', cmake.run, { noremap = true, buffer = buffer })
  vim.keymap.set({ '', 'i' }, '<F7>', cmake.build, { noremap = true, buffer = buffer })
  vim.keymap.set({ '', 'i' }, '<S-F7>', cmake.select_target, { noremap = true, buffer = buffer })
  vim.keymap.set({ '', 'i' }, '<A-F7>', cmake.build_all, { noremap = true, buffer = buffer })
  vim.keymap.set({ '', 'i' }, '<F8>', cmake.configure, { noremap = true, buffer = buffer })
  vim.keymap.set({ '', 'i' }, '<S-F8>', cmake.select_build_type, { noremap = true, buffer = buffer })
  vim.keymap.set({ '', 'i' }, '<A-F8>', cmake.clear_cache, { noremap = true, buffer = buffer })
end

local function setup_rust_keymaps(buffer)
  vim.keymap.set({ '', 'i' }, '<C-BS>', rust.cancel, { noremap = true, buffer = buffer })
  vim.keymap.set({ '', 'i' }, '<F5>', function()
    rust.cargo('test')
  end, { noremap = true, buffer = buffer })
  vim.keymap.set({ '', 'i' }, '<S-F5>', function()
    rust.set_args('test')
  end, { noremap = true, buffer = buffer })
  vim.keymap.set({ '', 'i' }, '<A-F5>', function()
    rust.debug('test')
  end, { noremap = true, buffer = buffer })
  vim.keymap.set({ '', 'i' }, '<F6>', function()
    rust.cargo('run')
  end, { noremap = true, buffer = buffer })
  vim.keymap.set({ '', 'i' }, '<S-F6>', function()
    rust.set_args('run')
  end, { noremap = true, buffer = buffer })
  vim.keymap.set({ '', 'i' }, '<A-F6>', function()
    rust.debug('run')
  end, { noremap = true, buffer = buffer })
  vim.keymap.set({ '', 'i' }, '<F7>', function()
    rust.cargo('make')
  end, { noremap = true, buffer = buffer })
  vim.keymap.set({ '', 'i' }, '<S-F7>', function()
    rust.set_args('make')
  end, { noremap = true, buffer = buffer })
  vim.keymap.set({ '', 'i' }, '<A-F7>', function()
    rust.set_args('global')
  end, { noremap = true, buffer = buffer })
  vim.keymap.set({ '', 'i' }, '<F8>', function()
    rust.cargo('check')
  end, { noremap = true, buffer = buffer })
  vim.keymap.set({ '', 'i' }, '<S-F8>', function()
    rust.set_args('check')
  end, { noremap = true, buffer = buffer })
  vim.keymap.set({ '', 'i' }, '<F9>', function()
    rust.cargo('clippy')
  end, { noremap = true, buffer = buffer })
  vim.keymap.set({ '', 'i' }, '<S-F9>', function()
    rust.set_args('clippy')
  end, { noremap = true, buffer = buffer })
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
  on_attach = function(client, buffer)
    setup_lsp_keymaps(client, buffer)
    setup_cmake_keymaps(buffer)
    vim.keymap.set('n', 'gh', lspconfig.clangd.commands['ClangdSwitchSourceHeader'][1], { noremap = true, buffer = buffer })
  end,
  capabilities = capabilities,
})

lspconfig.sumneko_lua.setup({
  cmd = { 'lua-language-server' },
  on_attach = function(client, buffer)
    setup_lsp_keymaps(client, buffer)
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
  on_attach = function(client, buffer)
    setup_lsp_keymaps(client, buffer)
    setup_cmake_keymaps(buffer)
  end,
})
lspconfig.rust_analyzer.setup({
  capabilities = capabilities,
  on_attach = function(client, buffer)
    setup_lsp_keymaps(client, buffer)
    setup_rust_keymaps(buffer)
  end,
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
  on_attach = function(client, buffer)
    setup_lsp_keymaps(client, buffer)
    setup_rust_keymaps(buffer)
  end,
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

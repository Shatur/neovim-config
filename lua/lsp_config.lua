local nvim_lsp = require'nvim_lsp'

local apply_settings = function()
  require'diagnostic'.on_attach()

  local map_options = { noremap=true, silent=true }
  vim.api.nvim_buf_set_keymap(0, 'n', 'gd', '<Cmd>lua vim.lsp.buf.declaration()<CR>', map_options)
  vim.api.nvim_buf_set_keymap(0, 'n', 'K', '<Cmd>lua vim.lsp.buf.hover()<CR>', map_options)
  vim.api.nvim_buf_set_keymap(0, 'n', 'gr', '<Cmd>lua vim.lsp.buf.rename()<CR>', map_options)
  vim.api.nvim_buf_set_keymap(0, 'n', 'gR', '<Cmd>lua vim.lsp.buf.references()<CR>', map_options)
  vim.api.nvim_buf_set_keymap(0, 'n', 'gS', '<Cmd>lua vim.lsp.buf.document_symbol()<CR>', map_options)
  vim.api.nvim_buf_set_keymap(0, 'n', 'gW', '<Cmd>lua vim.lsp.buf.workspace_symbol()<CR>', map_options)
  vim.api.nvim_buf_set_keymap(0, 'n', '<A-d>', '<Cmd>lua vim.lsp.util.show_line_diagnostics()<CR>', map_options)
end

nvim_lsp.bashls.setup{on_attach = apply_settings}
nvim_lsp.vimls.setup{on_attach = apply_settings}
nvim_lsp.gdscript.setup{on_attach = apply_settings}
nvim_lsp.pyls.setup{on_attach = apply_settings}

nvim_lsp.gdscript.setup{
    on_attach = apply_settings,
    capabilities = {
        textDocument = {
            completion = {
                completionItem = {
                    snippetSupport = true
                }
            }
        }
    }
}

nvim_lsp.clangd.setup{
    cmd = {'clangd', '--header-insertion=never', '--suggest-missing-includes', '--background-index', '-j=8', '--cross-file-rename', '--pch-storage=memory', '--clang-tidy', '--clang-tidy-checks=-clang-analyzer-*,bugprone-*,misc-*,-misc-non-private-member-variables-in-classes,performance-*,-performance-no-automatic-move,modernize-use-*,-modernize-use-nodiscard,-modernize-use-trailing-return-type'},
    on_attach = apply_settings,
    capabilities = {
        textDocument = {
            completion = {
                completionItem = {
                    snippetSupport = true
                }
            }
        }
    },
    init_options = {
        usePlaceholders = true,
        completeUnimported = true
    }
}

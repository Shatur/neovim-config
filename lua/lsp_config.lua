local nvim_lsp = require'nvim_lsp'
local lsp_status = require'lsp-status'
lsp_status.register_progress()

local apply_settings = function()
  require'diagnostic'.on_attach()

  local map_options = {noremap=true, silent=true}
  vim.api.nvim_buf_set_keymap(0, 'n', 'gd', '<Cmd>lua vim.lsp.buf.declaration()<CR>', map_options)
  vim.api.nvim_buf_set_keymap(0, 'n', 'K', '<Cmd>lua vim.lsp.buf.hover()<CR>', map_options)
  vim.api.nvim_buf_set_keymap(0, 'n', 'gr', '<Cmd>lua vim.lsp.buf.rename()<CR>', map_options)
  vim.api.nvim_buf_set_keymap(0, 'n', 'gR', '<Cmd>lua vim.lsp.buf.references()<CR>', map_options)
  vim.api.nvim_buf_set_keymap(0, 'n', 'gS', '<Cmd>lua vim.lsp.buf.document_symbol()<CR>', map_options)
  vim.api.nvim_buf_set_keymap(0, 'n', 'gW', '<Cmd>lua vim.lsp.buf.workspace_symbol()<CR>', map_options)
  vim.api.nvim_buf_set_keymap(0, 'n', '<A-CR>', '<Cmd>lua vim.lsp.buf.code_action()<CR>', map_options)
  vim.api.nvim_buf_set_keymap(0, 'n', '<A-d>', '<Cmd>lua vim.lsp.util.show_line_diagnostics()<CR>', map_options)
end

nvim_lsp.cmake.setup{on_attach = apply_settings}
nvim_lsp.bashls.setup{on_attach = apply_settings}
nvim_lsp.vimls.setup{on_attach = apply_settings}
nvim_lsp.gdscript.setup{on_attach = apply_settings}
nvim_lsp.pyls.setup{on_attach = apply_settings}

nvim_lsp.clangd.setup{
    cmd = {'clangd', '--header-insertion=never', '--suggest-missing-includes', '--background-index', '-j=8', '--cross-file-rename', '--pch-storage=memory', '--clang-tidy', '--clang-tidy-checks=-clang-analyzer-*,bugprone-*,misc-*,-misc-non-private-member-variables-in-classes,performance-*,-performance-no-automatic-move,modernize-use-*,-modernize-use-nodiscard,-modernize-use-trailing-return-type'},
    on_attach = function(client)
        apply_settings()
        lsp_status.on_attach(client)
        vim.api.nvim_buf_set_keymap(0, 'n', 'gs', '<Cmd>ClangdSwitchSourceHeader<CR>', {noremap=true, silent=true})
        vim.api.nvim_buf_set_keymap(0, 'n', 'gh', '<Cmd>lua require"clangd_nvim".enable()<CR>', {noremap=true, silent=true})
        vim.api.nvim_buf_set_keymap(0, 'n', 'gH', '<Cmd>lua require"clangd_nvim".disable()<CR>', {noremap=true, silent=true})
        vim.api.nvim_buf_set_keymap(0, 'n', 'gl', '<Cmd>lua require"clangd_nvim".disable()<CR>', {noremap=true, silent=true})
        vim.api.nvim_buf_set_keymap(0, 'n', 'gL', '<Cmd>lua require"clangd_nvim".disable()<CR>', {noremap=true, silent=true})
    end,
    on_init = require'clangd_nvim'.on_init,
    callbacks = lsp_status.extensions.clangd.setup(),
    capabilities = {
        capabilities = {
            window = {
                workDoneProgress = true
            }
        },
        textDocument = {
            completion = {
                completionItem = {
                    snippetSupport = true
                }
            },
            semanticHighlightingCapabilities = {
                semanticHighlighting = true
            }
        }
    },
    init_options = {
        clangdFileStatus = true,
        usePlaceholders = true,
        completeUnimported = true
    }
}

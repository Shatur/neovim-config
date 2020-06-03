local nvim_lsp = require'nvim_lsp'
local diagnostic = require'diagnostic'.on_attach

nvim_lsp.bashls.setup{on_attach = diagnostic}
nvim_lsp.vimls.setup{on_attach = diagnostic}
nvim_lsp.gdscript.setup{on_attach = diagnostic}
nvim_lsp.pyls.setup{on_attach = diagnostic}

nvim_lsp.gdscript.setup{
    on_attach = diagnostic,
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
    on_attach = diagnostic,
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

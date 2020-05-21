packadd nvim-lsp

nnoremap <silent> gd <cmd>lua vim.lsp.buf.declaration()<CR>
nnoremap <silent> K <cmd>lua vim.lsp.buf.hover()<CR>
nnoremap <silent> gR <cmd>lua vim.lsp.buf.references()<CR>
nnoremap <silent> g0 <cmd>lua vim.lsp.buf.document_symbol()<CR>
nnoremap <silent> gW <cmd>lua vim.lsp.buf.workspace_symbol()<CR>
nnoremap <silent> <A-d> <cmd>lua vim.lsp.util.show_line_diagnostics()<CR>

lua << EOF
  local nvim_lsp = require'nvim_lsp'
  local custom_attach = function()
    require'completion'.on_attach()
    require'diagnostic'.on_attach()
  end

  nvim_lsp.gdscript.setup{on_attach = custom_attach}
  nvim_lsp.bashls.setup{on_attach = custom_attach}
  nvim_lsp.vimls.setup{on_attach = custom_attach}
  nvim_lsp.clangd.setup{
    cmd = {'clangd', '--header-insertion=never', '--suggest-missing-includes', '--background-index', '-j=8', '--cross-file-rename', '--pch-storage=memory', '--clang-tidy', '--clang-tidy-checks=-clang-analyzer-*,bugprone-*,misc-*,-misc-non-private-member-variables-in-classes,performance-*,-performance-no-automatic-move,modernize-use-*,-modernize-use-nodiscard,-modernize-use-trailing-return-type'},
    on_attach = custom_attach,
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
EOF

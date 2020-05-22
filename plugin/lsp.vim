packadd nvim-lsp

nnoremap gd <Cmd>lua vim.lsp.buf.declaration()<CR>
nnoremap K <Cmd>lua vim.lsp.buf.hover()<CR>
nnoremap gr <Cmd>lua vim.lsp.buf.rename()<CR>
nnoremap gR <Cmd>lua vim.lsp.buf.references()<CR>
nnoremap g0 <Cmd>lua vim.lsp.buf.document_symbol()<CR>
nnoremap gW <Cmd>lua vim.lsp.buf.workspace_symbol()<CR>
nnoremap <A-d> <Cmd>lua vim.lsp.util.show_line_diagnostics()<CR>

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

packadd nvim-lsp
lua require'lsp_config'

nnoremap gd <Cmd>lua vim.lsp.buf.declaration()<CR>
nnoremap K <Cmd>lua vim.lsp.buf.hover()<CR>
nnoremap gr <Cmd>lua vim.lsp.buf.rename()<CR>
nnoremap gR <Cmd>lua vim.lsp.buf.references()<CR>
nnoremap g0 <Cmd>lua vim.lsp.buf.document_symbol()<CR>
nnoremap gW <Cmd>lua vim.lsp.buf.workspace_symbol()<CR>
nnoremap <A-d> <Cmd>lua vim.lsp.util.show_line_diagnostics()<CR>

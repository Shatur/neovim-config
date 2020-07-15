autocmd vimrc CursorHold * lua vim.lsp.util.show_line_diagnostics()

nnoremap ]d <Cmd>NextDiagnosticCycle<CR>
nnoremap [d <Cmd>PrevDiagnosticCycle<CR>

lua require'dap_config'

nnoremap <silent> <F2> <Cmd>lua require'dap'.repl.toggle({height=15})<CR>
nnoremap <silent> <S-F2> <Cmd>lua require'dap'.disconnect()<CR><Cmd>lua require'dap'.repl.close()<CR>
nnoremap <silent> <F10> <Cmd>lua require'dap'.step_over()<CR>
nnoremap <silent> <F11> <Cmd>lua require'dap'.step_into()<CR>
nnoremap <silent> <S-F11> <Cmd>lua require'dap'.step_out()<CR>
nnoremap <silent> <F12> <Cmd>lua require'dap'.up()<CR>
nnoremap <silent> <S-F12> <Cmd>lua require'dap'.down()<CR>
nnoremap <silent> <Leader>o <Cmd>lua require'dap'.toggle_breakpoint()<CR>
nnoremap <silent> <Leader>O <Cmd>lua require'dap'.toggle_breakpoint(vim.fn.input('Breakpoint Condition: '))<CR>


sign define DapBreakpoint text= texthl=LspDiagnosticsErrorSign
sign define DapStopped text=→ texthl=LspDiagnosticsWarningSign

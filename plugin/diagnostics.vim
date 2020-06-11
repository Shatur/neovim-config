call sign_define('LspDiagnosticsErrorSign', {'text': ''})
call sign_define('LspDiagnosticsWarningSign', {'text': ''})
call sign_define('LspDiagnosticInformationSign', {'text': ''})
call sign_define('LspDiagnosticHintSign', {'text': ''})

highlight LspDiagnosticsErrorSign guifg=Red
highlight LspDiagnosticsWarningSign guifg=Orange
highlight LspDiagnosticInformationSign guifg=LightYellow
highlight LspDiagnosticHintSign guifg=LightGray

nnoremap ]d <Cmd>NextDiagnosticCycle<CR>
nnoremap [d <Cmd>PrevDiagnosticCycle<CR>

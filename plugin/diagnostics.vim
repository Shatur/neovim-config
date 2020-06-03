call sign_define('LspDiagnosticsErrorSign', {'text' : '', 'texthl' : 'LspDiagnosticsError'})
call sign_define('LspDiagnosticsWarningSign', {'text' : '', 'texthl' : 'LspDiagnosticsWarning'})
call sign_define('LspDiagnosticInformationSign', {'text' : '', 'texthl' : 'LspDiagnosticsInformation'})
call sign_define('LspDiagnosticHintSign', {'text' : '', 'texthl' : 'LspDiagnosticsHint'})

nnoremap ]d <Cmd>NextDiagnosticCycle<CR>
nnoremap [d <Cmd>PrevDiagnosticCycle<CR>

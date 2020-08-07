function! vimrc#vscode#CommandOnLastLesection(command) abort
    if visualmode() ==# 'V'
        call VSCodeNotifyRange(a:command, line("'<"), line("'>"), 1)
    else
        let startPos = getpos("'<")
        let endPos = getpos("'>")
        call VSCodeNotifyRangePos(a:command, startPos[1], endPos[1], startPos[2], endPos[2] + 1, 1)
    endif
endfunction

function! vimrc#vscode#VisualModeCommand(command)
  if visualmode() == 'V'
    let startLine = line('v')
    let endLine = line('.')
    call VSCodeNotifyRange(a:command, startLine, endLine, 1)
  else
    let startPos = getpos('v')
    let endPos = getpos('.')
    call VSCodeNotifyRangePos(a:command, startPos[1], endPos[1], startPos[2], endPos[2], 0)
  endif
endfunction

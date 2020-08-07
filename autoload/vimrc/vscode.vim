function! vimrc#vscode#CommandOnLastLesection(command) abort
    if visualmode() ==# 'V'
        call VSCodeNotifyRange(a:command, line("'<"), line("'>"), 1)
    else
        let startPos = getpos("'<")
        let endPos = getpos("'>")
        call VSCodeNotifyRangePos(a:command, startPos[1], endPos[1], startPos[2], endPos[2] + 1, 1)
    endif
endfunction

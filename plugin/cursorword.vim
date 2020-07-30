if exists('g:vscode')
  finish
endif

let g:cursorword_highlight = 0
let g:cursorword_delay = 250

highlight link CursorWord0 CursorColumn
highlight link CursorWord1 CursorColumn

if exists('g:vscode')
  finish
endif

let g:one_allow_italics = 1

colorscheme one

call one#highlight('DiffRemoved', '', 'bg', '')
call one#highlight('DiffAdded', '', 'bg', '')
call one#highlight('Constant', '56b6c2', '', '')

highlight default GlyphPalette8 guifg=#ebca8d

scriptencoding utf-8

let g:airline_powerline_fonts = 1

let g:airline#extensions#tabline#enabled = 1

let g:airline_symbols = {}
let g:airline_symbols.notexists = ''
let g:airline_symbols.readonly = ''
let g:airline_symbols.dirty='●'
let g:airline_symbols.branch = ''

let g:airline_left_sep = ' '
let g:airline_right_sep = ' '
let g:airline_left_alt_sep = '|'
let g:airline_right_alt_sep = '|'

let airline#extensions#lsp#error_symbol = ' '
let airline#extensions#lsp#warning_symbol = ' '
let airline#extensions#lsp#open_lnum_symbol = ' ('
let airline#extensions#lsp#close_lnum_symbol = ' )'

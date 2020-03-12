scriptencoding utf-8

" Define new accents for AsyncRun
function! AirlineThemePatch(palette)
    let a:palette.accents.running = ['', '', '', '', '']
    let a:palette.accents.success = ['#93bc75', '' , 'green', '', '']
    let a:palette.accents.failure = ['#cc666f', '' , 'red', '', '']
endfunction

" Change color of the relevant section according to g:asyncrun_status, a global variable exposed by AsyncRun
let g:previous_async_status = ''
function! AsyncRunStatus()
    let async_status = g:asyncrun_status
    if async_status != g:previous_async_status
        if async_status ==# 'running'
            call airline#parts#define_accent('asyncrun_status', 'running')
        elseif async_status ==# 'success'
            call airline#parts#define_accent('asyncrun_status', 'success')
        elseif async_status ==# 'failure'
            call airline#parts#define_accent('asyncrun_status', 'failure')
        endif

        let g:airline_section_x = airline#section#create(['asyncrun_status'])
        AirlineRefresh
        let g:previous_async_status = async_status
    endif

    return async_status
endfunction

" AsyncRunStatus
call airline#parts#define_function('asyncrun_status', 'AsyncRunStatus')
let g:airline_theme_patch_func = 'AirlineThemePatch'

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

let g:airline_section_x = airline#section#create(['asyncrun_status'])

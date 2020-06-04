if !exists('g:started_by_firenvim')
  finish
endif

set laststatus=0
packadd firenvim

let g:firenvim_config = {
    \ 'globalSettings': {
        \ 'alt': 'all',
    \  },
    \ 'localSettings': {
        \ '.*': {
            \ 'cmdline': 'firenvim',
            \ 'takeover': 'never',
        \ },
    \ }
\ }

" For unknown reason Airline want to set this variable to v:true
let g:loaded_airline = v:true

let g:fern_loaded = v:false
let b:loaded_lastplace_plugin = v:false
let g:loaded_close_buffers = v:false
let g:loaded_cmake_projects = v:false
let g:loaded_compete_lamp = v:false
let g:loaded_fugitive = v:false
let g:loaded_gitgutter = v:false
let g:loaded_gtfo = v:false
let g:loaded_lamp = v:false
let g:loaded_rhubarb = v:false
let g:loaded_startify = v:false
let g:loaded_vim_cpp_helper = v:false
let g:loaded_vista = v:false
let g:loaded_webdevicons = v:false

nnoremap <Esc><Esc> <Cmd>call firenvim#focus_page()<CR>
nnoremap <C-z> <Cmd>write<CR><Cmd>call firenvim#hide_frame()<CR>

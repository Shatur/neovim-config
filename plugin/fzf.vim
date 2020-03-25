" Do no search in filenames
command! -bang -nargs=* Ag call fzf#vim#ag(<q-args>, {'options': '--delimiter : --nth 4..'}, <bang>0)
command! -bang -nargs=* Rg call fzf#vim#grep("rg --column --line-number --no-heading --color=always --smart-case ".shellescape(<q-args>), 1, {'options': '--delimiter : --nth 4..'}, <bang>0) 

let g:fzf_commands_expect = 'alt-enter,ctrl-x'

nnoremap <C-f> :Ag 
nnoremap <silent> <C-p> :Files<CR>
nnoremap <silent> <F1> :Helptags<CR>
nnoremap <silent> <C-;> :Commands<CR>
nnoremap <silent> <C-Tab> :Buffers<CR>

" Mapping selecting mappings
nmap <Leader><tab> <plug>(fzf-maps-n)
xmap <Leader><tab> <plug>(fzf-maps-x)
omap <Leader><tab> <plug>(fzf-maps-o)

" Checkout branches
function! s:open_branch_fzf(line)
  let l:branch = a:line
  execute 'split | terminal git checkout ' . l:branch
  call feedkeys('i', 'n')
endfunction

function! s:show_branches_fzf(bang)
  let l:current = system('git symbolic-ref --short HEAD')
  let l:current = substitute(l:current, '\n', '', 'g')
  let l:current_scaped = substitute(l:current, '/', '\\/', 'g')
  call fzf#vim#grep(
    \ "git branch --sort=-committerdate -r --no-color | sed -r -e 's/^[^/]*\\///' -e '/^" . l:current_scaped . "$/d' -e '/^HEAD/d'", 0,
    \ { 'sink': function('s:open_branch_fzf'), 'options': ['--no-multi', '--header='.l:current] }, a:bang)
endfunction

command! -bang -nargs=0 Branches call <SID>show_branches_fzf(<bang>0)

" Do no search in filenames
command! -bang -nargs=* Ag call fzf#vim#ag(<q-args>, {'options': '--delimiter : --nth 4..'}, <bang>0)
command! -bang -nargs=* Rg call fzf#vim#grep("rg --column --line-number --no-heading --color=always --smart-case ".shellescape(<q-args>), 1, {'options': '--delimiter : --nth 4..'}, <bang>0) 

let g:fzf_commands_expect = 'alt-enter,ctrl-x'

nnoremap <C-f> :Ag 
nnoremap <silent> <C-p> :Files<CR>
nnoremap <silent> <F1> :Helptags<CR>
nnoremap <silent> <C-;> :Commands<CR>
nnoremap <silent> <C-Tab> :Buffers<CR>
nnoremap <silent> <A-b> :Branches<CR>

" Mapping selecting mappings
nmap <Leader><tab> <plug>(fzf-maps-n)
xmap <Leader><tab> <plug>(fzf-maps-x)
omap <Leader><tab> <plug>(fzf-maps-o)

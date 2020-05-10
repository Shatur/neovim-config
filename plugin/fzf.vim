" Use FZF for spell suggestions
function! FzfSpellSink(word)
  exe 'normal! "_ciw'.a:word
endfunction
function! FzfSpell()
  let suggestions = spellsuggest(expand('<cword>'))
  return fzf#run({'source': suggestions, 'sink': function('FzfSpellSink'), 'down': 10 })
endfunction

command! -bang -nargs=* Ag call fzf#vim#ag(<q-args>, {'options': '--delimiter : --nth 4..'}, <bang>0)
command! -bang -nargs=* Rg call fzf#vim#grep('rg --column --line-number --no-heading --color=always --smart-case ' . shellescape(<q-args>), 1, {'options': '--delimiter : --nth 4..'}, <bang>0) 

let g:fzf_commands_expect = 'alt-enter,ctrl-x'

nnoremap <C-f> :Ag<Space>
nnoremap <silent> <C-p> :Files<CR>
nnoremap <silent> <F1> :Helptags<CR>
nnoremap <silent> <Leader><Tab> :Buffers<CR>
nnoremap <silent> <S-CR> :Commands<CR>
nnoremap <silent> z= :call FzfSpell()<CR>

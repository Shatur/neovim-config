" Use FZF for spell suggestions
function! FzfSpellSink(word)
  exe 'normal! "_ciw' . a:word
endfunction
function! FzfSpell()
  let suggestions = spellsuggest(expand('<cword>'))
  return fzf#run({'source': suggestions, 'sink': function('FzfSpellSink'), 'down': 10 })
endfunction

command! -bang -nargs=* Ag call fzf#vim#ag(<q-args>, {'options': '--delimiter : --nth 4..'}, <bang>0)
command! -bang -nargs=* Rg call fzf#vim#grep('rg --column --line-number --no-heading --color=always --smart-case ' . shellescape(<q-args>), 1, {'options': '--delimiter : --nth 4..'}, <bang>0)

let g:fzf_commands_expect = 'alt-enter,ctrl-x'

nnoremap <C-f> :Ag<Space>
nnoremap <A-l> <Cmd>BLines<CR>
nnoremap <C-p> <Cmd>Files<CR>
nnoremap <A-p> <Cmd>History<CR>
nnoremap <F1> <Cmd>Helptags<CR>
nnoremap <Leader><Tab> <Cmd>Buffers<CR>
nnoremap <S-CR> <Cmd>Commands<CR>
nnoremap z= <Cmd>call FzfSpell()<CR>

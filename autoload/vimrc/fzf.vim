function! s:ReplaceCurrentWorld(word) abort
  exe 'normal! "_ciw' . a:word
endfunction

function! vimrc#fzf#Spell() abort
  let suggestions = spellsuggest(expand('<cword>'))
  return fzf#run({'source': suggestions, 'sink': function('s:ReplaceCurrentWorld'), 'down': 10 })
endfunction

function! s:ReplaceCurrentWorld(word) abort
  exe 'normal! "_ciw' . a:word
endfunction

function! vimrc#fzf#Spell() abort
  let suggestions = spellsuggest(expand('<cword>'))
  return fzf#run({'source': suggestions, 'sink': function('s:ReplaceCurrentWorld'), 'down': 10 })
endfunction

function! s:Packadd(package) abort
  exe 'packadd ' . a:package
endfunction

function! vimrc#fzf#Packages() abort
  let packages = map(globpath(&packpath, 'pack/*/opt/*', v:true, v:true), 'fnamemodify(v:val, ":t")')
  return fzf#run({'source': packages, 'sink': function('s:Packadd'), 'down': 10 })
endfunction

function! s:ReplaceCurrentWorld(word) abort
  exe 'normal! "_ciw' .. a:word
endfunction

function! vimrc#fzf#Spell() abort
  let suggestions = spellsuggest(expand('<cword>'))
  return fzf#run({'source': suggestions, 'sink': function('s:ReplaceCurrentWorld'), 'down': 10})
endfunction

function! s:Packadd(package) abort
  exe 'packadd ' .. a:package
endfunction

function! vimrc#fzf#Packages() abort
  let packages = map(globpath(&packpath, 'pack/*/opt/*', v:true, v:true), 'fnamemodify(v:val, ":t")')
  return fzf#run({'source': packages, 'sink': function('s:Packadd'), 'down': 10})
endfunction

function! s:CallFernAction(action) abort
  " Action contains shortcut splitted by space, get rid of it
  const action_parts = split(a:action, ' ')
  call fern#action#call(action_parts[0])
endfunction

function! vimrc#fzf#FernActions() abort
  let actions = map(fern#action#list(), 'empty(v:val[0]) || v:val[0] =~ "^<Plug>" ? v:val[1] : v:val[1] .. " [" .. v:val[0] .. "]"')
  return fzf#run({'source': actions, 'sink': function('s:CallFernAction'), 'down': 10})
endfunction

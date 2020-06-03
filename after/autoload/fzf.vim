function! s:ReplaceCurrentWorld(word) abort
  exe 'normal! "_ciw' . a:word
endfunction

function! s:OpenPackageFolder(plugin_name) abort
  if has('win32')
    let program = 'start '
  else
    let program = 'xdg-open '
  endif
  call system(program . packager#plugin(a:plugin_name).dir)
endfunction

function! fzf#Spell() abort
  let suggestions = spellsuggest(expand('<cword>'))
  return fzf#run({'source': suggestions, 'sink': function('s:ReplaceCurrentWorld'), 'down': 10 })
endfunction

function! fzf#Packages() abort
  call packager#Init()
  call fzf#run(fzf#wrap({'source': packager#plugin_names(), 'sink': function('s:OpenPackageFolder')}))
endfunction

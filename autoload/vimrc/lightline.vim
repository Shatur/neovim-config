function s:IsFiletypeIgnored() abort
  if &filetype ==? 'fern'
    return v:true
  endif
  return v:false
endfunction

function vimrc#lightline#reloadColorscheme() abort
  execute 'source' globpath(&rtp, 'autoload/lightline/colorscheme/one.vim')
  call lightline#colorscheme()
  call lightline#update()
endfunction

function vimrc#lightline#CursorsCount() abort
  let vm_info = VMInfos()
  if empty(vm_info)
    return ''
  endif
  return vm_info['current'] . '/' . vm_info['total'] . ' '
endfunction

function vimrc#lightline#Multicursors() abort
  if exists('b:VM_Selection') && !empty(b:VM_Selection)
    return 'MULTI CURSORS'
  endif
  return ''
endfunction

function! vimrc#lightline#Tabs() abort
  if tabpagenr('$') == 1
    return []
  endif
  return lightline#tabs()
endfunction

function! vimrc#lightline#Filetype()
  return winwidth(0) > 70 ? (strlen(&filetype) ? &filetype . ' ' . WebDevIconsGetFileTypeSymbol() : 'no ft') : ''
endfunction

function! vimrc#lightline#Fileformat()
  if winwidth(0) <= 70 || empty(&fileencoding)
    return ''
  endif

  return &fileencoding . ' ' . WebDevIconsGetFileFormatSymbol()
endfunction

function! vimrc#lightline#NearestFunction()
  let function_name = get(b:, 'vista_nearest_method_or_function', '')
  if empty(function_name)
    return ''
  endif
  return ' ' . function_name
endfunction

function vimrc#lightline#Asyncrun() abort
  if &filetype !=? 'qf'
    return ''
  endif
  return get(g:, 'asyncrun_status', '')
endfunction

function vimrc#lightline#Branch() abort
  if s:IsFiletypeIgnored()
    return ''
  endif
  let head = FugitiveHead()
  if empty(head)
    return ''
  endif
  return head . ' '
endfunction

function! vimrc#lightline#Filename()
  if s:IsFiletypeIgnored()
    return ''
  endif
  let filename = expand('%:t')
  if empty(filename)
    return '[Без имени]'
  endif
  if &readonly
    let filename .= g:lightline#bufferline#read_only
  elseif &modified
    let filename .= g:lightline#bufferline#modified
  endif
  return filename
endfunction

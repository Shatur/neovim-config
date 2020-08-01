scriptencoding utf-8

function s:IsFiletypeIgnored() abort
  if &filetype ==? 'fern'
    return v:true
  endif
  return v:false
endfunction

function! vimrc#lightline#Warnings() abort
  if luaeval('#vim.lsp.buf_get_clients() == 0')
    return ''
  endif

  let diagnostics = luaeval("require('lsp-status').diagnostics()")
  let warnings_count = diagnostics['warnings']
  let info_count = diagnostics['info']
  let hints_count = diagnostics['hints']

  let text = ''
  if warnings_count != 0
    let text .= warnings_count .. ' '
  endif
  if info_count != 0
    if !empty(text)
      let text .= ' '
    endif
    let text .= info_count .. ' '
  endif
  if hints_count != 0
    if !empty(text)
      let text .= ' '
    endif
    let text .= hints_count .. ' '
  endif
  return text
endfunction


function! vimrc#lightline#Errors() abort
  if luaeval('#vim.lsp.buf_get_clients() == 0')
    return ''
  endif

  let diagnostics = luaeval("require('lsp-status').diagnostics()")
  let errors_count = diagnostics['errors']
  if errors_count == 0
    return ''
  endif
  return errors_count .. ' '
endfunction

function! vimrc#lightline#LspStatus() abort
  if luaeval('#vim.lsp.buf_get_clients() == 0')
    return ''
  endif

  let messages = luaeval("require('lsp-status').messages()")
  return join(map(messages, '"[" .. v:val.name .. "] " .. v:val.content .. " "'))
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
  return vm_info['current'] .. '/' .. vm_info['total'] .. ' '
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
  return winwidth(0) > 70 ? (strlen(&filetype) ? &filetype .. ' ' .. WebDevIconsGetFileTypeSymbol() : 'no ft') : ''
endfunction

function! vimrc#lightline#Fileformat()
  if winwidth(0) <= 70 || empty(&fileencoding)
    return ''
  endif

  return &fileencoding .. ' ' .. WebDevIconsGetFileFormatSymbol()
endfunction

function! vimrc#lightline#NearestFunction()
  let function_name = get(b:, 'vista_nearest_method_or_function', '')
  if empty(function_name)
    return ''
  endif
  return ' ' .. function_name
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
  return head .. ' '
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

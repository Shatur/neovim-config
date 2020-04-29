if exists('g:started_by_firenvim')
  set laststatus=0

  " For unknown reason Airline want to set this variable to v:true 
  let g:loaded_airline = v:true

  let b:loaded_lastplace_plugin = v:false
  let g:loaded_cmake_projects = v:false
  let g:loaded_close_buffers = v:false
  let g:loaded_compete_lamp = v:false
  let g:loaded_fugitive = v:false
  let g:loaded_gitgutter = v:false
  let g:loaded_lamp = v:false
  let g:loaded_startify = v:false
  let g:loaded_vim_cpp_helper = v:false
  let g:loaded_vista = v:false
  let g:loaded_webdevicons = v:false
  let loaded_nerd_tree = v:false

  autocmd vimrc FocusLost * ++nested write

  nnoremap <silent> <Esc><Esc> :call firenvim#focus_page()<CR>
  nnoremap <silent> <C-z> :write<CR>:call firenvim#hide_frame()<CR>
endif

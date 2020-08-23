if exists('g:started_by_firenvim') || exists('g:vscode')
  finish
endif

let g:fern#renderer = 'nerdfont'
let g:fern#disable_default_mappings = v:true
let g:fern#disable_viewer_hide_cursor = v:true " Causes issue with Neovim Qt

autocmd vimrc BufEnter * ++nested lua require'fern'.hijack_directory()

noremap <A-f> <Cmd>execute 'Fern ' .. fnameescape(asyncrun#get_root('%')) .. ' -reveal=' .. expand('%:p') .. ' -drawer -toggle -keep'<CR>

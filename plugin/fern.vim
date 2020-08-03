if exists('g:started_by_firenvim') || exists('g:vscode')
  finish
endif

let g:fern#renderer = 'nerdfont'
let g:fern#disable_default_mappings = v:true

autocmd vimrc BufEnter * ++nested call vimrc#fern#HijackDirectory()

noremap <A-f> <Cmd>execute 'Fern ' .. fnameescape(asyncrun#get_root('%')) .. ' -reveal=' .. expand('%:p') .. ' -drawer -toggle -keep'<CR>

let g:vsnip_snippet_dir = expand('~/.config/nvim/vsnip')
let g:vsnip_integ_config = {'auto_expand': v:true}

imap <expr> <Tab> pumvisible() ? '<Down>' : vsnip#available(1) ? '<Plug>(vsnip-jump-next)' : '<Tab>'
smap <expr> <Tab> pumvisible() ? '<Down>' : vsnip#available(1) ? '<Plug>(vsnip-jump-next)' : '<Tab>'
imap <expr> <C-Tab> pumvisible() ? '<Up>' : '<Plug>(vsnip-jump-prev)'
smap <expr> <C-Tab> pumvisible() ? '<Up>' : '<Plug>(vsnip-jump-prev)'

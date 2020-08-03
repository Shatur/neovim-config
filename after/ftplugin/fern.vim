setlocal nonumber
setlocal norelativenumber

call glyph_palette#apply()

nmap <buffer> F <Plug>(fern-action-new-dir)
nmap <buffer> N <Plug>(fern-action-new-file)
nmap <buffer> U <Plug>(fern-action-leave)<Plug>(fern-wait)<Plug>(fern-action-tcd:root)<CR>
nmap <buffer> cW <Plug>(fern-action-rename)
nmap <buffer> cc <Plug>(fern-action-clipboard-move)
nmap <buffer> cw <Plug>(fern-action-move)
nmap <buffer> dd <Plug>(fern-action-trash)
nmap <buffer> h <Plug>(fern-action-collapse)
nmap <buffer> m <Plug>(fern-action-mark-toggle)j
nmap <buffer> o <Plug>(fern-action-open:system)
nmap <buffer> p <Plug>(fern-action-clipboard-paste)
nmap <buffer> yy <Plug>(fern-action-clipboard-copy)
nmap <buffer> za <Plug>(fern-action-hidden-toggle)
nmap <buffer> <C-c> <Plug>(fern-action-cancel)
nmap <buffer> <C-CR> <Plug>(fern-action-enter)<Plug>(fern-wait)<Plug>(fern-action-tcd:root)<CR>
nmap <buffer><expr> <F5> <Plug>(fern-action-reload)
nmap <buffer><expr> <CR> fern#smart#leaf('<Plug>(fern-action-open)', '<Plug>(fern-action-expand)', '<Plug>(fern-action-collapse)')
nmap <buffer><expr> <2-LeftMouse> fern#smart#leaf('<Plug>(fern-action-open)', '<Plug>(fern-action-expand)', '<Plug>(fern-action-collapse)')
nmap <buffer><expr> l fern#smart#leaf('<Plug>(fern-action-open)', '<Plug>(fern-action-expand)')

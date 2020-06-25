setlocal nonumber
setlocal norelativenumber
setlocal signcolumn=no

nmap <buffer> <C-c> <Plug>(fern-action-cancel)
nmap <buffer> h <Plug>(fern-action-collapse)
nmap <buffer> m <Plug>(fern-action-move)
nmap <buffer> x <Plug>(fern-action-open:system)
nmap <buffer> R <Plug>(fern-action-rename)
nmap <buffer> D <Plug>(fern-action-trash)
nmap <buffer> C <Plug>(fern-action-clipboard-copy)
nmap <buffer> M <Plug>(fern-action-clipboard-move)
nmap <buffer> P <Plug>(fern-action-clipboard-paste)
nmap <buffer> H <Plug>(fern-action-hidden-toggle)
nmap <buffer> K <Plug>(fern-action-new-dir)
nmap <buffer> N <Plug>(fern-action-new-file)
nmap <buffer> - <Plug>(fern-action-mark-toggle)j
nmap <buffer> <C-h> <Plug>(fern-action-leave)<Plug>(fern-wait)<Plug>(fern-action-tcd:root)<CR>
nmap <buffer> <C-CR> <Plug>(fern-action-enter)<Plug>(fern-wait)<Plug>(fern-action-tcd:root)<CR>
nmap <buffer><expr> <F5> <Plug>(fern-action-reload)
nmap <buffer><expr> <CR> fern#smart#leaf('<Plug>(fern-action-open)', '<Plug>(fern-action-expand)', '<Plug>(fern-action-collapse)')
nmap <buffer><expr> <2-LeftMouse> fern#smart#leaf('<Plug>(fern-action-open)', '<Plug>(fern-action-expand)', '<Plug>(fern-action-collapse)')
nmap <buffer><expr> l fern#smart#leaf('<Plug>(fern-action-open)', '<Plug>(fern-action-expand)')

setlocal nonumber
setlocal norelativenumber
setlocal signcolumn=no

nmap <buffer><expr> <Esc> <Plug>(fern-action-cancel)
nmap <buffer><expr> <C-h> '<Plug>(fern-action-hidden-toggle)'
nmap <buffer><expr> <S-k> '<Plug>(fern-action-leave)<Plug>(fern-wait)<Plug>(fern-action-cd:root)<CR>'
nmap <buffer><expr> <C-CR> '<Plug>(fern-action-enter)<Plug>(fern-wait)<Plug>(fern-action-cd:root)<CR>'
nmap <buffer><expr> h '<Plug>(fern-action-collapse)'
nmap <buffer><expr> l fern#smart#leaf('<Plug>(fern-action-open)', '<Plug>(fern-action-expand)')
nmap <buffer><expr> m '<Plug>(fern-action-move)'
nmap <buffer><expr> r '<Plug>(fern-action-rename)'
nmap <buffer><expr> d '<Plug>(fern-action-trash)'
nmap <buffer><expr> y '<Plug>(fern-action-clipboard-copy)'
nmap <buffer><expr> c '<Plug>(fern-action-clipboard-move)'
nmap <buffer><expr> p '<Plug>(fern-action-clipboard-paste)'
nmap <buffer><expr> o '<Plug>(fern-action-open:system)'
nmap <buffer><expr> D '<Plug>(fern-action-new-dir)'
nmap <buffer><expr> N '<Plug>(fern-action-new-file)'
nmap <buffer><expr> M '<Plug>(fern-action-mark-toggle)'
nmap <buffer><expr> <F5> '<Plug>(fern-action-reload)'
nmap <buffer><expr> <CR> fern#smart#leaf('<Plug>(fern-action-open)', '<Plug>(fern-action-expand)', '<Plug>(fern-action-collapse)')
nmap <buffer><expr> <2-LeftMouse> fern#smart#leaf('<Plug>(fern-action-open)', '<Plug>(fern-action-expand)', '<Plug>(fern-action-collapse)')

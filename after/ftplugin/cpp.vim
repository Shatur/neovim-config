packadd LanguageClient-neovim
packadd vim-cmake-projects
packadd vim-cpp-helper

setlocal formatoptions-=cro
setlocal cinoptions+=L0,j1,(0,ws,Ws
setlocal nowrap

" Disable completion from, use only for syntax highlighting
autocmd! languageClient CompleteDone *

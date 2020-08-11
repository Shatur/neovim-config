" Neovim do not have the ability to disable plugins via native package manager.
" So, mark plugins that not used in VSCode and Firenvim as optional and load
" it by the conditions. 

if exists('g:vscode')
  " For VSCode I use fixed version of EasyMotion
  packadd vscode-easymotion
else
  packadd vim-cool
  packadd vim-easymotion
  packadd vim-one
  packadd vim-cursorword
  packadd vim-visual-multi
  packadd vim-commentary
  packadd scroll.vim
  packadd pear-tree
  packadd neoformat
  packadd fzf.vim

  if !exists('g:started_by_firenvim')
    packadd nerdfont.vim
    packadd glyph-palette.vim
    packadd vista.vim
    packadd vim-terminal-help
    packadd vim-startify
    packadd vim-scriptease
    packadd vim-lastplace
    packadd vim-gtfo
    packadd vim-gitgutter
    packadd vim-fugitive
    packadd vim-flog
    packadd quickfix-reflector.vim
    packadd lightline.vim
    packadd lightline-bufferline
    packadd fzf-checkout.vim
    packadd fern.vim
    packadd fern-renderer-nerdfont.vim
    packadd asyncrun.vim
  endif
endif

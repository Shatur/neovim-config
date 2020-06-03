function! packager#Init() abort
  packadd vim-packager

  call packager#init({'dir': stdpath('data') . '/site/pack/packager', 'disable_default_mappings': v:true})
  call packager#add('kristijanhusak/vim-packager', {'type': 'opt'})

  " FZF
  if has('win32')
    call packager#add('junegunn/fzf')
  endif
  call packager#add('junegunn/fzf.vim')
  call packager#add('stsewd/fzf-checkout.vim')

  " Completion
  call packager#add('neovim/nvim-lsp')
  call packager#add('haorenW1025/completion-nvim')
  call packager#add('haorenW1025/diagnostic-nvim')
  call packager#add('hrsh7th/vim-vsnip')
  call packager#add('hrsh7th/vim-vsnip-integ')

  " Programming
  call packager#add('d86leader/vim-cpp-helper', {'type': 'opt'})
  call packager#add('autozimu/LanguageClient-neovim', {'branch': 'next', 'do': 'bash install.sh'})
  call packager#add('Shatur95/vim-cmake-projects', {'type': 'opt'})
  call packager#add('rafaeldelboni/vim-gdscript3')

  " Git
  call packager#add('tpope/vim-fugitive')
  call packager#add('rbong/vim-flog')
  call packager#add('tpope/vim-rhubarb')
  call packager#add('airblade/vim-gitgutter')

  " Drawer
  call packager#add('lambdalisue/fern.vim')
  call packager#add('lambdalisue/fern-renderer-devicons.vim')

  " Appearance
  call packager#add('vim-airline/vim-airline')
  call packager#add('ryanoasis/vim-devicons')
  call packager#add('rakr/vim-one')

  " Utilities
  call packager#add('farmergreg/vim-lastplace')
  call packager#add('itchyny/vim-cursorword')
  call packager#add('lyokha/vim-xkbswitch')
  call packager#add('mhinz/vim-startify')
  call packager#add('romainl/vim-cool')
  call packager#add('skywind3000/asyncrun.vim')
  call packager#add('stefandtw/quickfix-reflector.vim')
  call packager#add('tmsvg/pear-tree')

  " Functionality
  call packager#add('Asheq/close-buffers.vim')
  call packager#add('dstein64/vim-startuptime', {'type': 'opt'})
  call packager#add('easymotion/vim-easymotion')
  call packager#add('glacambre/firenvim', {'type': 'opt', 'do': ':call firenvim#install(0)'})
  call packager#add('iamcco/markdown-preview.nvim', {'type': 'opt', 'do': ':call mkdp#util#install()'})
  call packager#add('justinmk/vim-gtfo')
  call packager#add('liuchengxu/vista.vim')
  call packager#add('machakann/vim-sandwich')
  call packager#add('machakann/vim-swap')
  call packager#add('matze/vim-move')
  call packager#add('mg979/vim-visual-multi')
  call packager#add('sbdchd/neoformat')
  call packager#add('skywind3000/vim-terminal-help')
  call packager#add('svermeulen/vim-subversive')
  call packager#add('thanthese/tortoise-typing', {'type': 'opt'})
  call packager#add('tomtom/tcomment_vim')
  call packager#add('tpope/vim-eunuch')
  call packager#add('tpope/vim-scriptease')
  call packager#add('tpope/vim-unimpaired')
  call packager#add('vim-scripts/Fold-License')
endfunction

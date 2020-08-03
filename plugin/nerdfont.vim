if exists('g:started_by_firenvim') || exists('g:vscode')
  finish
endif

scriptencoding utf-8

let g:nerdfont#default = ''

let g:nerdfont#path#extension#customs = {
      \ 'gd': '',
      \ 'tscn': '',
      \ 'godot': '',
      \ 'tres': '',
      \ 'glb': '',
      \ 'import': '',
      \ 'material': '',
      \ 'otf': '',
      \ 'cfg': '',
      \ 'pck': '',
      \ 'x86_64': '',
      \ 'desktop': '',
      \ 'opus': '',
      \ 'user': ''
      \}

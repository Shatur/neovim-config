if exists('g:started_by_firenvim') || exists('g:vscode')
  finish
endif

scriptencoding utf-8

let g:WebDevIconsUnicodeDecorateFolderNodes = v:true
let g:DevIconsEnableFoldersOpenClose = v:true
let g:WebDevIconsUnicodeDecorateFileNodesDefaultSymbol = ''

let g:WebDevIconsUnicodeDecorateFileNodesExtensionSymbols = {}
let g:WebDevIconsUnicodeDecorateFileNodesExtensionSymbols['gd'] = ''
let g:WebDevIconsUnicodeDecorateFileNodesExtensionSymbols['tscn'] = ''
let g:WebDevIconsUnicodeDecorateFileNodesExtensionSymbols['godot'] = ''
let g:WebDevIconsUnicodeDecorateFileNodesExtensionSymbols['tres'] = ''
let g:WebDevIconsUnicodeDecorateFileNodesExtensionSymbols['glb'] = ''
let g:WebDevIconsUnicodeDecorateFileNodesExtensionSymbols['import'] = ''
let g:WebDevIconsUnicodeDecorateFileNodesExtensionSymbols['material'] = ''
let g:WebDevIconsUnicodeDecorateFileNodesExtensionSymbols['otf'] = ''
let g:WebDevIconsUnicodeDecorateFileNodesExtensionSymbols['cfg'] = ''
let g:WebDevIconsUnicodeDecorateFileNodesExtensionSymbols['pck'] = ''
let g:WebDevIconsUnicodeDecorateFileNodesExtensionSymbols['x86_64'] = ''
let g:WebDevIconsUnicodeDecorateFileNodesExtensionSymbols['desktop'] = ''
let g:WebDevIconsUnicodeDecorateFileNodesExtensionSymbols['opus'] = ''
let g:WebDevIconsUnicodeDecorateFileNodesExtensionSymbols['user'] = ''

let g:devicons_colors = {
      \ 'String': ['', ''],
      \ 'Type': ['', '', ''],
      \ 'Statement': ['', '', ''],
      \ 'Number': ['', '', '', ''],
      \ 'Function': ['', ''],
      \ 'Identifier': [''],
      \ 'Normal': ['', '', '', '', '', '', '', ''],
      \}

lua require'devicons'.set_icon_colors(vim.g.devicons_colors, {'startify', 'fern'})

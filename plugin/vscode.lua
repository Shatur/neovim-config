if not vim.g.vscode then
  return
end

local vscode = require('vscode')

vim.keymap.set('n', ']b', function() vscode.call('workbench.action.nextEditorInGroup') end, { noremap = true })
vim.keymap.set('n', '[b', function() vscode.call('workbench.action.previousEditorInGroup') end, { noremap = true })
vim.keymap.set('n', '[B', function() vscode.call('workbench.action.firstEditorInGroup') end, { noremap = true })
vim.keymap.set('n', ']B', function() vscode.call('workbench.action.lastEditorInGroup') end, { noremap = true })
vim.keymap.set('n', ']t', function() vscode.call('workbench.action.nextEditorGroup') end, { noremap = true })
vim.keymap.set('n', '[t', function() vscode.call('workbench.action.previousEditorGroup') end, { noremap = true })
vim.keymap.set('n', ']d', function() vscode.call('editor.action.marker.next') end, { noremap = true })
vim.keymap.set('n', '[d', function() vscode.call('editor.action.marker.prev') end, { noremap = true })

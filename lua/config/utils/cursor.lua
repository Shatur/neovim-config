local cursor = {}

function cursor.highlight_current_word()
  local cursorword = vim.fn.expand('<cword>')
  if cursorword == vim.w.cursorword then
    return
  end
  vim.w.cursorword = cursorword
  if vim.w.cursorword_id then
    vim.call('matchdelete', vim.w.cursorword_id)
  end
  if #cursorword > 100 or #cursorword < 3 or string.find(cursorword, '[\192-\255]+') ~= nil then
    vim.w.cursorword_id = false
    return
  end
  vim.w.cursorword_id = vim.fn.matchadd('PmenuSbar', [[\<]] .. cursorword .. [[\>]], -1)
end

return cursor

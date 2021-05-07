local cursor = {}

local timer = vim.loop.new_timer()
local left_regex = vim.regex([[\k*$]])
local right_regex = vim.regex([[^\k*]])

local function match_str(regex, line)
  local begin_index, end_index = regex:match_str(line)
  if not begin_index then
    return ''
  end
  return line:sub(begin_index + 1, end_index)
end

function cursor.highlight_current_word()
  local column = vim.api.nvim_win_get_cursor(0)[2]
  local line = vim.api.nvim_get_current_line()
  local cursorword = match_str(left_regex, line:sub(1, column + 1)) .. match_str(right_regex, line:sub(column + 1)):sub(2)
  if cursorword == vim.w.cursorword then
    return
  end

  vim.w.cursorword = cursorword
  if vim.w.cursorword_id then
    vim.call('matchdelete', vim.w.cursorword_id)
  end
  vim.w.cursorword_id = false
  timer:stop()
  if #cursorword < 100 and #cursorword > 3 then
    timer:start(
      300,
      0,
      vim.schedule_wrap(
      function()
        vim.w.cursorword_id = vim.fn.matchadd('CursorWord', [[\<]] .. cursorword .. [[\>]], -1)
      end
      )
    )
  end
end

return cursor

local M = {}

function M.completion_confirm()
  if vim.fn.pumvisible() ~= 0  then
    if vim.fn.complete_info()['selected'] ~= -1 then
      vim.fn['compe#confirm']()
      return require('nvim-autopairs').esc('')
    else
      return require('nvim-autopairs').esc('<CR>')
    end
  else
    return require('nvim-autopairs').check_break_line_char()
  end
end

return M

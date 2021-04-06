local M = {}

function M.completion_confirm()
  if vim.fn.pumvisible() ~= 0  then
    if vim.fn.complete_info()['selected'] ~= -1 then
      vim.fn['compe#confirm']()
      return require('nvim-autopairs').esc('')
    else
      vim.api.nvim_select_popupmenu_item(0, false, false, {})
      vim.fn['compe#confirm']()
      return require('nvim-autopairs').esc('<C-n>')
    end
  else
    return require('nvim-autopairs').check_break_line_char()
  end
end

return M

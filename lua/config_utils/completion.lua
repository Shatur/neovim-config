local completion = {}

function completion.tab_snippet()
  if require('luasnip').expand_or_jumpable() then
    return vim.api.nvim_replace_termcodes('<Plug>luasnip-expand-or-jump', true, true, true)
  else
    return vim.api.nvim_replace_termcodes('<Tab>', true, true, true)
  end
end

function completion.s_tab_snippet()
  if require('luasnip').jumpable() then
    return vim.api.nvim_replace_termcodes('<Plug>luasnip-jump-prev', true, true, true)
  else
    return vim.api.nvim_replace_termcodes('<S-Tab>', true, true, true)
  end
end

return completion

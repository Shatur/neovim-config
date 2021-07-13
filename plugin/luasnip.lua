if vim.g.started_by_firenvim == true then
  return
end

local luasnip = require('luasnip')
local snippet = luasnip.snippet
local snippet_node = luasnip.snippet_node
local insert_node = luasnip.insert_node
local text_node = luasnip.text_node

luasnip.snippets = {
  cpp = {
    snippet(
      { trig = 'log', name = 'Log message', dscr = 'Print information' },
      snippet_node(1, {
        text_node('UE_LOG(LogTemp, Warning, TEXT("'),
        insert_node(1, 'Some warning message'),
        text_node('"));'),
      })
    ),
  },
}

vim.api.nvim_set_keymap('i', '<Tab>', [[luaeval('require("config_utils.completion").tab_snippet()')]], { expr = true })
vim.api.nvim_set_keymap('i', '<S-Tab>', [[luaeval('require("config_utils.completion").s_tab_snippet()')]], { expr = true })
vim.api.nvim_set_keymap('s', '<Tab>', [[luaeval('require("config_utils.completion").tab_snippet()')]], { noremap = true, expr = true })
vim.api.nvim_set_keymap('s', '<S-Tab>', [[luaeval('require("config_utils.completion").s_tab_snippet()')]], { noremap = true, expr = true })

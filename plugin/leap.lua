local leap = require('leap')
local leap_util = require('leap')

local function leap_forward()
  leap.leap({})
end

local function leap_backward()
  leap.leap({ backward = true })
end

local function leap_forward_x()
  leap.leap({ offset = 1, inclusive_op = true })
end

local function leap_backward_x()
  leap.leap({ offset = 2, backward = true })
end

local function leap_cross_window()
  leap.leap({ target_windows = leap_util.get_enterable_windows() })
end

vim.keymap.set({ 'n', 'x' }, 's', leap_forward, { noremap = true })
vim.keymap.set({ 'n', 'x' }, 'S', leap_backward, { noremap = true })
vim.keymap.set('o', 'z', leap_forward, { noremap = true })
vim.keymap.set('o', 'Z', leap_backward, { noremap = true })
vim.keymap.set('o', 'x', leap_forward_x, { noremap = true })
vim.keymap.set('o', 'X', leap_backward_x, { noremap = true })
vim.keymap.set({ 'n', 'x', 'o' }, 'gs', leap_cross_window, { noremap = true })

local dap = require 'dap'

dap.adapters.cpp = {
  attach = {
    pidProperty = "pid",
    pidSelect = "ask"
  },
  command = 'lldb-vscode',
  env = {
    LLDB_LAUNCH_FLAG_LAUNCH_IN_TTY = "YES"
  },
  name = "lldb"
}

vim.cmd [[
    command! -complete=file -nargs=* DebugLLDB lua require "dap_config".start_lldb({<f-args>})
]]

local M = {}

local function current_env()
  local variables = {}
  for k, v in pairs(vim.fn.environ()) do
    table.insert(variables, string.format("%s=%s", k, v))
  end
  return variables
end

M.start_lldb = function(args)
  local config = {
    type = "cpp",
    name = args[1],
    request = "launch",
    program = table.remove(args, 1),
    args = args,
    env = current_env(),
    cwd = vim.fn.getcwd(),
    MIMode = "gdb",
  }

  dap.launch(dap.adapters.cpp, config)
  dap.repl.open()
end

return M

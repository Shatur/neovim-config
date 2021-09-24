local dap = require('dap')
local debug = {}

function debug.lldb(command, ...)
  local config = {
    type = 'cpp',
    name = command,
    request = 'launch',
    program = command,
    args = { ... },
  }

  dap.run(config)
  dap.repl.open()
end

return debug

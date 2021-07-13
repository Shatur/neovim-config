local dap = require('dap')
local debug = {}

function debug.gdb(command, ...)
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

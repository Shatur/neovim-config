local dap = require('dap')
local debug = {}

function debug.lldb(command, ...)
  local config = {
    type = 'cpp',
    name = command.args,
    request = 'launch',
    program = command.args,
    args = { ... },
  }

  dap.run(config)
  dap.repl.open()
end

return debug

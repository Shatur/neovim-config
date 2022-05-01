local config = {
  enable_diagnostics = false,
  enable_git_status = false,
  enable_modified_markers = false, -- Show markers for files with unsaved changes.
  log_level = 'trace', -- "trace", "debug", "info", "warn", "error", "fatal"
  log_to_file = true, -- true, false, "/path/to/file.log", use :NeoTreeLogs to show the file
}

require('neo-tree').setup(config)

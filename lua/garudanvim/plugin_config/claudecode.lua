-- attempt to load the claudecode plugin
local status_ok, claudecode = pcall(require, "claudecode")
if not status_ok then
  return
end

claudecode.setup({})

-- attempt to load the barbar plugin
local status_ok, options = pcall(require, "barbar")
if not status_ok then
	return
end

-- setup options for barbar
options.setup({})

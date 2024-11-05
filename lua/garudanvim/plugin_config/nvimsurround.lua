-- attempt to load the nvim-surround plugin
local status_ok, options = pcall(require, "nvim-surround")
if not status_ok then
	return
end

-- setup options for barbar
options.setup({})


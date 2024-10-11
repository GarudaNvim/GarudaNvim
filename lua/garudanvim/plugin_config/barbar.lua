local status_ok, options = pcall(require, "barbar")
if not status_ok then
	return
end

options.setup({})

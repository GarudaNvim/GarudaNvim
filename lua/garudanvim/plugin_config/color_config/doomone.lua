local status_ok, options = pcall(require, "doom-one")
if not status_ok then
	return
end

options.setup({})

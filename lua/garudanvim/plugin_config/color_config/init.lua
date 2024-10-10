-- colorschemes configuration goes here
require("garudanvim.plugin_config.color_config.onedarkpro")

-- colorscheme configuration
local colorscheme = "onedark_vivid"

local status_ok, _ = pcall(vim.cmd.colorscheme, colorscheme)
if not status_ok then
	return
end

-- colorschemes configuration goes here
require("garudanvim.plugin_config.color_config.onedarkpro")
require("garudanvim.plugin_config.color_config.dracula")
require("garudanvim.plugin_config.color_config.nordic")

-- colorscheme configuration
local colorscheme = "onedark_dark"

local status_ok, _ = pcall(vim.cmd.colorscheme, colorscheme)
if not status_ok then
	return
end

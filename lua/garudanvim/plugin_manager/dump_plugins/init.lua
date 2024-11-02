-- All the system plugins are dumped in these files
local dump1 = require("garudanvim.plugin_manager.dump_plugins.dump1") -- for all main plugins
local dump2 = require("garudanvim.plugin_manager.dump_plugins.dump2") -- for colorschemes
local dump3 = require("garudanvim.plugin_manager.dump_plugins.dump3") -- for dependencies

-- Dump all your custom plugins in this file
local custom = require("garudanvim.plugin_manager.dump_plugins.custom")

local plugins = {}
vim.list_extend(plugins, dump1)
vim.list_extend(plugins, dump2)
vim.list_extend(plugins, dump3)
vim.list_extend(plugins, custom)
return plugins

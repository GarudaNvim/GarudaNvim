-- HOW TO ADD A NEW LANGUAGE SERVER:
-- 1. Add server name to ensure_installed in lsp/mason.lua
-- 2. Create lsp/servers/<servername>.lua using vim.lsp.config() + vim.lsp.enable()
-- 3. Add require("...lsp.servers.<servername>") here
-- 4. Add formatter to mason.lua ensure_installed + conform.lua formatters_by_ft
-- 5. Run :MasonToolsInstall to install new tools, :Lazy sync for new plugins

require("garudanvim.plugin_config.lsp.servers.clangd")
require("garudanvim.plugin_config.lsp.servers.pyright")
require("garudanvim.plugin_config.lsp.servers.jdtls")
require("garudanvim.plugin_config.lsp.servers.gopls")
require("garudanvim.plugin_config.lsp.servers.ts_ls")

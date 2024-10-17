-- Define a custom highlight group for the header with orange color
vim.api.nvim_set_hl(0, "HeaderHighlight", { fg = "#FFA500" }) -- Orange color

local status_ok, options = pcall(require, "alpha")
if not status_ok then
	return
end

local dashboard = require("alpha.themes.dashboard")
dashboard.section.header.val = {
    
  [[  /$$$$$$                                      /$$           /$$   /$$            /$$              ]],
  [[ /$$__  $$                                    | $$          | $$$ | $$           |__/              ]],
  [[| $$  \__/  /$$$$$$   /$$$$$$  /$$   /$$  /$$$$$$$  /$$$$$$ | $$$$| $$ /$$    /$$ /$$ /$$$$$$/$$$$ ]],
  [[| $$ /$$$$ |____  $$ /$$__  $$| $$  | $$ /$$__  $$ |____  $$| $$ $$ $$|  $$  /$$/| $$| $$_  $$_  $$]],
  [[| $$|_  $$  /$$$$$$$| $$  \__/| $$  | $$| $$  | $$  /$$$$$$$| $$  $$$$ \  $$/$$/ | $$| $$ \ $$ \ $$]],
  [[| $$  \ $$ /$$__  $$| $$      | $$  | $$| $$  | $$ /$$__  $$| $$\  $$$  \  $$$/  | $$| $$ | $$ | $$]],
  [[|  $$$$$$/|  $$$$$$$| $$      |  $$$$$$/|  $$$$$$$|  $$$$$$$| $$ \  $$   \  $/   | $$| $$ | $$ | $$]],
  [[ \______/  \_______/|__/       \______/  \_______/ \_______/|__/  \__/    \_/    |__/|__/ |__/ |__/]],
                                                                                                   
}

dashboard.section.buttons.val = {
	dashboard.button("f", "Find file", ":Telescope find_files <CR>"),
	dashboard.button("e", "New file", ":ene <BAR> startinsert <CR>"),
	dashboard.button("p", "Find project", ":Telescope projects <CR>"),
	dashboard.button("r", "Recently used files", ":Telescope oldfiles <CR>"),
	dashboard.button("t", "Find text", ":Telescope live_grep <CR>"),
	dashboard.button("c", "Configuration", ":e $MYVIMRC <CR>"),
	dashboard.button("q", "Quit Neovim", ":qa<CR>"),
}

local function footer()
-- NOTE: requires the fortune-mod package to work
	-- local handle = io.popen("fortune")
	-- local fortune = handle:read("*a")
	-- handle:close()
	-- return fortune
	return "Power | Speed | Agility"
end

dashboard.section.footer.val = footer()

dashboard.section.footer.opts.hl = "Type"
dashboard.section.header.opts.hl = "HeaderHighlight"
dashboard.section.buttons.opts.hl = "Keyword"

dashboard.opts.opts.noautocmd = true
-- vim.cmd([[autocmd User AlphaReady echo 'ready']])
options.setup(dashboard.opts)

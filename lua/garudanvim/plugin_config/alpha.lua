-- define a custom highlight group for the header with orange color
vim.api.nvim_set_hl(0, "HeaderHighlight", { fg = "#FFA500" }) -- Orange color

-- attempt to load the alpha plugin
local status_ok, options = pcall(require, "alpha")
if not status_ok then
	return
end

-- use the dashboard theme for Alpha's start screen
local dashboard = require("alpha.themes.dashboard")

-- set the ASCII header text displayed on the start screen
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

-- set dashboard buttons with label, description, and Neovim command
dashboard.section.buttons.val = {
	dashboard.button("f", "Find file", ":Telescope find_files <CR>"),
	dashboard.button("e", "New file", ":ene <BAR> startinsert <CR>"),
	dashboard.button("p", "Find project", ":Telescope projects <CR>"),
	dashboard.button("r", "Recently used files", ":Telescope oldfiles <CR>"),
	dashboard.button("t", "Find text", ":Telescope live_grep <CR>"),
	dashboard.button("c", "Configuration", ":e $MYVIMRC <CR>"),
	dashboard.button("q", "Quit Neovim", ":qa<CR>"),
}

-- define the footer text; uses a default message if fortune-mod package is unavailable
local function footer()
-- NOTE: requires the fortune-mod package to work
	-- local handle = io.popen("fortune")
	-- local fortune = handle:read("*a")
	-- handle:close()
	-- return fortune
	return "Power | Speed | Agility" -- static footer text
end

-- set footer text and styles for each section
dashboard.section.footer.val = footer()
dashboard.section.footer.opts.hl = "Type"
dashboard.section.header.opts.hl = "HeaderHighlight"
dashboard.section.buttons.opts.hl = "Keyword"

-- prevent triggering additional autocommands on Alpha screen load
dashboard.opts.opts.noautocmd = true
-- vim.cmd([[autocmd User AlphaReady echo 'ready']])

-- initialize the Alpha dashboard with configured options
options.setup(dashboard.opts)

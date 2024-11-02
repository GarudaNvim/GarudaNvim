-- attempt to load the onedarkpro colorscheme
local status_ok, options = pcall(require, "onedarkpro")
if not status_ok then
	return
end

-- setup options for onedarkpro
options.setup({
  theme = "onedark_dark",

  colors = {
    -- Define your custom orange color
    orange = "#FFA500", -- Hex code for orange
    -- Override the default pink values across the theme
    onedark_dark = {
      ["@keyword"] = "#FFA500",
    },
  },

  highlights = {
    CursorLineNr = { fg = "#ffb66e" },
    TabLineSel = { fg = "#ffb66e" },
    TabLine = { fg = "#ffb66e" },
    BufferCurrent = { fg = "#ffb66e" },
    CursorLine = { bg = "#2D313B" },
    Visual = { bg = "#3e4452" },
    VisualBlock = { bg = "#3e4452" },
    MsgArea = { bg = "#21242b", fg = "#E06C75" },
  },

  options = {
    cursorline = true,  -- Enable cursor line highlighting
  },
})

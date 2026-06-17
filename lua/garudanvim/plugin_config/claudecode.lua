-- attempt to load the claudecode plugin
local status_ok, claudecode = pcall(require, "claudecode")
if not status_ok then
  return
end

local function show_setup_guide()
  vim.notify(
    "Claude Code CLI not found.\n\nInstall it by running in your terminal:\n  npm install -g @anthropic-ai/claude-code\n\nThen restart Neovim.",
    vim.log.levels.WARN,
    { title = "Claude Code Setup Required" }
  )
end

vim.api.nvim_create_autocmd("VimEnter", {
  once = true,
  callback = function()
    vim.defer_fn(function()
      if vim.fn.executable("claude") ~= 1 then
        show_setup_guide()
      end
    end, 1500)
  end,
})

claudecode.setup({})

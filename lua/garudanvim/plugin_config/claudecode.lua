-- attempt to load the claudecode plugin
local status_ok, claudecode = pcall(require, "claudecode")
if not status_ok then
  return
end

-- Check if the Claude Code CLI is installed and on PATH
local function is_cli_installed()
  return vim.fn.executable("claude") == 1
end

-- Check if the user is authenticated:
-- either via ANTHROPIC_API_KEY env var or a credentials file from 'claude login'
local function is_authenticated()
  if os.getenv("ANTHROPIC_API_KEY") then
    return true
  end
  local credentials = vim.fn.expand("~/.claude/.credentials.json")
  if vim.uv.fs_stat(credentials) then
    return true
  end
  return false
end

-- Show a clear, actionable setup guide via vim.notify (rendered by Noice)
local function show_setup_guide()
  local cli_ok  = is_cli_installed()
  local auth_ok = is_authenticated()

  local lines = {
    "Claude Code is not ready yet.",
    "",
  }

  if cli_ok then
    table.insert(lines, "  ✓  CLI installed")
  else
    table.insert(lines, "  ✗  CLI not installed")
    table.insert(lines, "     Run in your terminal:")
    table.insert(lines, "       npm install -g @anthropic-ai/claude-code")
  end

  if auth_ok then
    table.insert(lines, "  ✓  Authenticated")
  else
    table.insert(lines, "  ✗  Not authenticated")
    table.insert(lines, "     Run in your terminal:")
    table.insert(lines, "       claude login")
    table.insert(lines, "     OR add to your shell profile (~/.zshrc / ~/.bashrc):")
    table.insert(lines, "       export ANTHROPIC_API_KEY=\"sk-ant-...\"")
  end

  table.insert(lines, "")
  table.insert(lines, "Restart Neovim once the steps above are complete.")

  vim.notify(
    table.concat(lines, "\n"),
    vim.log.levels.WARN,
    { title = "Claude Code Setup Required" }
  )
end

-- Run the setup check after startup so Noice is fully loaded and renders the
-- notification properly. The message shows on every launch until both checks pass.
vim.api.nvim_create_autocmd("VimEnter", {
  once = true,
  callback = function()
    vim.defer_fn(function()
      if not is_cli_installed() or not is_authenticated() then
        show_setup_guide()
      end
    end, 1500)
  end,
})

claudecode.setup({})

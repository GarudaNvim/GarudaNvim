local M = {}

function M.show(data)
  local current     = data.current     or "unknown"
  local remote_tag  = data.remote_tag  or "unknown"
  local remote_head = data.remote_head or "unknown"
  local behind      = data.behind      or 0

  local stable_status
  if remote_tag == current then
    stable_status = "✓ up to date"
  else
    stable_status = "↑ " .. remote_tag .. " available"
  end

  local commit_status
  if behind == 0 then
    commit_status = "✓ up to date"
  else
    commit_status = behind .. " commit" .. (behind == 1 and "" or "s") .. " behind"
  end

  -- Pad a string to a fixed width
  local W = 58
  local function pad(s)
    return s .. string.rep(" ", math.max(0, W - #s))
  end

  local lines = {
    pad(""),
    pad("  Current version  :  " .. current),
    pad("  Latest stable    :  " .. remote_tag .. "  (" .. stable_status .. ")"),
    pad("  Remote HEAD      :  " .. remote_head .. "  (" .. commit_status .. ")"),
    pad(""),
    pad("  <leader>Zu  →  update to latest stable"),
    pad("  <leader>ZU  →  update to latest commit (bleeding edge)"),
    pad(""),
    pad("  press q or <Esc> to close"),
    pad(""),
  }

  local width  = W + 2  -- +2 for border padding
  local height = #lines
  local row    = math.floor((vim.o.lines - height) / 2)
  local col    = math.floor((vim.o.columns - width) / 2)

  local buf = vim.api.nvim_create_buf(false, true)
  vim.api.nvim_buf_set_lines(buf, 0, -1, false, lines)
  vim.bo[buf].modifiable = false
  vim.bo[buf].buftype    = "nofile"

  local win = vim.api.nvim_open_win(buf, true, {
    relative  = "editor",
    width     = width,
    height    = height,
    row       = row,
    col       = col,
    style     = "minimal",
    border    = "rounded",
    title     = " GarudaNvim ",
    title_pos = "center",
  })

  local function close()
    if vim.api.nvim_win_is_valid(win) then vim.api.nvim_win_close(win, true) end
    if vim.api.nvim_buf_is_valid(buf) then vim.api.nvim_buf_delete(buf, { force = true }) end
  end

  vim.keymap.set("n", "q",     close, { buffer = buf, nowait = true, silent = true })
  vim.keymap.set("n", "<Esc>", close, { buffer = buf, nowait = true, silent = true })
end

return M

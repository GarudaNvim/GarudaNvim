-- attempt to load the gitsigns plugin
local status_ok, options = pcall(require, "gitsigns")
if not status_ok then
	return
end

-- setup options for gitsigns
options.setup({
  -- define symbols for git changes in the sign column
  signs = {
    add          = { text = '┃' },
    change       = { text = '┃' },
    delete       = { text = '_' },
    topdelete    = { text = '‾' },
    changedelete = { text = '~' },
    untracked    = { text = '┆' },
  },

  -- define symbols for staged changes
  signs_staged = {
    add          = { text = '┃' },
    change       = { text = '┃' },
    delete       = { text = '_' },
    topdelete    = { text = '‾' },
    changedelete = { text = '~' },
    untracked    = { text = '┆' },
  },

  signs_staged_enable = true, -- enable signs for staged changes
  signcolumn = true,   -- Toggle with `:Gitsigns toggle_signs          -- show git signs in the sign column
  numhl      = false,  -- Toggle with `:Gitsigns toggle_numhl`         -- highlight line numbers for changes
  linehl     = false,  -- Toggle with `:Gitsigns toggle_linehl`        -- highlight entire line for changes
  word_diff  = false,  -- Toggle with `:Gitsigns toggle_word_diff`     -- show word-level diffs in the buffer

  -- watch for changes in the git directory
  watch_gitdir = {
    follow_files = true       -- follow file changes across renames/moves
  },

  auto_attach = true,         -- automatically attach to git buffers
  attach_to_untracked = false, -- attach only to tracked files
  current_line_blame = false,  -- show git blame for current line

  -- options for inline blame text (if enabled)
  current_line_blame_opts = {
    virt_text = true,
    virt_text_pos = 'eol',     -- position blame text at end of line
    delay = 1000,              -- delay (ms) before blame text appears
    ignore_whitespace = false, -- show blame for whitespace changes
    virt_text_priority = 100,  -- set priority for blame text
    use_focus = true,          -- show blame text only when focused
  },

  current_line_blame_formatter = '<author>, <author_time:%R> - <summary>', -- blame text format
  sign_priority = 6,                   -- priority of git signs
  update_debounce = 100,               -- time (ms) between updates
  status_formatter = nil,              -- use default status formatter
  max_file_length = 40000,             -- disable plugin for large files

  preview_config = {                   -- configure preview window for diffs
    border = 'single',
    style = 'minimal',
    relative = 'cursor',
    row = 0,
    col = 1
  },
})

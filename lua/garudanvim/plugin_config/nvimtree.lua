-- attempt to load the nvim-tree plugin
local status_ok, options = pcall(require, "nvim-tree")
if not status_ok then
	return
end

-- setup options for toggleterm
options.setup({
	filters = {
		dotfiles = false, -- do not filter out dotfiles in the tree view
	},

	disable_netrw = true,               -- disable netrw to avoid conflicts
	hijack_netrw = true,                -- hijack netrw's default behavior
	hijack_cursor = true,               -- move cursor to opened file in tree
	hijack_unnamed_buffer_when_opening = false, -- do not hijack unnamed buffers on open
	sync_root_with_cwd = true,          -- sync root directory with cwd
	respect_buf_cwd = true,             -- respect buffer's cwd when opening files

	update_focused_file = {
		enable = true,                  -- enable auto-updating the focused file
		update_root = true,             -- auto-update root directory on file change
		update_cwd = true,              -- update the cwd on file change
	},

	view = {
		adaptive_size = false,          -- disable adaptive window sizing
		side = "right",                 -- place tree on the right side
		width = 35,                     -- set fixed width of the tree window
		preserve_window_proportions = true, -- keep window proportions intact
		number = true,                  -- show line numbers in the tree
		relativenumber = true,          -- show relative line numbers
	},

	git = {
		enable = true,                  -- enable git integration in tree
		ignore = true,                  -- ignore files listed in .gitignore
		timeout = 500,                  -- set timeout for git integration
	},

	filesystem_watchers = {
		enable = true,                  -- enable filesystem watchers for auto-refresh
	},

	actions = {
		open_file = {
			resize_window = true,       -- resize window on file open
		},
	},

	renderer = {
		root_folder_label = false,        -- do not display root folder label
		highlight_git = true,             -- highlight git status in the tree
		highlight_opened_files = "none",  -- no highlights for opened files

		indent_markers = {
			enable = true,              -- enable indent markers
		},

		icons = {
			show = {
				file = true,            -- display file icons
				folder = true,          -- display folder icons
				folder_arrow = true,    -- display folder arrow icons
				git = true,             -- display git icons
			},

			glyphs = {
				default = "",         -- icon for default files
				symlink = "",         -- icon for symlinked files
				folder = {
					default = "",       -- icon for closed folders
					open = "",          -- icon for opened folders
					empty = "",         -- icon for empty folders
					empty_open = "",    -- icon for opened empty folders
					symlink = "",       -- icon for symlinked folders
					symlink_open = "",  -- icon for opened symlinked folders
					arrow_open = "",    -- icon for folder arrow open
					arrow_closed = "",  -- icon for folder arrow closed
				},
				git = {
					unstaged = "",      -- icon for unstaged changes
					staged = "S",        -- icon for staged changes
					unmerged = "",      -- icon for unmerged changes
					renamed = "➜",       -- icon for renamed files
					deleted = "",       -- icon for deleted files
					untracked = "U",     -- icon for untracked files
					ignored = "◌",       -- icon for ignored files
				},
			},
		},
	},
})

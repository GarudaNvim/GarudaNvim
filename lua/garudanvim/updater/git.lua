local M = {}

local config_dir = vim.fn.stdpath("config")

-- Internal helper: run a git command asynchronously.
-- Calls cb(ok, stdout, stderr) on the main thread.
local function git(args, cb)
  local cmd = vim.list_extend({ "git", "-C", config_dir }, args)
  vim.system(cmd, { text = true }, function(result)
    vim.schedule(function()
      cb(result.code == 0, vim.trim(result.stdout or ""), vim.trim(result.stderr or ""))
    end)
  end)
end

-- Current HEAD description:
--   exact tag  → "v1.4.0"
--   otherwise  → short commit hash (e.g. "abc1234")
function M.get_current_ref(cb)
  git({ "describe", "--tags", "--exact-match" }, function(ok, out)
    if ok and out ~= "" then
      cb(out)
    else
      git({ "rev-parse", "--short", "HEAD" }, function(ok2, out2)
        cb(ok2 and out2 ~= "" and out2 or "unknown")
      end)
    end
  end)
end

-- Latest tag reachable from origin/main (call after fetch)
function M.get_remote_tag(cb)
  git({ "describe", "--tags", "--abbrev=0", "origin/main" }, function(ok, out)
    cb(ok and out ~= "" and out or nil)
  end)
end

-- Short commit hash of origin/main HEAD (call after fetch)
function M.get_remote_head(cb)
  git({ "rev-parse", "--short", "origin/main" }, function(ok, out)
    cb(ok and out ~= "" and out or nil)
  end)
end

-- Number of commits HEAD is behind origin/main
function M.commits_behind(cb)
  git({ "rev-list", "--count", "HEAD..origin/main" }, function(ok, out)
    cb(ok and tonumber(out) or 0)
  end)
end

-- Fetch remote tags and refs (requires network)
function M.fetch(cb)
  git({ "fetch", "--tags", "--prune", "origin" }, function(ok, _, err)
    cb(ok, err)
  end)
end

-- True if the config directory has uncommitted local changes
function M.is_dirty(cb)
  git({ "status", "--porcelain" }, function(ok, out)
    cb(ok and out ~= "")
  end)
end

-- Checkout a specific tag (puts repo in detached HEAD)
function M.checkout_tag(tag, cb)
  git({ "checkout", tag }, function(ok, _, err)
    cb(ok, err)
  end)
end

-- Pull latest commits from origin/main
function M.pull(cb)
  git({ "pull", "origin", "main" }, function(ok, out, err)
    cb(ok, ok and out or err)
  end)
end

-- Verify the config directory is inside a git repository
function M.is_git_repo(cb)
  git({ "rev-parse", "--is-inside-work-tree" }, function(ok)
    cb(ok)
  end)
end

return M

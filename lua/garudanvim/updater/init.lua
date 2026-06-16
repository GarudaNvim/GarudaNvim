local M = {}

local git = require("garudanvim.updater.git")
local ui  = require("garudanvim.updater.ui")

local TITLE = "GarudaNvim Updater"

-- Verify this is a git repo once; cache the result
local _repo_ok = nil
local function verify(cb)
  if _repo_ok ~= nil then cb(_repo_ok); return end
  git.is_git_repo(function(ok)
    _repo_ok = ok
    cb(ok)
  end)
end

local function err(msg)
  vim.notify(msg, vim.log.levels.ERROR, { title = TITLE })
end

local function warn(msg)
  vim.notify(msg, vim.log.levels.WARN, { title = TITLE })
end

local function info(msg)
  vim.notify(msg, vim.log.levels.INFO, { title = TITLE })
end

local function not_a_repo()
  err("Config directory is not a git repository.\nUpdater cannot function.")
end

local function dirty_abort()
  err("Uncommitted changes detected in your config.\nStash or commit them before updating.")
end

-- ─── Public API ───────────────────────────────────────────────────────────────

-- Show a floating window with current version, latest stable, and remote HEAD.
function M.version_info()
  verify(function(ok)
    if not ok then not_a_repo(); return end
    info("Fetching update info...")
    git.fetch(function(fetch_ok, fetch_err)
      if not fetch_ok then
        warn("Fetch failed: " .. fetch_err)
        -- still show local info if possible
      end
      local data = {}
      local remaining = 4
      local function done()
        remaining = remaining - 1
        if remaining == 0 then ui.show(data) end
      end
      git.get_current_ref(function(ref) data.current     = ref; done() end)
      git.get_remote_tag(function(tag)  data.remote_tag  = tag; done() end)
      git.get_remote_head(function(h)   data.remote_head = h;   done() end)
      git.commits_behind(function(n)    data.behind      = n;   done() end)
    end)
  end)
end

-- Silent check — just a notification, no floating window.
function M.check_updates()
  verify(function(ok)
    if not ok then not_a_repo(); return end
    info("Checking for updates...")
    git.fetch(function(fetch_ok, fetch_err)
      if not fetch_ok then warn("Fetch failed: " .. fetch_err); return end
      git.get_current_ref(function(current)
        git.get_remote_tag(function(remote_tag)
          git.commits_behind(function(behind)
            local lines = { "Current: " .. current }
            if remote_tag and remote_tag ~= current then
              table.insert(lines, "Stable update available: " .. remote_tag)
            else
              table.insert(lines, "Stable: up to date")
            end
            if behind > 0 then
              table.insert(lines, behind .. " commit(s) behind main")
            else
              table.insert(lines, "Main branch: up to date")
            end
            info(table.concat(lines, "\n"))
          end)
        end)
      end)
    end)
  end)
end

-- Fetch + checkout the latest stable release tag.
function M.update_stable()
  verify(function(ok)
    if not ok then not_a_repo(); return end
    git.is_dirty(function(dirty)
      if dirty then dirty_abort(); return end
      info("Fetching latest release info...")
      git.fetch(function(fetch_ok, fetch_err)
        if not fetch_ok then warn("Fetch failed: " .. fetch_err); return end
        git.get_current_ref(function(current)
          git.get_remote_tag(function(tag)
            if not tag then
              warn("No stable releases found on remote.")
              return
            end
            if tag == current then
              info("Already on latest stable release: " .. tag)
              return
            end
            vim.ui.input(
              { prompt = "Update GarudaNvim to " .. tag .. "? [y/N]: " },
              function(input)
                if not input or input:lower() ~= "y" then
                  info("Update cancelled.")
                  return
                end
                git.checkout_tag(tag, function(co_ok, co_err)
                  if co_ok then
                    info("Updated to " .. tag .. ".\n\nNext steps:\n  1. :Lazy sync\n  2. Restart Neovim")
                  else
                    err("Checkout failed: " .. co_err)
                  end
                end)
              end
            )
          end)
        end)
      end)
    end)
  end)
end

-- Pull the latest commit from origin/main (bleeding edge).
function M.update_latest()
  verify(function(ok)
    if not ok then not_a_repo(); return end
    git.is_dirty(function(dirty)
      if dirty then dirty_abort(); return end
      vim.ui.input(
        { prompt = "Update GarudaNvim to latest commit on main? [y/N]: " },
        function(input)
          if not input or input:lower() ~= "y" then
            info("Update cancelled.")
            return
          end
          info("Pulling latest changes...")
          git.pull(function(pull_ok, msg)
            if pull_ok then
              info("Updated to latest commit.\n\nNext steps:\n  1. :Lazy sync\n  2. Restart Neovim")
            else
              err("Pull failed: " .. msg)
            end
          end)
        end
      )
    end)
  end)
end

return M

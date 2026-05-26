-- ==========================================================================
-- LAYER: features (Domain Logic)
-- SLICE: navigation/config.lua
-- DESCRIPTION: Implements dynamic project root folder tracking for Telescope.
-- ==========================================================================

local M = {}

-- Helper Function: Automatically searches upwards for a project root indicator
local function get_project_root()
  -- Look for common project markers (.git folder, package.json for JS/TS)
  local root_indicators = { ".git", "package.json" }
  
  -- Use Neovim's built-in buffer utility to find the path of the active file
  local current_file = vim.api.nvim_buf_get_name(0)
  if current_file == "" then return nil end

  -- Traverse up the directory tree to find a match
  for _, indicator in ipairs(root_indicators) do
    local root = vim.fs.find({ indicator }, { path = current_file, upward = true })[1]
    if root then
      -- Return the parent folder containing the marker
      return vim.fs.dirname(root)
    end
  end
  return nil -- Return nil if no project root is discovered
end

function M.setup()
  local status_ok, telescope = pcall(require, "telescope")
  if not status_ok then return end

  local actions = require("telescope.actions")

  telescope.setup({
    defaults = {
      mappings = {
        i = {
          ["<Esc>"] = actions.close,
          ["<C-c>"] = actions.close,
        },
        n = {
          ["<Esc>"] = actions.close,
        },
      },
    },
  })

  -- --------------------------------------------------------------------------
  -- Dynamic Root Finder Mappings
  -- --------------------------------------------------------------------------
  local builtin = require("telescope.builtin")
  local keymap = vim.keymap

  -- Smart Find Files: Locks onto project root even if opened from somewhere else
  keymap.set("n", "<leader>f", function()
    local root = get_project_root()
    if root then
      -- If a root folder is found, force telescope to search only inside it
      builtin.find_files({ cwd = root })
    else
      -- Fallback to default behavior if opening a standalone loose file
      builtin.find_files()
    end
  end, { desc = "Navigation: Smart Root File Search" })

  -- Smart Live Grep: Searches text inside the discovered project root only
  keymap.set("n", "<leader>g", function()
    local root = get_project_root()
    if root then
      builtin.live_grep({ cwd = root })
    else
      builtin.live_grep()
    end
  end, { desc = "Navigation: Smart Root Live Grep" })
end

return M

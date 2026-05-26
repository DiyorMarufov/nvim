-- ==========================================================================
-- LAYER: features (Domain Logic)
-- SLICE: navigation/config.lua
-- DESCRIPTION: Maps Telescope directly to Spacebar + f.
-- ==========================================================================

local M = {}

function M.setup()
  local status_ok, telescope = pcall(require, "telescope")
  if not status_ok then
    return
  end

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
  -- Combo Hotkeys: Leader (Spacebar) + Key
  -- --------------------------------------------------------------------------
  local builtin = require("telescope.builtin")
  local keymap = vim.keymap

  -- Mode: Normal ("n")
  -- Hotkey: Spacebar + f
  -- Action: Instantly opens the fuzzy file finder search overlay
  keymap.set("n", "<leader>f", builtin.find_files, { desc = "Navigation: Space + f File Search" })

  -- Hotkey: Spacebar + g
  -- Action: Instantly opens global live grep project text string search
  keymap.set("n", "<leader>g", builtin.live_grep, { desc = "Navigation: Space + g Live Grep" })
end

return M

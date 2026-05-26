-- ==========================================================================
-- ENTRYPOINT: ~/.config/nvim/init.lua
-- ARCHITECTURE: Feature-Sliced Design (FSD)
-- ==========================================================================

-- Loads native editor behaviors like spacing, line numbers, and clipboard.
require("app.options")

-- Registers your global hotkeys, leader key, and navigation shortcuts.
require("app.keymaps")

-- Initializes your package manager and tells it where your plugin slices live.
require("app.lazy")

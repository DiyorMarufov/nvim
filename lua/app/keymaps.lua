-- ==========================================================================
-- LAYER: app (Shared/Core Configuration)
-- SLICE: keymaps.lua
-- FSD Concept: Shared Core Keybindings
-- ==========================================================================

-- --------------------------------------------------------------------------
-- 1. The Leader Key Configuration
-- --------------------------------------------------------------------------
-- Sets your global Leader hotkey modifier to the Spacebar.
-- The Leader key acts as a prefix trigger for your custom, complex shortcuts.
vim.g.mapleader = " "

-- Sets your local Leader hotkey modifier to the Spacebar as well.
-- Local leader is used for plugin-specific or filetype-specific shortcuts.
vim.g.maplocalleader = " "

-- --------------------------------------------------------------------------
-- 2. API Shorthand Definition
-- --------------------------------------------------------------------------
-- Store Neovim's custom keybinding API utility into a short local variable.
-- keymap.set() accepts 4 parameters: (mode, shortcut, execution, options_table)
local keymap = vim.keymap

-- --------------------------------------------------------------------------
-- 3. Window & Split Navigation (Vim Home Row Mechanics)
-- --------------------------------------------------------------------------
-- Mode: "n" (Normal Mode)
-- Shortcut: Ctrl + h
-- Action: Executes Ctrl + w, followed by h to move your cursor to the left split
keymap.set("n", "<C-h>", "<C-w>h", { desc = "Go to left window pane" })

-- Mode: "n" (Normal Mode)
-- Shortcut: Ctrl + j
-- Action: Executes Ctrl + w, followed by j to move your cursor to the bottom split
keymap.set("n", "<C-j>", "<C-w>j", { desc = "Go to lower window pane" })

-- Mode: "n" (Normal Mode)
-- Shortcut: Ctrl + k
-- Action: Executes Ctrl + w, followed by k to move your cursor to the top split
keymap.set("n", "<C-k>", "<C-w>k", { desc = "Go to upper window pane" })

-- Mode: "n" (Normal Mode)
-- Shortcut: Ctrl + l
-- Action: Executes Ctrl + w, followed by l to move your cursor to the right split
keymap.set("n", "<C-l>", "<C-w>l", { desc = "Go to right window pane" })

-- --------------------------------------------------------------------------
-- 4. Window Split Layout Management
-- --------------------------------------------------------------------------
-- Mode: "n" (Normal Mode)
-- Shortcut: Spacebar + s + v
-- Action: Executes Ctrl + w, followed by v to slice your screen vertically
keymap.set("n", "<leader>sv", "<C-w>v", { desc = "Split layout window vertically" })

-- Mode: "n" (Normal Mode)
-- Shortcut: Spacebar + s + h
-- Action: Executes Ctrl + w, followed by s to slice your screen horizontally
keymap.set("n", "<leader>sh", "<C-w>s", { desc = "Split layout window horizontally" })

-- Mode: "n" (Normal Mode)
-- Shortcut: Spacebar + s + x
-- Action: Runs the literal command ":close" followed by a Carriage Return (<CR>/Enter)
-- to shut down the layout split pane your cursor is currently resting in
keymap.set("n", "<leader>sx", ":close<CR>", { desc = "Close active split layout window" })

-- --------------------------------------------------------------------------
-- 5. Search UX Improvements
-- --------------------------------------------------------------------------
-- Mode: "n" (Normal Mode)
-- Shortcut: Escape key (<Esc>)
-- Action: Runs the command ":nohlsearch" followed by Enter to clear glowing yellow
-- text highlights after searching code. "silent = true" stops text from flashing in the command bar.
keymap.set("n", "<Esc>", ":nohlsearch<CR>", { silent = true, desc = "Clear search match highlights" })

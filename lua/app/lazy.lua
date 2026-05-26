-- ==========================================================================
-- LAYER: app (Shared / Core Configuration)
-- SLICE: lazy.lua
-- DESCRIPTION: Bootstraps and configures the automated lazy.nvim package manager.
-- ==========================================================================

-- Declares a local string variable pointing to the system data cache installation directory
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"

-- Checks if the lazy.nvim folder exists on your storage drive via a filesystem test utility
if not vim.loop.fs_stat(lazypath) then
  -- If missing, drop to a background system shell and execute an automated git clone operation
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- Download the verified stable build branch only
    lazypath,
  })
end

-- Prepend the newly compiled package path directly to Neovim's live runtime system index
vim.opt.rtp:prepend(lazypath)

-- Initialize the package manager engine core loop.
-- The string parameter "plugins" directs lazy.nvim to automatically scan the
-- "lua/plugins/" folder directory and load every isolated file as a module slice.
require("lazy").setup("plugins")

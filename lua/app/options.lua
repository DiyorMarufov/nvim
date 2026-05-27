-- ==========================================================================
-- LAYER: app (Shared/Core Configuration)
-- SLICE: options.lua
-- ==========================================================================

local opt = vim.opt

-- Enables the absolute line number column on the left margin
opt.number = true

-- Enables relative line numbers for fast vertical jumping transitions
opt.relativenumber = true

-- Dictates that a literal tab character visually occupies 2 spaces
opt.tabstop = 2

-- Dictates that code blocks shift exactly by 2 spaces when manipulating indents
opt.shiftwidth = 2

-- Forces Neovim to instantly turn any press of the Tab key into regular empty spaces
opt.expandtab = true

-- Instructs the editor to intelligently guess the correct level of indentation on fresh lines
opt.smartindent = true

-- Ignores letter casing variations when executing search matches
opt.ignorecase = true

-- Overrides ignorecase automatically if your search query contains any capitalized letter
opt.smartcase = true

-- Syncs Neovim's internal registers directly with your system's main OS clipboard
opt.clipboard = "unnamedplus"

-- Pinpoints the sign column permanently to the left wall to avoid layout shaking
opt.signcolumn = "yes"

-- Shortens latency timeout (in ms) before editor trigger events fire for snappy UI responses
opt.updatetime = 250

-- Turns on true 24-bit RGB terminal color maps for modern color scheme themes
opt.termguicolors = true

-- Allow backspace to delete indents, line breaks, and start positions
vim.opt.backspace = "indent,eol,start"

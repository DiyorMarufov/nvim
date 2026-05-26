-- ==========================================================================
-- LAYER: plugins (Public Interface)
-- SLICE: theme.lua
-- FSD Concept: Exposing the Theme package to the Lazy package manager
-- ==========================================================================

return {
  {
    -- The GitHub repository location of the Catppuccin color scheme engine
    "catppuccin/nvim",
    
    -- Assign a clear handle name so other files can reference this plugin easily
    name = "catppuccin",
    
    -- Sets high loading priority (1000) so the theme renders BEFORE your code files open
    priority = 1000,
    
    -- The execution engine function that loads once the plugin files are downloaded
    config = function()
      -- Instructs Neovim to activate the high-contrast "mocha" color scheme palette
      vim.cmd.colorscheme("catppuccin-mocha")
    end,
  }
}

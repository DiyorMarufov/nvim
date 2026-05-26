-- ==========================================================================
-- LAYER: plugins (Public Interface)
-- SLICE: treesitter.lua
-- FSD Concept: Exposing the Abstract Syntax Highlighting compiler to Lazy
-- ==========================================================================

return {
  {
    -- The main GitHub repository hosting the tree-sitter configuration wrapper
    "nvim-treesitter/nvim-treesitter",
    
    -- A post-installation compilation step that updates language highlighting compilers
    build = ":TSUpdate",
    
    -- The configuration logic that triggers once treesitter is downloaded
    config = function()
      -- Pull in the internal treesitter configuration utility safely
      local configs = require("nvim-treesitter.configs")
      
      -- Setup your syntax highlighting definitions parameters
      configs.setup({
        -- Automatically download highlighting parsers for these specific environments:
        ensure_installed = { 
          "lua",          -- Neovim configurations scripts
          "javascript",   -- Standard web scripts
          "typescript",   -- Scaled typed development
          "tsx",          -- React components architectures
          "html",         -- Structural layout formats
          "css",          -- Visual presentation stylesheets
          "json"          -- Data exchange manifests
        },
        
        -- Keeps parsing asynchronous so it never freezes your editor screen UI
        sync_install = false,
        
        -- Enables the advanced abstract syntax coloring engine globally
        highlight = { enable = true },
        
        -- Enables intelligent core indentation rules built on syntax structural blocks
        indent = { enable = true },
      })
    end,
  }
}

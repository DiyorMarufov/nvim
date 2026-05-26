-- ==========================================================================
-- LAYER: plugins (Public Module Interface Interfaces)
-- FILE: treesitter.lua
-- DESCRIPTION: Installs the syntax highlighting engine wrapper safely.
-- ==========================================================================

return {
  {
    -- The core GitHub repository containing the treesitter parsing engine
    "nvim-treesitter/nvim-treesitter",
    
    -- A compilation build hook that updates highlighting syntax files automatically
    build = ":TSUpdate",
    
    -- Configures dependencies so components load in a predictable order
    dependencies = {
      -- Installs structural text object contexts to enhance editing selectors
      "nvim-treesitter/nvim-treesitter-textobjects",
    },
    
    -- The execution callback loop that runs when the codebase registers the module
    config = function()
      -- Safely check if the configurations package module is loaded and present.
      -- status_ok will return true if found; configs will contain the module.
      local status_ok, configs = pcall(require, "nvim-treesitter.configs")
      
      -- If the module is missing (still downloading), break early to protect the boot process
      if not status_ok then
        return
      end
      
      -- Initialize your parser trees parameters definitions
      configs.setup({
        -- Automatically download highlighting parsers for these environments:
        ensure_installed = { 
          "lua",          -- Neovim configuration scripting blocks
          "javascript",   -- Core web scripting layouts
          "typescript",   -- Scaled typed application structures
          "tsx",          -- React UI component parsing models
          "html",         -- Layout structure markup templates
          "css",          -- Style presentational sheets
          "json"          -- Settings meta arrays matrices
        },
        
        -- Keeps parsing modules asynchronous so your UI frame doesn't lock or freeze
        sync_install = false,
        
        -- Activates advanced abstract syntax trees syntax coloring globally
        highlight = { 
          enable = true,
          -- Turns off standard vim regex highlighting so treesitter takes full control
          additional_vim_regex_highlighting = false,
        },
        
        -- Activates smart contextual indentation behaviors matching structural syntax scopes
        indent = { enable = true },
      })
    end,
  }
}

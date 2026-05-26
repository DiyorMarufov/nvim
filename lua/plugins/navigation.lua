-- ==========================================================================
-- LAYER: plugins (Public Index Interface)
-- SLICE: navigation.lua
-- DESCRIPTION: Exposes fuzzy finder utilities to the lazy core loop.
-- ==========================================================================

return {
  {
    -- The core GitHub repository holding the telescope search core files
    "nvim-telescope/telescope.nvim",
    
    -- Specify a verified stable release tag string target
    tag = "0.1.6",
    
    -- Tell lazy to download these core utility dependencies first so telescope can run
    dependencies = { 
      "nvim-lua/plenary.nvim" 
    },
    
    -- The execution callback that triggers once the downloads finish
    config = function()
      -- Fire the setup function we just wrote inside our features layer slice!
      require("features.navigation.config").setup()
    end,
  }
}

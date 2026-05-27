return {
  -- 1. Specify the GitHub repository for the plugin
  "nvim-tree/nvim-tree.lua",

  -- Use the latest stable version releases
  version = "*",

  -- Load immediately on startup (don't lazy-load) so the hotkey works instantly
  lazy = false, 
  
  -- 2. Dependencies required to make nvim-tree look modern and pretty
  dependencies = {
    "nvim-tree/nvim-web-devicons", -- Adds vscode-like file/folder icons based on extensions
  },

  -- 3. The configuration function that runs when Neovim initializes the plugin
  config = function()
    require("nvim-tree").setup({
      -- Sort files and folders alphabetically, respecting upper/lower case
      sort_by = "case_sensitive",
      
      -- Sidebar layout adjustments
      view = {
        width = 35,    -- Set width to 35 columns (slightly wider to fit long FSD folder paths
        side = "left", -- Snap the file tree panel to the left side of the screen
      },
      
      -- Visual rendering options inside the tree layout
      renderer = {
        -- FSD CRITICAL FEATURE: Compresses empty nested folders into a single line.
        -- For example: instead of expanding `features`, then `auth`, then `ui` on 3 rows,
        -- it renders compactly as: "features/auth/ui" if the parent folders are empty.
        group_empty = true, 
        
        -- Colorize file names based on their Git status (e.g., green for new files, yellow for modified)
        highlight_git = true,
      },
      
      -- Auto-synchronization settings between your open tabs and the sidebar
      update_focused_file = {
        -- When you switch files or tabs, nvim-tree automatically scrolls and highlights
        -- that specific file inside the file tree sidebar.
        enable = true, 
      },
    })

    -- 4. Keybindings configuration
    -- Set a Normal-mode ("n") global shortcut: holding Control and pressing 'n' (<C-n>)
    -- will run the command ":NvimTreeToggle", opening or hiding the sidebar.
    vim.keymap.set("n", "<C-n>", ":NvimTreeToggle<CR>", { 
      silent = true,                -- Prevents the command text from flashing at the bottom of the screen
      desc = "Toggle File Tree Side Panel" -- Information tag displayed inside lazy.nvim or telescope maps
    })
  end,
}

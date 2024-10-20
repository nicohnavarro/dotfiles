return {
  -- {
  --   "projekt0n/github-nvim-theme",
  --   name = "github-theme",
  --   lazy = false, -- make sure we load this during startup if it is your main colorscheme
  --   priority = 1000, -- make sure to load this before all the other start plugins
  --   config = function()
  --     require("github-theme").setup({
  --       options = {
  --         -- Compiled file's destination location
  --         compile_path = vim.fn.stdpath("cache") .. "/github-theme",
  --         compile_file_suffix = "_compiled", -- Compiled file suffix
  --         hide_end_of_buffer = true, -- Hide the '~' character at the end of the buffer for a cleaner look
  --         hide_nc_statusline = true, -- Override the underline style for non-active statuslines
  --         transparent = true, -- Disable setting bg (make neovim's background transparent)
  --         terminal_colors = true, -- Set terminal colors (vim.g.terminal_color_*) used in `:terminal`
  --         dim_inactive = false, -- Non focused panes set to alternative background
  --         module_default = true, -- Default enable value for modules
  --         styles = { -- Style to be applied to different syntax groups
  --           comments = "NONE", -- Value is any valid attr-list value `:help attr-list`
  --           functions = "NONE",
  --           keywords = "NONE",
  --           variables = "NONE",
  --           conditionals = "NONE",
  --           constants = "NONE",
  --           numbers = "NONE",
  --           operators = "NONE",
  --           strings = "NONE",
  --           types = "NONE",
  --         },
  --         inverse = { -- Inverse highlight for different types
  --           match_paren = false,
  --           visual = false,
  --           search = false,
  --         },
  --         darken = { -- Darken floating windows and sidebar-like windows
  --           floats = true,
  --           sidebars = {
  --             enable = true,
  --             list = {}, -- Apply dark background to specific windows
  --           },
  --         },
  --         modules = { -- List of various plugins and additional options
  --           -- ...
  --         },
  --       },
  --       palettes = {},
  --       specs = {},
  --       groups = {},
  --     })
  --
  --     vim.cmd("colorscheme github_dark")
  --     -- vim.cmd("colorscheme github_dark_high_contrast")
  --     -- vim.cmd("colorscheme github_light")
  --     -- vim.cmd("colorscheme github_light_high_contrast")
  --   end,
  -- },
  {
    "ellisonleao/gruvbox.nvim",
    priority = 1000,
    config = function()
      require("gruvbox").setup({
        terminal_colors = true, -- add neovim terminal colors
        undercurl = true,
        underline = true,
        bold = true,
        italic = {
          strings = true,
          emphasis = true,
          comments = true,
          operators = false,
          folds = true,
        },
        strikethrough = true,
        invert_selection = false,
        invert_signs = false,
        invert_tabline = false,
        invert_intend_guides = false,
        inverse = true, -- invert background for search, diffs, statuslines and errors
        contrast = "", -- can be "hard", "soft" or empty string
        palette_overrides = {},
        overrides = {},
        dim_inactive = false,
        transparent_mode = true,
      })
      vim.cmd("colorscheme gruvbox")
    end,
  },
  {
    "slugbyte/lackluster.nvim",
    lazy = false,
    priority = 2000,
    init = function()
      -- vim.cmd.colorscheme("lackluster")
      vim.cmd.colorscheme("lackluster-hack") -- my favorite
      -- vim.cmd.colorscheme("lackluster-mint")
    end,
  },
}

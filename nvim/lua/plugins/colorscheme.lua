return {
  {
    "slugbyte/lackluster.nvim",
    lazy = false,
    priority = 1000,
    init = function()
      -- vim.cmd.colorscheme("lackluster-dark")
      -- vim.cmd.colorscheme("lackluster-night")
      -- vim.cmd.colorscheme("lackluster-hack")
      -- vim.cmd.colorscheme("lackluster-mint")
    end,
  },
  -- {
  --   "ellisonleao/gruvbox.nvim",
  --   priority = 1000,
  --   config = function()
  --     require("gruvbox").setup({
  --       terminal_colors = true, -- add neovim terminal colors
  --       undercurl = true,
  --       underline = true,
  --       bold = false,
  --       italic = {
  --         strings = true,
  --         emphasis = true,
  --         comments = true,
  --         operators = false,
  --         folds = true,
  --       },
  --       strikethrough = true,
  --       invert_selection = false,
  --       invert_signs = false,
  --       invert_tabline = false,
  --       invert_intend_guides = false,
  --       inverse = true, -- invert background for search, diffs, statuslines and errors
  --       contrast = "", -- can be "hard", "soft" or empty string
  --       palette_overrides = {
  --         -- Grayscale palette
  --         -- dark0_hard = "#121212",
  --         -- dark0 = "#1e1e1e",
  --         -- dark0_soft = "#242424",
  --         -- dark1 = "#2c2c2c",
  --         -- dark2 = "#373737",
  --         -- dark3 = "#484848",
  --         -- dark4 = "#5a5a5a",
  --         -- light0_hard = "#f5f5f5",
  --         -- light0 = "#e0e0e0",
  --         -- light0_soft = "#d6d6d6",
  --         -- light1 = "#cccccc",
  --         -- light2 = "#bdbdbd",
  --         -- light3 = "#9e9e9e",
  --         -- light4 = "#757575",
  --         --
  --         -- bright_red = "#b31f19",
  --         -- -- bright_green = "#b8bb26",
  --         bright_green = "#ebdbb2",
  --         bright_yellow = "#fabd2f",
  --         -- bright_blue = "#fbf1c7",
  --         -- bright_purple = "#b16286",
  --         -- bright_aqua = "#689d6a",
  --         -- bright_orange = "#d65d0e",
  --         --
  --         -- Neutral colors remain grayscale
  --         -- neutral_red = "#8c8c8c",
  --         -- neutral_green = "#898989",
  --         -- neutral_yellow = "#949494",
  --         -- neutral_blue = "#6f6f6f",
  --         -- neutral_purple = "#787878",
  --         -- neutral_aqua = "#676767",
  --         -- neutral_orange = "#747474",
  --         --
  --         -- -- Faded colors remain grayscale
  --         -- faded_red = "#5e5e5e",
  --         -- faded_green = "#606060",
  --         -- faded_yellow = "#646464",
  --         -- faded_blue = "#525252",
  --         -- faded_purple = "#555555",
  --         -- faded_aqua = "#4f4f4f",
  --         -- faded_orange = "#595959",
  --         --
  --         -- -- Dark and light variations remain grayscale
  --         -- dark_red_hard = "#2c2c2c",
  --         -- dark_red = "#333333",
  --         -- dark_red_soft = "#3a3a3a",
  --         -- light_red_hard = "#bcbcbc",
  --         -- light_red = "#ababab",
  --         -- light_red_soft = "#9e9e9e",
  --         --
  --         -- dark_green_hard = "#2a2a2a",
  --         -- dark_green = "#303030",
  --         -- dark_green_soft = "#383838",
  --         -- light_green_hard = "#c0c0c0",
  --         -- light_green = "#d3d3d3",
  --         -- light_green_soft = "#e0e0e0",
  --         --
  --         -- dark_aqua_hard = "#2b2b2b",
  --         -- dark_aqua = "#323232",
  --         -- dark_aqua_soft = "#3a3a3a",
  --         -- light_aqua_hard = "#c7c7c7",
  --         -- light_aqua = "#d6d6d6",
  --         -- light_aqua_soft = "#e5e5e5",
  --         --
  --         gray = "#8a8a8a",
  --       },
  --       overrides = {},
  --       dim_inactive = false,
  --       transparent_mode = true,
  --     })
  --     vim.cmd("colorscheme gruvbox")
  --   end,
  -- },
  {
    "projekt0n/github-nvim-theme",
    name = "github-theme",
    lazy = false, -- make sure we load this during startup if it is your main colorscheme
    priority = 1000, -- make sure to load this before all the other start plugins
    config = function()
      require("github-theme").setup({
        options = {
          -- Compiled file's destination location
          compile_path = vim.fn.stdpath("cache") .. "/github-theme",
          compile_file_suffix = "_compiled", -- Compiled file suffix
          hide_end_of_buffer = true, -- Hide the '~' character at the end of the buffer for a cleaner look
          hide_nc_statusline = true, -- Override the underline style for non-active statuslines
          transparent = false, -- Disable setting bg (make neovim's background transparent)
          terminal_colors = true, -- Set terminal colors (vim.g.terminal_color_*) used in `:terminal`
          dim_inactive = false, -- Non focused panes set to alternative background
          module_default = true, -- Default enable value for modules
          styles = { -- Style to be applied to different syntax groups
            comments = "italic", -- Value is any valid attr-list value `:help attr-list`
            functions = "NONE",
            keywords = "bold",
            variables = "NONE",
            conditionals = "NONE",
            constants = "NONE",
            numbers = "NONE",
            operators = "NONE",
            strings = "NONE",
            types = "italic,bold",
          },
          inverse = { -- Inverse highlight for different types
            match_paren = false,
            visual = false,
            search = false,
          },
          darken = { -- Darken floating windows and sidebar-like windows
            floats = true,
            sidebars = {
              enable = true,
              list = {}, -- Apply dark background to specific windows
            },
          },
          modules = { -- List of various plugins and additional options
            -- ...
          },
        },
        palettes = {},
        specs = {},
        groups = {},
      })

      -- vim.cmd("colorscheme github_dark")
      -- vim.cmd("colorscheme github_dark_colorblind")
      vim.cmd("colorscheme github_dark_tritanopia")
      -- vim.cmd("colorscheme github_dark_dimmed")
    end,
  },
}

return {
  {
    "slugbyte/lackluster.nvim",
    lazy = false,
    priority = 1000,
    init = function()
      -- vim.cmd.colorscheme("lackluster-dark")
      vim.cmd.colorscheme("lackluster-night")
      -- vim.cmd.colorscheme("lackluster-hack")
      -- vim.cmd.colorscheme("lackluster-mint")
    end,
  },
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
          dim_inactive = true, -- Non focused panes set to alternative background
          module_default = true, -- Default enable value for modules
          styles = { -- Style to be applied to different syntax groups
            comments = "italic", -- Value is any valid attr-list value `:help attr-list`
            functions = "italic",
            keywords = "bold",
            variables = "italic",
            conditionals = "NONE",
            constants = "bold",
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
        palettes = {
          github_dark = {
            --   orange = "#808080", -- Substituted with a medium gray
            --
            --   black = { base = "#000000", bright = "#1a1a1a" },
            --   gray = { base = "#808080", bright = "#808080" },
            --   blue = { base = "#666666", bright = "#4d4d4d" },
            --   green = { base = "#666666", bright = "#4d4d4d" },
            --   magenta = { base = "#666666", bright = "#4d4d4d" },
            --   pink = { base = "#666666", bright = "#4d4d4d" },
            --   red = { base = "#666666", bright = "#4d4d4d" },
            --   white = { base = "#e6e6e6", bright = "#e6e6e6" },
            --   yellow = { base = "#666666", bright = "#4d4d4d" },
            --   cyan = { base = "#999999", bright = "#b3b3b3" },
            --
            --   fg = {
            --     default = "#e6e6e6",
            --     muted = "#b3b3b3",
            --     subtle = "#808080",
            --     on_emphasis = "#ffffff",
            --   },
            --
            --   canvas = {
            --     default = "#b3b3b3",
            --     overlay = "#e6e6e6",
            --     inset = "#cccccc",
            --     subtle = "#e6e6e6",
            --   },
            --
            --   border = {
            --     default = "#e6e6e6",
            --     muted = "#cccccc",
            --     subtle = "#cccccc",
            --   },
            --
            --   neutral = {
            --     emphasis_plus = "#808080",
            --     emphasis = "#808080",
            --     muted = "#999999",
            --     subtle = "#cccccc",
            --   },
            --
            --   accent = {
            --     fg = "#999999",
            --     emphasis = "#808080",
            --     muted = "#999999",
            --     subtle = "#cccccc",
            --   },
            --
            --   success = {
            --     fg = "#808080",
            --     emphasis = "#999999",
            --     muted = "#999999",
            --     subtle = "#cccccc",
            --   },
            --
            --   attention = {
            --     fg = "#808080",
            --     emphasis = "#999999",
            --     muted = "#999999",
            --     subtle = "#cccccc",
            --   },
            --
            --   severe = {
            --     fg = "#808080",
            --     emphasis = "#999999",
            --     muted = "#999999",
            --     subtle = "#cccccc",
            --   },
            --
            --   danger = {
            --     fg = "#808080",
            --     emphasis = "#999999",
            --     muted = "#999999",
            --     subtle = "#cccccc",
            --   },
            --
            --   open = {
            --     fg = "#808080",
            --     emphasis = "#999999",
            --     muted = "#999999",
            --     subtle = "#cccccc",
            --   },
            --
            --   done = {
            --     fg = "#808080",
            --     emphasis = "#999999",
            --     muted = "#999999",
            --     subtle = "#cccccc",
            --   },
            --
            --   closed = {
            --     fg = "#808080",
            --     emphasis = "#999999",
            --     muted = "#999999",
            --     subtle = "#cccccc",
            --   },
            --
            --   sponsors = {
            --     fg = "#808080",
            --     emphasis = "#999999",
            --     muted = "#999999",
            --     subtle = "#cccccc",
            --   },
          },
        },
        specs = {
          github_dark = {
            syntax = {
              bracket = "#f2cc60",
              -- builtin0 = "#808080",
              -- builtin1 = "#666666",
              -- builtin2 = "#808080",
              -- comment = "#4d4d4d",
              -- conditional = "#666666",
              -- const = "#808080",
              -- dep = "#666666",
              field = "#f0f6fc",
              func = "#7ee787",
              -- ident = "#ffffff",
              keyword = "#f0883e",
              -- number = "#808080",
              operator = "#808080",
              -- param = "#e6e6e6",
              -- preproc = "#666666",
              -- regex = "#4d4d4d",
              -- statement = "#666666",
              string = "#cae8ff",
              -- type = "#b3b3b3",
              -- tag = "#e6e6e6",
              -- variable = "#e6e6e6",
            },
          },
        },
        groups = {},
      })

      -- vim.cmd("colorscheme github_dark")
      -- vim.cmd("colorscheme github_dark_colorblind")
      -- vim.cmd("colorscheme github_dark_tritanopia")
      vim.cmd("colorscheme github_dark_dimmed")
    end,
  },
}

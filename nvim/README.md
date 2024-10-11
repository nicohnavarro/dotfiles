# 💤 LazyVim

A starter template for [LazyVim](https://github.com/LazyVim/LazyVim).
Refer to the [documentation](https://lazyvim.github.io/installation) to get started.

## Colorschemes

- TokioNight

```bash
 {
    "folke/tokyonight.nvim",
    priority = 000,
    config = function()
      local transparent = true -- set to true if you would like to enable transparency
      local bg = "#011628"
      local bg_dark = "#011423"
      local bg_highlight = "#143652"
      local bg_search = "#0A64AC"
      local bg_visual = "#275378"
      local fg = "#CBE0F0"
      local fg_dark = "#B4D0E9"
      local fg_gutter = "#627E97"
      local border = "#547998"

      require("tokyonight").setup({
        style = "night",
        transparent = transparent,
        styles = {
          sidebars = transparent and "transparent" or "dark",
          floats = transparent and "transparent" or "dark",
        },
        on_colors = function(colors)
          colors.bg = bg
          colors.bg_dark = transparent and colors.none or bg_dark
          colors.bg_float = transparent and colors.none or bg_dark
          colors.bg_highlight = bg_highlight
          colors.bg_popup = bg_dark
          colors.bg_search = bg_search
          colors.bg_sidebar = transparent and colors.none or bg_dark
          colors.bg_statusline = transparent and colors.none or bg_dark
          colors.bg_visual = bg_visual
          colors.border = border
          colors.fg = fg
          colors.fg_dark = fg_dark
          colors.fg_float = fg
          colors.fg_gutter = fg_gutter
          colors.fg_sidebar = fg_dark
        end,
      })

      -- vim.cmd("colorscheme tokyonight")
    end,
  },

```

- Github

```bash
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
            transparent = true, -- Disable setting bg (make neovim's background transparent)
            terminal_colors = true, -- Set terminal colors (vim.g.terminal_color_*) used in `:terminal`
            dim_inactive = false, -- Non focused panes set to alternative background
            module_default = true, -- Default enable value for modules
            styles = { -- Style to be applied to different syntax groups
              comments = "NONE", -- Value is any valid attr-list value `:help attr-list`
              functions = "NONE",
              keywords = "NONE",
              variables = "NONE",
              conditionals = "NONE",
              constants = "NONE",
              numbers = "NONE",
              operators = "NONE",
              strings = "NONE",
              types = "NONE",
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
        -- vim.cmd("colorscheme github_dark_high_contrast")
        -- vim.cmd("colorscheme github_light")
        -- vim.cmd("colorscheme github_light_high_contrast")
      end,
    },
```

- Kanagawa

```bash
 {
    {
      "rebelot/kanagawa.nvim",
      lazy = false,
      priority = 1000,
      config = function()
        require("kanagawa").setup({
          compile = false, -- enable compiling the colorscheme
          undercurl = true, -- enable undercurls
          commentStyle = { italic = true },
          functionStyle = {},
          keywordStyle = { italic = true },
          statementStyle = { bold = true },
          typeStyle = {},
          transparent = false, -- do not set background color
          dimInactive = false, -- dim inactive window `:h hl-NormalNC`
          terminalColors = true, -- define vim.g.terminal_color_{0,17}
          colors = { -- add/modify theme and palette colors
            palette = {},
            theme = { wave = {}, lotus = {}, dragon = {}, all = {} },
          },
          overrides = function(colors) -- add/modify highlights
            return {}
          end,
          theme = "wave", -- Load "wave" theme when 'background' option is not set
          background = { -- map the value of 'background' option to a theme
            dark = "wave", -- try "dragon" !
            light = "lotus",
          },
        })
      end,
      -- setup must be called before loading
      vim.cmd("colorscheme kanagawa"),
    },
  },

```

- TotalBlack

```bash
{
  "slugbyte/lackluster.nvim",
  lazy = false,
  -- priority = 1000,
  init = function()
    -- vim.cmd.colorscheme("lackluster")
    vim.cmd.colorscheme("lackluster-hack") -- my favorite
    -- vim.cmd.colorscheme("lackluster-mint")
  end,
}
```

return {
  {
    "christoomey/vim-tmux-navigator",
  },
  {
    "tpope/vim-sleuth",
  },
  {
    "tpope/vim-fugitive",
  },
  {
    "tpope/vim-rhubarb",
  },
  {
    "folke/which-key.nvim",
  },
  {
    "windwp/nvim-autopairs",
    event = "InsertEnter",
    config = true,
    opts = {},
  },
 {
  "folke/todo-comments.nvim",
  event = { "BufReadPre", "BufNewFile" },
  dependencies = { "nvim-lua/plenary.nvim" },
  config = function()
    local todo_comments = require("todo-comments")
    local keymap = vim.keymap

    keymap.set("n", "]t", function()
      todo_comments.jump_next()
    end, { desc = "Next todo comment" })

    keymap.set("n", "[t", function()
      todo_comments.jump_prev()
    end, { desc = "Previous todo comment" })
    todo_comments.setup()
  end,
},
  {
    "norcalli/nvim-colorizer.lua",
    config = function()
      require("colorizer").setup()
    end,
  },
}

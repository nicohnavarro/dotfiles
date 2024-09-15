require("config.options")
require("config.keymaps")

-- Set up the Lazy plugin manager
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = "https://github.com/folke/lazy.nvim.git"
  local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
  if vim.v.shell_error ~= 0 then
    vim.api.nvim_echo({
      { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
      { out, "WarningMsg" },
      { "\nPress any key to exit..." },
    }, true, {})
    vim.fn.getchar()
    os.exit(1)
  end
end
vim.opt.rtp:prepend(lazypath)

-- Set up plugins
require("lazy").setup({
  require("plugins.neotree"),
  require("plugins.dressing"),
  require("plugins.colortheme"),
  require("plugins.bufferline"),
  require("plugins.lualine"),
  require("plugins.notify"),
  require("plugins.noice"),
  require("plugins.linting"),
  require("plugins.treesitter"),
  require("plugins.telescope"),
  require("plugins.lsp"),
  require("plugins.autocompletion"),
  require("plugins.none-ls"),
  require("plugins.indent-blankline"),
  require("plugins.misc"),
  require("plugins.lazygit"),
})

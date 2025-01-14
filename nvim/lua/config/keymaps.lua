-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

vim.g.mapleader = " "
local keymap = vim.keymap

keymap.set("i", "jk", "<ESC>", { desc = "Exit Insert Mode" })
keymap.set("n", "<leader>nh", ":nohl<CR>", { desc = "Clear search highlights" })

-- Splits window
keymap.set("n", "<leader>sx", "<cmd>close<CR>", { desc = "Close urrent split" })
keymap.set("n", "<leader>sv", "<C-w>v", { desc = "Split windows verticaly" })
keymap.set("n", "<leader>sh", "<C-w>s", { desc = "Split windows horizontally" })
keymap.set("n", "<leader>se", "<C-w>=", { desc = "Make splits equal size" })

-- Resize windows
keymap.set("n", "<Up>", ":resize -2<CR>", { desc = "Make split taller" })
keymap.set("n", "<Down>", ":resize +2<CR>", { desc = "Make split shorter" })
keymap.set("n", "<Left>", ":vertical resize -2<CR>", { desc = "Make split narrower" })
keymap.set("n", "<Right>", ":vertical resize +2<CR>", { desc = "Make split wider" })

-- Navigate between windows
keymap.set("n", "<C-k>", ":wincmd k<CR>", { desc = "Navigate to up split" })
keymap.set("n", "<C-j>", ":wincmd j<CR>", { desc = "Navigate to down split" })
keymap.set("n", "<C-h>", ":wincmd h<CR>", { desc = "Navigate to left split" })
keymap.set("n", "<C-l>", ":wincmd l<CR>", { desc = "Navigate to right split" })
-- Open tabs
keymap.set("n", "<leader>to", "<cmd>tabnew<CR>", { desc = "Open new tab" })
keymap.set("n", "<leader>tx", "<cmd>tabclose<CR>", { desc = "Close current tab" })
keymap.set("n", "<leader>tn", "<cmd>tabn<CR>", { desc = "Go to next tab" })
keymap.set("n", "<leader>tp", "<cmd>tabp<CR>", { desc = "Go to previous tab" })
keymap.set("n", "<leader>tf", "<cmd>tabnew %<CR>", { desc = "Open current buffer in new tab" })

-- Toogle line wrapping
keymap.set("n", "<leader>lw", "<cmd>set wrap!<CR>", { desc = "Toogle wrap" })

keymap.set("v", "<", "<gv", { desc = "Indent more" })
keymap.set("v", ">", ">gv", { desc = "Indent less" })

keymap.set("n", "[d", vim.diagnostic.goto_prev, { desc = "Go to previous Diag" })
keymap.set("n", "]d", vim.diagnostic.goto_next, { desc = "Go to next Diag" })
keymap.set("n", "<leader>d", vim.diagnostic.open_float, { desc = "Open Diag" })
keymap.set("n", "<leader>q", vim.diagnostic.setloclist, { desc = "IDK" })

-- Buffers
vim.keymap.set("n", "<Tab>", ":bnext<CR>", { desc = "Toogle Buffer" })
vim.keymap.set("n", "<S-Tab>", ":bprevious<CR>", { desc = "Toogle Buffer" })

-- Delete window navigation keymaps
vim.keymap.del("n", "<C-h>")
vim.keymap.del("n", "<C-j>")
vim.keymap.del("n", "<C-k>")
vim.keymap.del("n", "<C-l>")

-- Delete window resizing keymaps
vim.keymap.del("n", "<C-Up>")
vim.keymap.del("n", "<C-Down>")
vim.keymap.del("n", "<C-Left>")
vim.keymap.del("n", "<C-Right>")

-- Tmux navigation key mappings
vim.keymap.set("n", "<C-h>", "<cmd>TmuxNavigateLeft<cr>", { desc = "Navigate to left Tmux pane" })
vim.keymap.set("n", "<C-j>", "<cmd>TmuxNavigateDown<cr>", { desc = "Navigate to lower Tmux pane" })
vim.keymap.set("n", "<C-k>", "<cmd>TmuxNavigateUp<cr>", { desc = "Navigate to upper Tmux pane" })
vim.keymap.set("n", "<C-l>", "<cmd>TmuxNavigateRight<cr>", { desc = "Navigate to right Tmux pane" })
vim.keymap.set("n", "<C-\\>", "<cmd>TmuxNavigatePrevious<cr>", { desc = "Navigate to previous Tmux pane" })

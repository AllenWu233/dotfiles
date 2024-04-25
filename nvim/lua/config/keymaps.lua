-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
local map = vim.keymap.set

-- leader key
vim.g.mapleader = " "

-- ---------- INSERT mode ---------- --
map("i", "jk", "<ESC>")
map("i", "kj", "<ESC>")

-- ---------- VISUAL mode ---------- --
map("v", "jk", "<ESC>")
map("v", "kj", "<ESC>")

-- fold
-- map("v", "<leader>f", "zf", { desc = "Create fold" })

-- ---------- INSERT mode ---------- --
map("i", "<C-s>", "<ESC>:w<CR>", { desc = "Save" }) -- save

-- ---------- NORMAL mode ---------- --
-- select all
map("n", "<C-A>", "ggVGy", { desc = "Copy All" }) -- copy
map("n", "<C-X>", "ggdG", { desc = "Delete All" }) -- delete
map("n", "<leader>=", "gg=G", { desc = "Auto Indent" }) -- auto indent

-- save
map("n", "<C-s>", "<ESC>:w<CR>", { desc = "Save" })

-- move cursor
map("n", "<leader>j", "<C-w>j", { desc = "Move Down" }) -- move down
map("n", "<leader>k", "<C-w>k", { desc = "Move Up" }) -- move up
map("n", "<leader>h", "<C-w>h", { desc = "Move Left" }) -- move left
map("n", "<leader>l", "<C-w>l", { desc = "Move Right" }) -- move right
-- map("n", "<leader>w", "<C-w>w") -- move in a loop

map("n", "<leader>nh", "<cmd>nohl<cr>", { desc = "No Highlight" })

-- buffer
-- map("n", "J", "<cmd>bprevious<cr>", { desc = "Next Buffer" })
-- map("n", "K", "<cmd>bnext<cr>", { desc = "Next Buffer" })
map("n", "X", "<cmd>bdelete<cr>", { desc = "Close Tab" })

-- fold or unfold
map("n", "<leader>a", "za", { desc = "Switch Fold" })


-- ---------- PLUGINS ---------- --
-- compiler.nvim
-- Open compiler
map("n", "<C-b>", "<cmd>CompilerOpen<cr>", { desc = "Open Compiler", noremap = true, silent = true })

-- Redo last selected option
map("n", "B",
  "<cmd>CompilerStop<cr>" -- (Optional, to dispose all tasks before redo)
  .. "<cmd>CompilerRedo<cr>",
  { desc = "Redo Compile", noremap = true, silent = true })

-- Toggle compiler results
map("n", "<F6>", "<cmd>CompilerToggleResults<cr>", { desc = "Toggle Compiler", noremap = true, silent = true })


-- outline.nvim
map("n", "<leader>o", "<cmd>Outline<cr>", { desc = "Open Outline" })

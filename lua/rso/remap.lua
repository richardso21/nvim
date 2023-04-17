vim.g.mapleader = " "

-- tab and s-tab to indent on selection
vim.keymap.set("v", "<tab>", ">")
vim.keymap.set("v", "<s-tab>", "<")
-- vim.keymap.set("i", "<s-tab>", "<esc>V<a")

-- vim source
vim.keymap.set("n", "<leader><leader>", [[:source<CR>]])

-- save quickly
vim.keymap.set("n", "<C-s>", [[:w<CR>]])
vim.keymap.set("n", "<leader>s", [[:w<CR>]])
vim.keymap.set("i", "<C-s>", [[<esc>:w<CR>i]])

-- quitting vim O_O
vim.keymap.set("n", "<leader>qQ", [[:qa<CR>]])
vim.keymap.set("n", "<M-q>", [[:qa<CR>]])

-- NvimTree
vim.keymap.set("n", "<leader>e", [[:NvimTreeToggle<CR>]])

-- Packer
vim.keymap.set("n", "<leader>ps", [[:PackerSync<CR>]])

-- Mason
vim.keymap.set("n", "<leader>lm", [[:Mason<CR>]])

-- toggle spell check
vim.keymap.set("n", "<leader>os", function()
  vim.o.spell = not vim.o.spell
  print("spell: " .. tostring(vim.o.spell))
end)

-- toggle text find highlight
vim.keymap.set("n", "<leader>oh", function()
  vim.o.hls = not vim.o.hls
  print("highlight: " .. tostring(vim.o.hls))
end)

-- Buffers
vim.keymap.set("n", "K", vim.cmd.BufferNext)
vim.keymap.set("n", "J", vim.cmd.BufferPrevious)
vim.keymap.set("n", "L", vim.cmd.BufferMoveNext)
vim.keymap.set("n", "H", vim.cmd.BufferMovePrevious)
vim.keymap.set("n", "<leader>qq", vim.cmd.BufferClose)
vim.keymap.set("n", "<leader>bb", [[:BufferPick<CR>]])
vim.keymap.set("n", "<leader>bq", [[:BufferPickDelete<CR>]])

-- Windows
vim.keymap.set("n", "<C-|>", [[<C-w>v<CR>]])
vim.keymap.set("n", "<C-_>", [[<C-w>s<CR>]])
vim.keymap.set("n", "<C-h>", [[<C-w>h]])
vim.keymap.set("n", "<C-j>", [[<C-w>j]])
vim.keymap.set("n", "<C-k>", [[<C-w>k]])
vim.keymap.set("n", "<C-l>", [[<C-w>l]])
vim.keymap.set("n", "<leader>qw", [[<C-w>q<CR>]])

-- Don't use macros
vim.keymap.set("n", "Q", "<nop>")
vim.keymap.set("n", "q", "<nop>")


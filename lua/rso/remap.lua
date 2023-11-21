vim.g.mapleader = " "

-- vim source
vim.keymap.set("n", "<leader><leader>", [[:source<CR>]])

-- Packer sync
vim.keymap.set("n", "<leader>ps", [[:PackerSync<CR>]])

-- yank to system clipboard
vim.keymap.set({ "n", "v" }, "<leader>y", [["*y<CR>]])

-- save w/ and w/o formatting
vim.keymap.set("n", "<leader>s", [[:w<CR>]])
vim.keymap.set("n", "<leader>ww", [[:w<CR>]])
vim.keymap.set("n", "<leader>wW", [[:noa w<CR>]])

-- quitting vim O_O
vim.keymap.set("n", "<leader>qQ", [[:qa<CR>]])
vim.keymap.set("n", "<leader>qZ", [[:qa!<CR>]])
vim.keymap.set("n", "<M-q>", [[:qa<CR>]])

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

-- tab and s-tab behavior
vim.keymap.set("v", "<tab>", ">")
vim.keymap.set("v", "<s-tab>", "<")
vim.keymap.set("i", "<s-tab>", "<C-d>")

-- Creating windows
vim.keymap.set("n", "<C-|>", [[<C-w>v<CR>]])
vim.keymap.set("n", "<C-_>", [[<C-w>s<CR>]])

-- Focusing b/w windows
vim.keymap.set("n", "<C-h>", [[<C-w>h]])
vim.keymap.set("n", "<C-j>", [[<C-w>j]])
vim.keymap.set("n", "<C-k>", [[<C-w>k]])
vim.keymap.set("n", "<C-l>", [[<C-w>l]])

-- Moving windows
vim.keymap.set("n", "<M-h>", [[<C-w>H]])
vim.keymap.set("n", "<M-j>", [[<C-w>J]])
vim.keymap.set("n", "<M-k>", [[<C-w>K]])
vim.keymap.set("n", "<M-l>", [[<C-w>L]])

-- Resizing windows
vim.keymap.set("n", "<C-up>", [[<C-w>+]])
vim.keymap.set("n", "<C-down>", [[<C-w>-]])
vim.keymap.set("n", "<C-left>", [[<C-w><]])
vim.keymap.set("n", "<C-right>", [[<C-w>>]])
vim.keymap.set("n", "<C-=>", [[<C-w>=]])
vim.keymap.set("n", "<C-+>", [[<C-w>|<C-w>_]])

-- Closing windows
vim.keymap.set("n", "<leader>qw", [[<C-w>q<CR>]])

-- Don't use macros
vim.keymap.set("n", "Q", "<nop>")
vim.keymap.set("n", "q", "<nop>")

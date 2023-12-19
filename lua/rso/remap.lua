vim.g.mapleader = " "

-- vim source
-- vim.keymap.set("n", "<leader><leader>", function() vim.cmd("source") end)

-- open config folder
vim.keymap.set("n", "<leader>zp", function()
  local as = require('auto-session')
  as.AutoSaveSession()
  vim.cmd("cd ~/.config/nvim/")
  vim.cmd("%bd!")
  as.AutoRestoreSession()
  print("config directory")
end)

-- quitting vim O_O
vim.keymap.set("n", "<leader>qQ", function() vim.cmd("qa") end)
vim.keymap.set("n", "<leader>qF", function() vim.cmd("qa!") end)

-- yank to system clipboard
vim.keymap.set({ "n", "v" }, "<leader>y", [["*y<CR>]])

-- open links with gx without netrw
vim.keymap.set("n", 'gx', [[:execute '!open ' . shellescape(expand('<cfile>'), 1)<CR>]])

-- save w/ and w/o formatting
vim.keymap.set("n", "<leader>ww", function() vim.cmd("w") end)
vim.keymap.set("n", "<leader>wW", function() vim.cmd("noa w") end)

-- tab and s-tab behavior
vim.keymap.set("v", "<tab>", ">")
vim.keymap.set("v", "<s-tab>", "<")
vim.keymap.set("i", "<s-tab>", "<C-d>")

-- BUFFERS --

vim.keymap.set("n", "<leader>qq", function()
  require("bufdelete").bufdelete(0)
end)
vim.keymap.set("n", "<leader>qf", function()
  require("bufdelete").bufdelete(0, true) -- force delete
end)

-- WINDOWS --

-- Creating windows
-- vim.keymap.set("n", "<C-|>", [[<C-w>v<CR>]])
-- vim.keymap.set("n", "<C-_>", [[<C-w>s<CR>]])
vim.keymap.set("n", "<leader>nt", [[<C-w>v<CR>]])
vim.keymap.set("n", "<leader>ns", [[<C-w>s<CR>]])

-- Focusing b/w windows
vim.keymap.set("n", "<C-h>", [[<C-w>h]])
vim.keymap.set("n", "<C-j>", [[<C-w>j]])
vim.keymap.set("n", "<C-k>", [[<C-w>k]])
vim.keymap.set("n", "<C-l>", [[<C-w>l]])

-- Moving windows
-- vim.keymap.set("n", "<M-h>", [[<C-w>H]])
-- vim.keymap.set("n", "<M-j>", [[<C-w>J]])
-- vim.keymap.set("n", "<M-k>", [[<C-w>K]])
-- vim.keymap.set("n", "<M-l>", [[<C-w>L]])

-- Resizing windows
vim.keymap.set("n", "<C-up>", [[<C-w>+]])
vim.keymap.set("n", "<C-down>", [[<C-w>-]])
vim.keymap.set("n", "<C-left>", [[<C-w><]])
vim.keymap.set("n", "<C-right>", [[<C-w>>]])
-- vim.keymap.set("n", "<C-=>", [[<C-w>=]])
-- vim.keymap.set("n", "<C-+>", [[<C-w>|<C-w>_]])
vim.keymap.set("n", "<leader>ne", [[<C-w>=]])
vim.keymap.set("n", "<leader>nn", [[<C-w>|<C-w>_]])

-- Closing windows
-- vim.keymap.set("n", "<leader>qw", [[<C-w>q<CR>]])
vim.keymap.set("n", "<leader>nq", [[<C-w>q<CR>]])

-- MISC (Toggles) --

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

vim.keymap.set("n", "<leader>oi", function()
  require('illuminate').toggle()
end)

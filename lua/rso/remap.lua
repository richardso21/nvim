vim.g.mapleader = " "

-- toggle ~~undotree~~ mundo
vim.keymap.set("n", "<leader>u", function()
	vim.cmd("MundoToggle")
end)

vim.keymap.set("n", "<esc>", function()
	vim.cmd("noh")
end, { desc = "Escape and Clear Highlight Search" })

-- open config folder
vim.keymap.set("n", "<leader>zp", function()
	local as = require("auto-session")
	as.AutoSaveSession()
	vim.cmd("lcd ~/.config/nvim/")
	vim.cmd("%bd!")
	as.AutoRestoreSession()
	print("config directory")
end)

-- quitting vim O_O
vim.keymap.set("n", "<leader>qQ", function()
	vim.cmd("qa")
end)
vim.keymap.set("n", "<leader>qF", function()
	vim.cmd("qa!")
end)

-- yank to and paste from system clipboard
vim.keymap.set({ "n", "v" }, "<leader>y", [["*y<CR>]])
vim.keymap.set({ "n" }, "<leader>p", [["*p]])

-- open links with gx without netrw
vim.keymap.set("n", "gx", [[:execute '!open ' . shellescape(expand('<cfile>'), 1)<CR>]])

-- save w/ and w/o formatting
vim.keymap.set("n", "<leader>w", function()
	vim.cmd("w")
end)
vim.keymap.set("n", "<leader>W", function()
	vim.cmd("noa w")
end)

-- tab and s-tab behavior
vim.keymap.set("v", "<tab>", ">")
vim.keymap.set("v", "<s-tab>", "<")
vim.keymap.set("i", "<s-tab>", "<C-d>")

-- WINDOWS --

-- Creating windows
vim.keymap.set("n", "<leader>nt", [[<C-w>v<CR>]])
vim.keymap.set("n", "<leader>ns", [[<C-w>s<CR>]])

-- Focusing b/w windows
vim.keymap.set("n", "<C-h>", [[<C-w>h]])
vim.keymap.set("n", "<C-j>", [[<C-w>j]])
vim.keymap.set("n", "<C-k>", [[<C-w>k]])
vim.keymap.set("n", "<C-l>", [[<C-w>l]])

-- Resizing windows
vim.keymap.set("n", "<C-up>", [[<C-w>+]])
vim.keymap.set("n", "<C-down>", [[<C-w>-]])
vim.keymap.set("n", "<C-left>", [[<C-w><]])
vim.keymap.set("n", "<C-right>", [[<C-w>>]])
vim.keymap.set("n", "<leader>ne", [[<C-w>=]])
vim.keymap.set("n", "<leader>nn", [[<C-w>|<C-w>_]])

-- Closing windows
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

-- togle illumination (highlighting of all instances of a word)
vim.keymap.set("n", "<leader>oi", function()
	require("illuminate").toggle()
	print("illuminate: " .. tostring(not require("illuminate").is_paused()))
end)

-- toggle wrapping
vim.keymap.set("n", "<leader>ow", function()
	vim.wo.wrap = not vim.wo.wrap
	print("wrap: " .. tostring(vim.wo.wrap))
end)

-- toggle ~~copilot~~ supermaven suggestions
vim.keymap.set("n", "<leader>oc", function()
	require("supermaven-nvim.api").toggle()
end)

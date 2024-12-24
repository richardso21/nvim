local vscode = require("vscode")

vim.g.mapleader = " "

-- remove highlight and clear search
vim.keymap.set("n", "<esc>", function()
	vim.cmd("noh")
end, { desc = "Escape and Clear Highlight Search" })

-- yank to and paste from system clipboard
vim.keymap.set({ "n", "v" }, "<leader>y", [["*y<CR>]])
vim.keymap.set({ "n" }, "<leader>p", [["*p]])

-- save w/ and w/o formatting
vim.keymap.set("n", "<leader>w", function()
	vscode.action("workbench.action.files.save")
end)
vim.keymap.set("n", "<leader>W", function()
	vscode.action("workbench.action.files.saveWithoutFormatting")
end)

-- tab and s-tab behavior
vim.keymap.set("v", "<tab>", ">")
vim.keymap.set("v", "<s-tab>", "<")
vim.keymap.set("i", "<s-tab>", "<C-d>")

-- Creating windows
vim.keymap.set("n", "<leader>nt", function()
	vscode.action("workbench.action.splitEditor")
end)
vim.keymap.set("n", "<leader>ns", function()
	vscode.action("workbench.action.splitEditorDown")
end)

-- toggle wrapping
vim.keymap.set("n", "<leader>ow", function()
	vim.wo.wrap = not vim.wo.wrap
	vscode.action("editor.action.toggleWordWrap")
	print("wrap: " .. tostring(vim.wo.wrap))
end)

-- better up/down (from LazyVim)
vim.keymap.set({ "n", "x" }, "j", "gj", { desc = "Down", silent = true })
vim.keymap.set({ "n", "x" }, "k", "gk", { desc = "Up", silent = true })
vim.keymap.set({ "n", "x" }, "<Down>", "gj", { desc = "Down", silent = true })
vim.keymap.set({ "n", "x" }, "<Up>", "gk", { desc = "Up", silent = true })

-- better indenting
vim.keymap.set("v", "<", "<gv")
vim.keymap.set("v", ">", ">gv")
vim.keymap.set("v", "<S-tab>", "<gv")
vim.keymap.set("v", "<tab>", ">gv")

-- lsp keybindings
vim.keymap.set("n", "<leader>ln", function()
	vscode.call("editor.action.rename")
end)

vim.keymap.set("n", "<leader>lr", function()
	vscode.call("editor.action.referenceSearch.trigger")
end)

vim.keymap.set("n", "<M-k>", function()
	vscode.call("editor.action.showHover")
end)

vim.keymap.set("n", "<leader>m", function()
	-- comment out current line
	vscode.call("editor.action.commentLine")
end)
vim.keymap.set("v", "m", function()
	-- comment out selection
	vscode.call("editor.action.commentLine")
	-- send esc to exit visual mode
end)

vim.keymap.set("n", "<leader>e", function()
	-- show file explorer
	vscode.action("workbench.view.explorer")
end)

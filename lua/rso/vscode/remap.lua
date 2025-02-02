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

-- Creating windows
vim.keymap.set("n", "<leader>nt", function()
	vscode.action("workbench.action.splitEditor")
end)
vim.keymap.set("n", "<leader>ns", function()
	vscode.action("workbench.action.splitEditorDown")
end)

-- toggle wrapping
vim.keymap.set("n", "<leader>ow", function()
	vscode.action("editor.action.toggleWordWrap")
end)

-- tab and s-tab behavior; better indenting
vim.keymap.set("i", "<s-tab>", "<C-d>")
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

vim.keymap.set("n", "<leader>e", function()
	-- show file explorer
	vscode.call("workbench.view.explorer")
end)

-- move between buffers/tabs
vim.keymap.set("n", "J", function()
	vscode.call("workbench.action.previousEditorInGroup")
end)

vim.keymap.set("n", "K", function()
	vscode.call("workbench.action.nextEditorInGroup")
end)

-- swap buffers/tabs
vim.keymap.set("n", "H", function()
	vscode.call("workbench.action.moveEditorLeftInGroup")
end)

vim.keymap.set("n", "L", function()
	vscode.call("workbench.action.moveEditorRightInGroup")
end)

-- comments
vim.keymap.set("n", "<leader>m", "<Plug>VSCodeCommentaryLine")
vim.keymap.set("v", "m", "<Plug>VSCodeCommentary", {
	nowait = true, -- prevents the keymap from waiting for a mark to be set
})

-- revert gq keybindings made by vscode-neovim
vim.keymap.del({ "n", "x" }, "gq")
vim.keymap.del({ "n" }, "gqq")

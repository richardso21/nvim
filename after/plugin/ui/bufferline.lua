local bufferline = require("bufferline")

vim.keymap.set("n", "K", function()
	bufferline.cycle(1)
end)
vim.keymap.set("n", "J", function()
	bufferline.cycle(-1)
end)
vim.keymap.set("n", "L", function()
	bufferline.move(1)
end)
vim.keymap.set("n", "H", function()
	bufferline.move(-1)
end)
vim.keymap.set("n", "<leader>bb", function()
	bufferline.pick()
end)
vim.keymap.set("n", "<leader>bp", function()
	vim.cmd("BufferLineTogglePin")
end)
vim.keymap.set("n", "<leader>bq", function()
	bufferline.close_with_pick()
end)
vim.keymap.set("n", "<leader>bQ", function()
	bufferline.close_others()
end)

require("bufferline").setup({
	options = {
		separator_style = "slope",
		diagnostics = "nvim_lsp",
	},
})

require("markview").setup({
	modes = { "n", "no", "c" },
	hybrid_modes = { "n" },
	callbacks = {
		on_enable = function(_, win)
			vim.wo[win].conceallevel = 2
			vim.wo[win].concealcursor = "c"
		end,
	},
	list_items = {
		enable = false,
	},
	headings = {
		shift_width = 0,
	},
})

-- switch indent to 2 for markdown files
vim.api.nvim_create_autocmd("FileType", {
	pattern = "markdown",
	callback = function()
		vim.bo.shiftwidth = 2
	end,
})

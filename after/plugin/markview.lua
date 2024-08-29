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

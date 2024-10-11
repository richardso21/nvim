return {
	-- Indentations
	{
		"echasnovski/mini.indentscope",
		version = "*",
		opts = {
			symbol = "│",
			options = {
				try_as_border = true,
			},
			draw = {
				delay = 50,
			},
		},
		event = "VeryLazy",
	},
	{
		"lukas-reineke/indent-blankline.nvim",
		main = "ibl",
		opts = {
			indent = {
				char = "│",
				tab_char = "│",
			},
			scope = { enabled = false },
			exclude = {
				filetypes = {
					"help",
					"alpha",
					"dashboard",
					"neo-tree",
					"Trouble",
					"trouble",
					"lazy",
					"mason",
					"notify",
					"toggleterm",
					"lazyterm",
				},
			},
		},
		event = "VeryLazy",
	},
}

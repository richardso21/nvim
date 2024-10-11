return {
	"numToStr/Comment.nvim",
	opts = {
		toggler = {
			line = "<leader>m",
			block = "<leader>M",
		},
		opleader = {
			line = "m",
			block = "M",
		},
		mappings = {
			extra = false,
		},
	},
	keys = {
		{ "<leader>m", desc = "Toggle comment line" },
		{ "<leader>M", desc = "Toggle comment block" },
		{ "m", mode = "v", desc = "Toggle comment line" },
		{ "M", mode = "v", desc = "Toggle comment block" },
	},
}

return {
	"williamboman/mason.nvim",
	lazy = false,
	opts = {
		ui = {
			border = "rounded",
		},
	},
	cmd = "Mason",
	keys = { { "<leader>lm", "<cmd>Mason<cr>", desc = "Mason" } },
}

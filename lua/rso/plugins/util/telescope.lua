return {
	"nvim-telescope/telescope.nvim",
	branch = "0.1.x",
	dependencies = { "nvim-lua/plenary.nvim" },
	cmd = { "Telescope" },
	keys = {
		{ "<leader>ff", "<cmd>Telescope find_files<cr>", desc = "Find Files" },
		{ "<leader>fp", "<cmd>Telescope oldfiles<cr>", desc = "Find Recent Files" },
		{ "<leader>fg", "<cmd>Telescope git_files<cr>", desc = "Find Git Files" },
		{ "<leader>ft", "<cmd>Telescope live_grep<cr>", desc = "Find Text" },
		{ "<leader>fT", "<cmd>Telescope grep_string<cr>", desc = "Find Text" },
		{ "<leader>fs", "<cmd>Telescope persisted<cr>", desc = "Find Sessions" },
		{ "<leader>fb", "<cmd>Telescope buffers<cr>", desc = "Find Buffers" },
		{ "<leader>fh", "<cmd>Telescope help_tags<cr>", desc = "Find Help" },
		{ "<leader>fn", "<cmd>Telescope notify<cr>", desc = "Find Notifications" },
	},
}

return {
	"rmagatti/auto-session",
	lazy = false,
	opts = {
		log_level = "error",
		auto_session_suppress_dirs = { "~/", "~/Projects", "~/Downloads", "/" },
		post_restore_cmds = {
			function()
				local nvim_tree = require("nvim-tree")
				nvim_tree.change_dir(vim.fn.getcwd())
			end,
		},
	},
}

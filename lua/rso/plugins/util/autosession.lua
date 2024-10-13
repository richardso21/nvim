return {
	"olimorris/persisted.nvim",
	lazy = false, -- make sure the plugin is always loaded at startup
	opts = {
		autoload = true,
		use_git_branch = true,
	},
	ignored_dirs = {
		{ "~", exact = true },
		{ "~/Downloads", exact = true },
		{ "/", exact = true },
		"~/.local/share/nvim",
	},
	init = function()
		vim.api.nvim_create_autocmd("User", {
			pattern = "PersistedTelescopeLoadPre",
			callback = function()
				-- Save the currently loaded session using the global variable
				require("persisted").save({ session = vim.g.persisted_loaded_session })

				-- Delete all of the open buffers
				vim.api.nvim_input("<ESC>:%bd!<CR>")
			end,
		})
	end,
}

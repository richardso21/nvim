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
		-- when switching sessions, make sure to save the current and clear all buffers
		vim.api.nvim_create_autocmd("User", {
			pattern = "PersistedTelescopeLoadPre",
			callback = function()
				-- Save the currently loaded session using the global variable
				require("persisted").save({ session = vim.g.persisted_loaded_session })

				-- Delete all of the open buffers
				vim.api.nvim_input("<ESC>:%bd!<CR>")
			end,
		})

		-- ignore certain buffer types when saving session
		local ignore_bufs = {
			"alpha",
			"dashboard",
			"fzf",
			"help",
			"lazy",
			"lazyterm",
			"mason",
			"NvimTree",
			"neo-tree",
			"notify",
			"toggleterm",
			"Trouble",
			"trouble",
		}
		vim.api.nvim_create_autocmd("User", {
			pattern = "PersistedSavePre",
			callback = function()
				for _, buf in ipairs(vim.api.nvim_list_bufs()) do
					if vim.tbl_contains(ignore_bufs, vim.bo[buf].filetype) then
						vim.api.nvim_buf_delete(buf, { force = true })
					end
				end
			end,
		})
	end,
}

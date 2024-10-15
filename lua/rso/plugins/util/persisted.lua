-- buffer types to ignore when saving a session
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

return {
	"olimorris/persisted.nvim",
	lazy = false, -- make sure the plugin is always loaded at startup
	opts = {
		autoload = true,
		use_git_branch = true,
		ignored_dirs = {
			{ "~", exact = true },
			{ "~/Downloads", exact = true },
			{ "/", exact = true },
			"~/.local/share/nvim",
		},
		should_save = function()
			-- do not save if arguments are passed or nvim is invoked from stdin
			-- apparently this is not the default behavior (only autoload follows this)
			-- additionally, save only if the current dir is allowed by the config specs
			return vim.fn.argc() == 0 and not vim.g.started_with_stdin and require("persisted").allowed_dir()
		end,
	},
	init = function()
		-- save globals to preserve buffer ordering
		vim.o.sessionoptions = vim.o.sessionoptions .. "," .. "globals"

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

		-- ignore certain buffer types (`ignore_bufs`) when saving a session
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

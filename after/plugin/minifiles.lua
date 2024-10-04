vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

local files = require("mini.files")

local filter_hide = function(fs_entry)
	return not vim.startswith(fs_entry.name, ".")
end

files.setup({
	options = {
		permanent_delete = false, -- move to trash instead
	},
	windows = {
		preview = true,
	},
	content = {
		filter = filter_hide,
	},
})

local minifiles_toggle = function(...)
	if not files.close() then
		files.open(...)
	end
end

local default_opts = {}

vim.keymap.set("n", "<leader>e", function()
	minifiles_toggle()
end)

vim.keymap.set("n", "<leader>E", function()
	minifiles_toggle(vim.api.nvim_buf_get_name(0), false)
end)

-- # Create mapping to show/hide dot-files ~

local show_dotfiles = false

local filter_show = function(_)
	return true
end

local toggle_dotfiles = function()
	show_dotfiles = not show_dotfiles
	local new_filter = show_dotfiles and filter_show or filter_hide
	files.refresh({ content = { filter = new_filter } })
end

vim.api.nvim_create_autocmd("User", {
	pattern = "MiniFilesBufferCreate",
	callback = function(args)
		local buf_id = args.data.buf_id
		-- Tweak left-hand side of mapping to your liking
		vim.keymap.set("n", "g.", toggle_dotfiles, { buffer = buf_id })
	end,
})

-- # Create mappings to modify target window via split ~

local map_split = function(buf_id, lhs, direction)
	local rhs = function()
		-- Make new window and set it as target
		local cur_target = files.get_explorer_state().target_window
		local new_target = vim.api.nvim_win_call(cur_target, function()
			vim.cmd(direction .. " split")
			return vim.api.nvim_get_current_win()
		end)

		files.set_target_window(new_target)
	end

	-- Adding `desc` will result into `show_help` entries
	local desc = "Split " .. direction
	vim.keymap.set("n", lhs, rhs, { buffer = buf_id, desc = desc })
end

vim.api.nvim_create_autocmd("User", {
	pattern = "MiniFilesBufferCreate",
	callback = function(args)
		local buf_id = args.data.buf_id
		-- Tweak keys to your liking
		map_split(buf_id, "<C-s>", "belowright horizontal")
		map_split(buf_id, "<C-t>", "belowright vertical")
	end,
})

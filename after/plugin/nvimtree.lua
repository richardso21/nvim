vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

local view = require("nvim-tree.view")
local api = require("nvim-tree.api")
local augroup = vim.api.nvim_create_augroup
local autocmd = vim.api.nvim_create_autocmd

local DEFAULT_NVIM_TREE_SIZE = 30

require("nvim-tree").setup({
	view = {
		side = "right",
	},
	renderer = {
		group_empty = true,
	},
	actions = {
		open_file = {
			resize_window = false,
		},
	},
	on_attach = function(bufnr)
		local function opts(desc)
			return { desc = "nvim-tree: " .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
		end
		api.config.mappings.default_on_attach(bufnr)

		-- key bind to reset window size
		vim.keymap.set("n", "=", function()
			view.resize(DEFAULT_NVIM_TREE_SIZE)
		end, opts("Reset nvim-tree size"))
	end,
})

-- save nvim-tree window width on WinResized event
augroup("save_nvim_tree_width", { clear = true })
autocmd("WinResized", {
	group = "save_nvim_tree_width",
	pattern = "*",
	callback = function()
		local filetree_winnr = view.get_winnr()
		if filetree_winnr ~= nil and vim.tbl_contains(vim.v.event["windows"], filetree_winnr) then
			vim.t["filetree_width"] = vim.api.nvim_win_get_width(filetree_winnr)
		end
	end,
})

-- restore window size when openning nvim-tree
api.events.subscribe(api.events.Event.TreeOpen, function()
	if vim.t["filetree_width"] ~= nil then
		view.resize(vim.t["filetree_width"])
	end
end)

-- smart toggle nvim-tree
local nvimTreeFocusOrToggle = function(...)
	local nvimTree = require("nvim-tree.api")
	local currentBuf = vim.api.nvim_get_current_buf()
	local currentBufFt = vim.api.nvim_get_option_value("filetype", { buf = currentBuf })
	if currentBufFt == "NvimTree" then
		nvimTree.tree.toggle()
	else
		nvimTree.tree.focus(...)
	end
end

vim.keymap.set("n", "<leader>e", nvimTreeFocusOrToggle)

vim.keymap.set("n", "<leader>E", function()
	nvimTreeFocusOrToggle({ find_file = true })
end)

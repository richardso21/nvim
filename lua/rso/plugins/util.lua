return {
	{ import = "rso.plugins.util" },
	-- Terminal
	{
		"akinsho/toggleterm.nvim",
		version = "*",
		config = true,
		keys = { [[<c-\>]] },
		opts = {
			open_mapping = [[<c-\>]],
			direction = "float",
		},
	},

	-- File Explorer
	{
		"nvim-tree/nvim-tree.lua",
		cmd = { "NvimTreeToggle", "NvimTreeFindFileToggle" },
		keys = {
			{ [[<leader>e]], "<cmd>NvimTreeToggle<CR>" },
			{ [[<leader>E]], "<cmd>NvimTreeFindFileToggle<CR>" },
		},
		opts = {
			view = { side = "right" },
			filesystem_watchers = {
				ignore_dirs = { ".git", "node_modules" },
			},
		},
	},

	-- Git (Fugitive)
	{ "tpope/vim-fugitive", event = "VeryLazy" },
	{
		"lewis6991/gitsigns.nvim",
		opts = {}, -- required for it to actually init
		event = "VeryLazy",
	},

	-- Undo Tree
	{ "simnalamburt/vim-mundo", keys = { { [[<leader>u]], "<cmd>MundoToggle<CR>", desc = "Toggle Undo Tree" } } },

	-- aerial view
	{
		"stevearc/aerial.nvim",
		opts = {},
		keys = { { [[<leader>oa]], "<cmd>AerialToggle<CR>", desc = "Toggle Aerial" } },
	},

	-- Multi-select (VSCode Cmd/Ctrl+D)
	{
		"mg979/vim-visual-multi",
		init = function()
			vim.g.VM_maps = {
				["Add Cursor Down"] = "<C-S-Down>",
				["Add Cursor Up"] = "<C-S-Up>",
			}
		end,
		event = "VeryLazy",
	},

	-- surround
	{
		"tpope/vim-surround",
		event = "VeryLazy",
	},

	-- Fix cursor position changing on buffer switch
	{
		"BranimirE/fix-auto-scroll.nvim",
		config = true,
		event = "VeryLazy",
	},
}

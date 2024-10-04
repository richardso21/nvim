return {
	-- Comments
	{
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
		lazy = false,
	},

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
	"nvim-tree/nvim-tree.lua",

	-- Git (Fugitive)
	"tpope/vim-fugitive",
	{
		"lewis6991/gitsigns.nvim",
		opts = {}, -- required for it to actually init
	},

	-- Undo Tree
	"simnalamburt/vim-mundo",

	-- Session Persist
	{
		"rmagatti/auto-session",
		opts = {
			log_level = "error",
			auto_session_suppress_dirs = { "~/", "~/Projects", "~/Downloads", "/" },
		},
	},

	-- aerial view
	{
		"stevearc/aerial.nvim",
		opts = {},
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
	},

	-- Large Files
	"LunarVim/bigfile.nvim",

	-- surround
	"tpope/vim-surround",

	-- flash
	{
		"folke/flash.nvim",
		event = "VeryLazy",
		opts = {
			label = {
				rainbow = {
					enabled = true,
				},
			},
		},
		keys = {
			{
				"s",
				mode = { "n", "x", "o" },
				function()
					require("flash").jump()
				end,
				desc = "Flash",
			},
			{
				"S",
				mode = { "n", "x", "o" },
				function()
					require("flash").treesitter()
				end,
				desc = "Flash Treesitter",
			},
			{
				"r",
				mode = "o",
				function()
					require("flash").remote()
				end,
				desc = "Remote Flash",
			},
			{
				"R",
				mode = { "o", "x" },
				function()
					require("flash").treesitter_search()
				end,
				desc = "Treesitter Search",
			},
			{
				"<c-s>",
				mode = { "c" },
				function()
					require("flash").toggle()
				end,
				desc = "Toggle Flash Search",
			},
		},
	},
}

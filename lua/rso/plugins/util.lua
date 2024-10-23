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

	-- Undo Tree
	{
		"simnalamburt/vim-mundo",
		lazy = false,
		cmd = { "MundoToggle" },
		keys = { { [[<leader>u]], "<cmd>MundoToggle<CR>", desc = "Toggle Undo Tree" } },
	},

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
		event = "BufReadPost",
	},

	-- surround
	{
		"tpope/vim-surround",
		event = "BufReadPost",
	},

	-- Fix cursor position changing on buffer switch
	{
		"BranimirE/fix-auto-scroll.nvim",
		config = true,
		event = "BufReadPost",
	},

	-- arrow
	{
		"otavioschwanck/arrow.nvim",
		event = "BufReadPost",
		opts = {
			show_icons = true,
			leader_key = "<leader><Tab>",
			buffer_leader_key = "<S-Tab>",
			window = {
				border = "rounded",
			},
		},
	},
}

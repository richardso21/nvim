return {
	-- Theme
	{
		"bluz71/vim-nightfly-colors",
		name = "nightfly",
		lazy = false,
		priority = 1000,
		config = function()
			vim.g.nightflyWinSeparator = 2
			vim.g.nightflyCursorColor = true
			vim.g.nightflyTerminalColors = false
			vim.g.nightflyVirtualTextColor = true
			vim.cmd.colorscheme("nightfly")
		end,
	},

	-- Telescope
	{
		"nvim-telescope/telescope.nvim",
		branch = "0.1.x",
		dependencies = { "nvim-lua/plenary.nvim" },
	},

	-- Bracket/Parenthesis/Brace Pairs
	{
		"windwp/nvim-autopairs",
		event = "InsertEnter",
		opts = {},
	},

	-- UI wowzers
	"nvim-tree/nvim-web-devicons",
	{
		"folke/noice.nvim",
		event = "VeryLazy",
	},
	"MunifTanjim/nui.nvim",
	{
		"rcarriga/nvim-notify",
		opts = {
			top_down = false,
			timeout = 2500,
			fps = 60,
			max_width = 70,
		},
	},
	{
		"stevearc/dressing.nvim",
		opts = {},
	},

	-- scroll animation
	{
		"karb94/neoscroll.nvim",
		opts = {
			easing_function = "sine",
		},
		-- if using neovide, disable neoscroll
		cond = not vim.g.neovide,
	},

	-- Mode Line
	"nvim-lualine/lualine.nvim",

	-- Buffers
	"akinsho/bufferline.nvim",
	"famiu/bufdelete.nvim",

	-- Window Tinting
	{
		"levouh/tint.nvim",
		opts = {
			tint = -55,
		},
	},

	-- Indentations
	{
		"echasnovski/mini.indentscope",
		version = "*",
	},
	{
		"lukas-reineke/indent-blankline.nvim",
		main = "ibl",
	},

	-- Variable illuminate
	"RRethy/vim-illuminate",

	-- Which Key
	{
		"folke/which-key.nvim",
		init = function()
			vim.o.timeout = true
			vim.o.timeoutlen = 300
		end,
	},
}

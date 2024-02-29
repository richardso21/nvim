local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable", -- latest stable release
		lazypath,
	})
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
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
			vim.cmd.colorscheme("nightfly")
		end,
	},

	-- Treesitter
	{
		"nvim-treesitter/nvim-treesitter",
		build = ":TSUpdate",
	},
	-- "nvim-treesitter/nvim-treesitter-context",
	"HiPhish/rainbow-delimiters.nvim",

	-- Telescope
	{
		"nvim-telescope/telescope.nvim",
		tag = "0.1.5",
		dependencies = { "nvim-lua/plenary.nvim" },
	},

	-- LSP & Autocomplete
	{
		"VonHeikemen/lsp-zero.nvim",
		branch = "v3.x",
	},
	"williamboman/mason.nvim",
	"williamboman/mason-lspconfig.nvim",
	"neovim/nvim-lspconfig",
	"hrsh7th/cmp-nvim-lsp",
	"hrsh7th/nvim-cmp",
	"onsails/lspkind.nvim",
	{
		"L3MON4D3/LuaSnip",
		dependencies = { "rafamadriz/friendly-snippets" },
	},
	"saadparwaiz1/cmp_luasnip",
	{
		"folke/trouble.nvim",
		opts = {},
	},
	"folke/neodev.nvim",

	-- Formatting
	"stevearc/conform.nvim",

	-- Linting
	"mfussenegger/nvim-lint",

	-- LaTeX
	{
		"lervag/vimtex",
		lazy = false,
	},

	-- Bracket/Parenthesis/Brace Pairs
	{
		"windwp/nvim-autopairs",
		event = "InsertEnter",
		opts = {},
	},

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

	-- File Explorer
	"nvim-tree/nvim-tree.lua",

	-- Git (Fugitive)
	"tpope/vim-fugitive",
	{
		"lewis6991/gitsigns.nvim",
		opts = {}, -- required for it to actually init
	},

	-- UI wowzers
	"nvim-tree/nvim-web-devicons",
	"folke/noice.nvim",
	"MunifTanjim/nui.nvim",
	{
		"rcarriga/nvim-notify",
		opts = {
			top_down = false,
			timeout = 2500,
			fps = 60,
			-- max_width = 70,
		},
	},
	{
		"stevearc/dressing.nvim",
		opts = {},
	},

	-- scroll bar
	-- "dstein64/nvim-scrollview",

	-- scroll animation
	{
		"karb94/neoscroll.nvim",
		opts = {
			easing_function = "sine",
			pre_hook = function()
				vim.opt.eventignore:append({
					"WinScrolled",
					"CursorMoved",
				})
			end,
			post_hook = function()
				vim.opt.eventignore:remove({
					"WinScrolled",
					"CursorMoved",
				})
			end,
		},
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

	-- Undo Tree
	-- "mbbill/undotree",
	"simnalamburt/vim-mundo",

	-- Session Persist
	{
		"rmagatti/auto-session",
		opts = {
			log_level = "error",
			auto_session_suppress_dirs = { "~/", "~/Projects", "~/Downloads", "/" },
		},
	},

	-- Which Key
	{
		"folke/which-key.nvim",
		init = function()
			vim.o.timeout = true
			vim.o.timeoutlen = 300
		end,
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

	-- Github Copilot
	{
		"zbirenbaum/copilot.lua",
		cmd = "Copilot",
		event = "InsertEnter",
		opts = {
			suggestion = {
				auto_trigger = true,
			},
		},
	},

	-- Discord Rich Presence
	-- {
	-- 	"IogaMaster/neocord",
	-- 	-- event = "VeryLazy",
	-- 	lazy = false,
	-- 	dir = "~/scratch/neocord",
	-- 	opts = {
	-- 		global_timer = true,
	-- 		show_idle = false,
	-- 		-- idle_timeout = 5,
	-- 		-- log_level = "debug",
	-- 	},
	-- },

	-- Multi-select (VSCode Cmd/Ctrl+D)
	{
		"mg979/vim-visual-multi",
	},
})

vim.keymap.set("n", "<leader>zz", function()
	vim.cmd("Lazy")
end)

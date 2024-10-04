return {
	-- Treesitter
	{
		"nvim-treesitter/nvim-treesitter",
		build = ":TSUpdate",
	},
	"nvim-treesitter/nvim-treesitter-context",
	"HiPhish/rainbow-delimiters.nvim",

	-- LSP & Autocomplete
	{ "VonHeikemen/lsp-zero.nvim", branch = "v4.x", lazy = true, config = false },
	{ "williamboman/mason.nvim", lazy = false, config = true },
	"williamboman/mason-lspconfig.nvim",
	{
		"neovim/nvim-lspconfig",
		cmd = { "LspInfo", "LspInstall", "LspStart" },
		event = { "BufReadPre", "BufNewFile" },
		dependencies = {
			{ "hrsh7th/cmp-nvim-lsp" },
			{ "williamboman/mason.nvim" },
			{ "williamboman/mason-lspconfig.nvim" },
		},
	},
	"hrsh7th/cmp-nvim-lsp",
	{ "hrsh7th/nvim-cmp", event = "InsertEnter" },
	"onsails/lspkind.nvim",
	{
		"L3MON4D3/LuaSnip",
		dependencies = { "rafamadriz/friendly-snippets" },
	},
	"saadparwaiz1/cmp_luasnip",

	-- Formatting
	{
		"stevearc/conform.nvim",
		event = { "BufWritePre" },
		cmd = { "ConformInfo" },
	},

	-- Linting
	"mfussenegger/nvim-lint",

	-- LaTeX
	{
		"lervag/vimtex",
		lazy = false,
	},

	-- Markdown preview support
	{
		"MeanderingProgrammer/render-markdown.nvim",
		opts = {
			heading = {
				backgrounds = {
					"RenderMarkdownH1Bg",
					"RenderMarkdownH2Bg",
				},
			},
		},
	},

	-- AI Autocomplete
	{
		"supermaven-inc/supermaven-nvim",
		event = "InsertEnter",
		opts = {
			keymaps = {
				accept_suggestion = "<M-l>",
				accept_word = "<M-j>",
			},
		},
	},
}

return {
	{ import = "rso.plugins.ui" },

	-- Theme
	{
		"bluz71/vim-nightfly-colors",
		name = "nightfly",
		lazy = false,
		priority = 1000,
		init = function()
			vim.g.nightflyWinSeparator = 2
			vim.g.nightflyCursorColor = true
			vim.g.nightflyTerminalColors = false
			vim.g.nightflyVirtualTextColor = true
			vim.cmd.colorscheme("nightfly")
		end,
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
		lazy = false,
		keys = {
			-- dismiss notifications
			{ "<leader>N", "<cmd>NoiceDismiss<cr>", desc = "Dismiss Notifications" },
		},
		opts = {
			lsp = {
				-- override markdown rendering so that **cmp** and other plugins use **Treesitter**
				progress = {
					enabled = true,
				},
				override = {
					["vim.lsp.util.convert_input_to_markdown_lines"] = true,
					["vim.lsp.util.stylize_markdown"] = true,
					["cmp.entry.get_documentation"] = true,
				},
				hover = {
					silent = true,
				},
			},
			-- you can enable a preset for easier configuration
			presets = {
				bottom_search = true, -- use a classic bottom cmdline for search
				command_palette = true, -- position the cmdline and popupmenu together
				long_message_to_split = true, -- long messages will be sent to a split
				lsp_doc_border = true, -- add a border to hover docs and signature help
			},
		},
	},
	"MunifTanjim/nui.nvim",
	{
		"rcarriga/nvim-notify",
		event = "VeryLazy",
		opts = {
			top_down = false,
			timeout = 2500,
			fps = 60,
			max_width = 70,
		},
		init = function()
			require("notify")("What da dog doin?")
		end,
	},
	{
		"stevearc/dressing.nvim",
		opts = {},
		event = "VeryLazy",
	},

	-- scroll animation
	{
		"karb94/neoscroll.nvim",
		enabled = false,
		opts = {
			easing_function = "sine",
		},
		-- if using neovide, disable neoscroll
		cond = not vim.g.neovide,
		lazy = false,
	},

	-- Window Tinting
	{
		"levouh/tint.nvim",
		opts = {
			tint = -55,
		},
		event = "VeryLazy",
	},

	-- Variable illuminate
	{
		"RRethy/vim-illuminate",
		event = "VeryLazy",
		keys = { { [[<leader>oi]], "<cmd>IlluminateToggle<cr>", desc = "Toggle Illuminate" } },
	},

	-- hex colorizer
	{
		"norcalli/nvim-colorizer.lua",
		event = "VeryLazy",
		opts = { "*" },
		keys = {
			{ "<leader>oz", "<cmd>ColorizerToggle<cr>", desc = "toggle colorizer" },
		},
	},
}

return {
	{
		"nvim-treesitter/nvim-treesitter",
		event = "BufReadPre",
		build = ":TSUpdate",
		config = function()
			local configs = require("nvim-treesitter.configs")

			---@diagnostic disable-next-line: missing-fields
			configs.setup({
				auto_install = true,
				ensure_installed = {
					"c",
					"lua",
					"vim",
					"vimdoc",
					"query",
					"javascript",
					"html",
					"python",
					"go",
					"regex",
				},
				sync_install = false,
				highlight = { enable = true },
				indent = { enable = true },
			})
		end,
	},
	{ "nvim-treesitter/nvim-treesitter-context", event = "BufReadPre" },
	{
		"HiPhish/rainbow-delimiters.nvim",
		event = "BufReadPre",
		config = function()
			-- This module contains a number of default definitions
			local rainbow_delimiters = require("rainbow-delimiters")

			vim.g.rainbow_delimiters = {
				strategy = {
					[""] = rainbow_delimiters.strategy["global"],
					vim = rainbow_delimiters.strategy["local"],
				},
				highlight = {
					"RainbowDelimiterYellow",
					"RainbowDelimiterBlue",
					"RainbowDelimiterOrange",
					"RainbowDelimiterGreen",
					"RainbowDelimiterViolet",
					"RainbowDelimiterCyan",
				},
			}
		end,
	},
}

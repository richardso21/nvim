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

-- This module contains a number of default definitions
local rainbow_delimiters = require("rainbow-delimiters")

---@type rainbow_delimiters.config
vim.g.rainbow_delimiters = {
	strategy = {
		[""] = rainbow_delimiters.strategy["global"],
		vim = rainbow_delimiters.strategy["local"],
	},
	query = {
		[""] = "rainbow-delimiters",
		lua = "rainbow-blocks",
	},
	priority = {
		[""] = 110,
		lua = 210,
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

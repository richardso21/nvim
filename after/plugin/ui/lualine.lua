-- don't need to show mode or cmd on command bar
vim.opt.showmode = false
vim.opt.showcmd = false

-- modified ayu_dark theme
local colors = {
	color2 = "#000C15",
	color3 = "#ffee99",
	color4 = "#e6e1cf",
	color5 = "#071e30",
	color13 = "#7FDBCA",
	color10 = "#36a3d9",
	color8 = "#f07178",
	color9 = "#3e4b59",
}

local theme = {
	visual = {
		a = { fg = colors.color2, bg = colors.color3, gui = "bold" },
		b = { fg = colors.color4, bg = colors.color5 },
	},
	replace = {
		a = { fg = colors.color2, bg = colors.color8, gui = "bold" },
		b = { fg = colors.color4, bg = colors.color5 },
	},
	inactive = {
		c = { fg = colors.color4, bg = colors.color2 },
		a = { fg = colors.color4, bg = colors.color5, gui = "bold" },
		b = { fg = colors.color4, bg = colors.color5 },
	},
	normal = {
		c = { fg = colors.color9, bg = colors.color2 },
		a = { fg = colors.color2, bg = colors.color10, gui = "bold" },
		b = { fg = colors.color4, bg = colors.color5 },
	},
	insert = {
		a = { fg = colors.color2, bg = colors.color13, gui = "bold" },
		b = { fg = colors.color4, bg = colors.color5 },
	},
}

require("lualine").setup({
	options = {
		theme = theme,
		component_separators = "",
		section_separators = { left = "", right = "" },
	},
	sections = {
		lualine_a = {
			{ "mode" },
		},
		lualine_b = {
			{ "filename", file_status = false },
			"branch",
		},
		lualine_c = { { "filename", path = 1 } },
		lualine_x = { "diagnostics", "diff" },
		lualine_y = { "filetype" },
		lualine_z = {
			{ "location" },
		},
	},
	inactive_sections = {
		lualine_a = {},
		lualine_b = { { "filename", path = 1 } },
		lualine_c = {},
		lualine_x = {},
		lualine_y = { "location" },
		lualine_z = {},
	},
	tabline = {},
	extensions = { "nvim-tree", "trouble" },
})

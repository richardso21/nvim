return {
	"nvim-lualine/lualine.nvim",
	lazy = false,
	config = function()
		-- https://github.com/nvim-lualine/lualine.nvim/issues/335#issuecomment-916759033
		local custom_fname = require("lualine.components.filename"):extend()
		local highlight = require("lualine.highlight")
		local default_status_colors = { saved = "#E6E1CF", modified = "#EBC48D" }

		function custom_fname:init(options)
			custom_fname.super.init(self, options)
			self.status_colors = {
				saved = highlight.create_component_highlight_group(
					{ fg = default_status_colors.saved },
					"filename_status_saved",
					self.options
				),
				modified = highlight.create_component_highlight_group(
					{ fg = default_status_colors.modified, gui = "bold" },
					"filename_status_modified",
					self.options
				),
			}
			if self.options.color == nil then
				self.options.color = ""
			end
		end

		function custom_fname:update_status()
			local data = custom_fname.super.update_status(self)
			data = highlight.component_format_highlight(
				vim.bo.modified and self.status_colors.modified or self.status_colors.saved
			) .. data
			return data
		end

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
				section_separators = { left = "", right = "" },
			},
			sections = {
				lualine_a = {
					{
						"mode",
						fmt = function(str)
							return str:sub(1, 3)
						end,
					},
				},
				lualine_b = {
					"branch",
					{
						custom_fname,
						file_status = false,
						path = 1,
					},
				},
				lualine_c = { "aerial" },
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
			extensions = { "nvim-tree", "aerial", "lazy", "toggleterm", "mason", "mundo" },
		})
	end,
}

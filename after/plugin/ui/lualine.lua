-- don't need to show mode or cmd on command bar
vim.opt.showmode = false
vim.opt.showcmd = false

-- local empty = require("lualine.component"):extend()
-- function empty:draw(default_highlight)
-- 	self.status = ""
-- 	self.applied_separator = ""
-- 	self:apply_highlights(default_highlight)
-- 	self:apply_section_separators()
-- 	return self.status
-- end

-- Put proper separators and gaps between components in sections
-- local function process_sections(sections)
-- 	for name, section in pairs(sections) do
-- 		local left = name:sub(9, 10) < "x"
-- 		for pos = 1, name ~= "lualine_z" and #section or #section - 1 do
-- 			table.insert(section, pos * 2, {
-- 				empty,
-- 				color = {
-- 					fg = "#011627",
-- 					bg = "#011627",
-- 				},
-- 			})
-- 		end
-- 		for id, comp in ipairs(section) do
-- 			if type(comp) ~= "table" then
-- 				comp = { comp }
-- 				section[id] = comp
-- 			end
-- 			comp.separator = left and { right = "" } or { left = "" }
-- 		end
-- 	end
-- 	return sections
-- end

require("lualine").setup({
	options = {
		theme = "ayu_dark",
		component_separators = "",
		section_separators = { left = "", right = "" },
		-- disabled_filetypes = { "NvimTree", "Trouble" },
	},
	-- sections = process_sections({
	sections = {
		lualine_a = {
			{ "mode" },
		},
		lualine_b = { { "filename", file_status = false }, "branch" },
		lualine_c = { { "filename", path = 1 } },
		lualine_x = { "diagnostics", "diff" },
		lualine_y = { "filetype" },
		lualine_z = {
			{ "location" },
		},
	},
	inactive_sections = {
		lualine_a = {},
		lualine_b = {},
		lualine_c = { { "filename", path = 1 } },
		lualine_x = { "location" },
		lualine_y = {},
		lualine_z = {},
	},
	tabline = {},
	extensions = { "nvim-tree", "trouble" },
})

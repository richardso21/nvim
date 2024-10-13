local ignore_indent_fts = {
	"alpha",
	"dashboard",
	"fzf",
	"help",
	"lazy",
	"lazyterm",
	"mason",
	"NvimTree",
	"neo-tree",
	"notify",
	"toggleterm",
	"Trouble",
	"trouble",
}

return {
	-- Indentations
	{
		"echasnovski/mini.indentscope",
		version = false,
		opts = {
			symbol = "▎",
			options = {
				try_as_border = true,
			},
			draw = {
				delay = 50,
			},
		},
		event = "BufReadPost",
		init = function()
			vim.api.nvim_create_autocmd("FileType", {
				pattern = ignore_indent_fts,
				callback = function()
					vim.b.miniindentscope_disable = true
				end,
			})
		end,
	},
	{
		"lukas-reineke/indent-blankline.nvim",
		main = "ibl",
		opts = {
			indent = {
				char = "▏",
				tab_char = "▏",
			},
			exclude = {
				filetypes = ignore_indent_fts,
			},
		},
		event = "BufReadPost",
	},
}

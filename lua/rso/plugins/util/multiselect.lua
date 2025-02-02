return {
	-- Multi-select (VSCode Cmd/Ctrl+D)
	{
		"mg979/vim-visual-multi",
		init = function()
			vim.g.VM_maps = {
				["Add Cursor Down"] = "<C-S-Down>",
				["Add Cursor Up"] = "<C-S-Up>",
			}
		end,
		event = "BufReadPost",
	},
}

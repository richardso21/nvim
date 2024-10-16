return {
	{
		"nvim-neo-tree/neo-tree.nvim",
		cmd = "Neotree",
		keys = {
			{ "<leader>e", "<cmd>Neotree toggle<cr>" },
			{ "<leader>E", "<cmd>Neotree reveal<cr>" },
		},
		opts = {
			window = {
				position = "right",
				mappings = {
					["c"] = { "copy", config = { show_path = "relative" } },
					["m"] = { "move", config = { show_path = "relative" } },
					["<bs>"] = "close_node",
					["<"] = "navigate_up",
					[">"] = "set_root",
					["."] = "system_open",
				},
			},
			commands = {
				system_open = function(state)
					local node = state.tree:get_node()
					local path = node:get_id()
					vim.fn.jobstart({ "open", path }, { detach = true })
				end,
			},
			filesystem = {
				group_empty_dirs = true,
				filtered_items = {
					never_show = {
						".DS_Store",
					},
				},
			},
			source_selector = {
				winbar = true,
			},
		},
	},
}

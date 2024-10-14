return {
	{
		"nvim-tree/nvim-tree.lua",
		dependencies = {
			"b0o/nvim-tree-preview.lua",
		},
		cmd = { "NvimTreeToggle", "NvimTreeFindFileToggle" },
		keys = {
			{ [[<leader>e]], "<cmd>NvimTreeToggle<CR>" },
			{ [[<leader>E]], "<cmd>NvimTreeFindFileToggle!<CR>" },
		},
		opts = {
			view = { side = "right" },
			filters = { custom = { "^.git$" } },
			renderer = {
				group_empty = true,
				hidden_display = "simple",
				indent_markers = {
					enable = true,
				},
			},
			filesystem_watchers = {
				ignore_dirs = { ".git", "node_modules", "venv", ".venv", "__pycache__" },
			},
			on_attach = function(bufnr)
				local api = require("nvim-tree.api")
				api.config.mappings.default_on_attach(bufnr)

				local function opts(desc)
					return { desc = "nvim-tree: " .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
				end

				local preview = require("nvim-tree-preview")
				vim.keymap.set("n", "P", preview.watch, opts("Preview (Watch)"))
				vim.keymap.set("n", "<Esc>", preview.unwatch, opts("Close Preview/Unwatch"))

				-- Option A: Smart tab behavior: Only preview files, expand/collapse directories (recommended)
				vim.keymap.set("n", "<Tab>", function()
					local ok, node = pcall(api.tree.get_node_under_cursor)
					if ok and node then
						if node.type == "directory" then
							api.node.open.edit()
						else
							preview.node(node, { toggle_focus = true })
						end
					end
				end, opts("Preview"))
			end,
		},
	},
}

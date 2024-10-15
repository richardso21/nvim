return {
	{
		"akinsho/bufferline.nvim",
		opts = {
			options = {
				diagnostics = "nvim_lsp",
			},
		},
		lazy = false,
		keys = {
			{ "K", "<cmd>BufferLineCycleNext<cr>", desc = "Next buffer" },
			{ "J", "<cmd>BufferLineCyclePrev<cr>", desc = "Previous buffer" },
			{ "L", "<cmd>BufferLineMoveNext<cr>", desc = "Move buffer right" },
			{ "H", "<cmd>BufferLineMovePrev<cr>", desc = "Move buffer left" },
			{ "<leader>bb", "<cmd>BufferLinePick<cr>", desc = "Pick buffer" },
			{ "<leader>bp", "<cmd>BufferLineTogglePin<cr>", desc = "Pin buffer" },
			{ "<leader>bq", "<cmd>BufferLinePickClose<cr>", desc = "Choose buffer to close" },
			{ "<leader>bQ", "<cmd>BufferLineCloseOthers<cr>", desc = "Close all other buffers" },
		},
	},
	{
		"famiu/bufdelete.nvim",
		keys = {
			{ "<leader>qq", "<cmd>Bdelete<cr>", desc = "Delete current buffer" },
			{ "<leader>qf", "<cmd>Bdelete! %<cr>", desc = "Force delete current buffer" },
		},
	},
}

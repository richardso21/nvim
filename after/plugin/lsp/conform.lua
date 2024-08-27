require("conform").setup({
	formatters_by_ft = {
		lua = { "stylua" },
		python = { "isort", "black" },
		javascript = { "prettierd" },
		typescript = { "prettierd" },
		vue = { "prettierd" },
		html = { "prettierd" },
		css = { "prettierd" },
		markdown = { "prettierd" },
		go = { "gofumpt" },
		c = { "clang_format" },
		cpp = { "clang_format" },
		java = { "google-java-format" },
		yaml = { "yamlfmt" },
		typst = { "typstyle" },
	},
})

-- format on save
vim.api.nvim_create_autocmd("BufWritePre", {
	pattern = "*",
	callback = function(args)
		require("conform").format({ bufnr = args.buf })
	end,
})

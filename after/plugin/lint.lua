require("lint").linters_by_ft = {
	markdown = { "markdownlint" },
	python = { "ruff" },
	javascript = { "eslint_d " },
	typescript = { "eslint_d " },
}

-- lint on save
vim.api.nvim_create_autocmd({ "BufWritePost" }, {
	callback = function()
		require("lint").try_lint()
	end,
})

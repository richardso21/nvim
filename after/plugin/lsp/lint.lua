require("lint").linters_by_ft = {
	markdown = { "markdownlint" },
	python = { "ruff" },
	javascript = { "quick-lint-js" },
	typescript = { "quick-lint-js" },
}

-- lint on save
vim.api.nvim_create_autocmd({ "BufWritePost" }, {
	callback = function()
		require("lint").try_lint()
	end,
})

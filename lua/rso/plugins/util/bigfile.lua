return {
	"LunarVim/bigfile.nvim",
	lazy = false,
	opts = {
		pattern = function(bufnr, filesize_mib)
			-- disable for obscenely large text files
			if filesize_mib >= 2 then
				return true
			end
			-- disable if there are a LOT of lines
			local file_contents = vim.fn.readfile(vim.api.nvim_buf_get_name(bufnr))
			local line_count = #file_contents
			if line_count > 30000 then
				return true
			end
			-- ... or if there exists very long lines in the file (e.g. minified JS or json)
			for _, line in ipairs(file_contents) do
				if #line > 1000 then
					return true
				end
			end
		end,
		features = {
			"indent_blankline",
			"illuminate",
			"lsp",
			"treesitter",
			"syntax",
			"matchparen",
			"vimopts",
		},
	},
}

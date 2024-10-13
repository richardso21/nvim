return {
	{ import = "rso.plugins.lang" },

	-- Formatting
	{
		"stevearc/conform.nvim",
		event = { "BufWritePre" },
		cmd = { "ConformInfo" },
		opts = {
			formatters_by_ft = {
				lua = { "stylua" },
				python = { "isort", "ruff_format" },
				javascript = { "prettierd" },
				typescript = { "prettierd" },
				vue = { "prettierd" },
				html = { "prettierd" },
				css = { "prettierd" },
				json = { "prettierd" },
				markdown = { "markdownlint" },
				go = { "gofumpt" },
				c = { "clang_format" },
				cpp = { "clang_format" },
				java = { "google-java-format" },
				yaml = { "yamlfmt" },
				typst = { "typstyle" },
				tex = { "latexindent" },
			},
			format_on_save = true,
		},
	},

	-- Linting
	{
		"mfussenegger/nvim-lint",
		event = "BufWritePre",
		config = function()
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
		end,
	},

	-- LaTeX
	{
		"lervag/vimtex",
		ft = "tex",
		init = function()
			vim.g.tex_flavor = "latex"
			vim.g.vimtex_view_method = "skim"
			vim.g.vimtex_compiler_method = "latexmk"
			vim.g.vimtex_quickfix_open_on_warning = 0

			-- autoclean on quit
			local au_group = vim.api.nvim_create_augroup("vimtex_events", {})
			vim.api.nvim_create_autocmd("User", {
				pattern = "VimtexEventQuit",
				group = au_group,
				command = "VimtexClean",
			})
		end,
	},

	-- Markdown preview support
	{
		"MeanderingProgrammer/render-markdown.nvim",
		ft = "markdown",
		opts = {
			heading = {
				backgrounds = {
					"RenderMarkdownH1Bg",
					"RenderMarkdownH2Bg",
				},
			},
		},
	},

	-- AI Autocomplete
	{
		"supermaven-inc/supermaven-nvim",
		event = "InsertEnter",
		keys = {
			{ "<leader>oc", "<cmd>SupermavenToggle<cr>", desc = "Toggle supermaven" },
		},
		opts = {
			keymaps = {
				accept_suggestion = "<M-l>",
				accept_word = "<M-j>",
			},
		},
	},
}

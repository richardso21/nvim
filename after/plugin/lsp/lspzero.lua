local lsp_zero = require("lsp-zero")

require("luasnip.loaders.from_vscode").lazy_load() -- vscode snippets

-- link NormalFloat to Normal hl group (for hover docs/signature help and diagnostics)
vim.api.nvim_set_hl(0, "NormalFloat", { link = "Normal" })

-- lsp_attach is where you enable features that only work
-- if there is a language server active in the file
local lsp_attach = function(_, bufnr)
	local opts = { buffer = bufnr }

	vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
	vim.keymap.set("n", "gD", vim.lsp.buf.declaration, opts)
	vim.keymap.set("n", "gi", vim.lsp.buf.implementation, opts)
	vim.keymap.set("n", "go", vim.lsp.buf.type_definition, opts)
	vim.keymap.set("n", "<M-k>", vim.lsp.buf.hover, opts)
	vim.keymap.set("i", "<M-k>", vim.lsp.buf.signature_help, opts)
	vim.keymap.set("n", "<leader>ln", vim.lsp.buf.rename, opts)
	vim.keymap.set("n", "<leader>la", vim.lsp.buf.code_action, opts)
	vim.keymap.set("n", "<leader>lr", vim.lsp.buf.references, opts)
	vim.keymap.set("n", "[d", function()
		vim.diagnostic.jump({ count = -1, float = true })
	end, opts)
	vim.keymap.set("n", "]d", function()
		vim.diagnostic.jump({ count = 1, float = true })
	end, opts)
	-- vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, opts)
	-- vim.keymap.set("n", "]d", vim.diagnostic.goto_next, opts)
end

lsp_zero.ui({
	float_border = "rounded",
})

lsp_zero.extend_lspconfig({
	sign_text = true,
	lsp_attach = lsp_attach,
	capabilities = require("cmp_nvim_lsp").default_capabilities(),
})

vim.keymap.set("n", "<leader>lm", function()
	vim.cmd("Mason")
end)

require("mason").setup({})
require("mason-lspconfig").setup({
	handlers = {
		function(server_name)
			require("lspconfig")[server_name].setup({})
		end,

		-- python lsp setup
		basedpyright = function()
			require("lspconfig").basedpyright.setup({
				settings = {
					basedpyright = {
						analysis = {
							typeCheckingMode = "basic",
						},
						disableOrganizeImports = true,
					},
				},
			})
		end,

		-- clang: 'multiple different client offset_encodings detected'
		clangd = function()
			require("lspconfig").clangd.setup({
				capabilities = require("cmp_nvim_lsp").default_capabilities(),
				cmd = {
					"clangd",
					"--offset-encoding=utf-16",
				},
			})
		end,

		-- supress ltex spam
		ltex = function()
			require("lspconfig").ltex.setup({
				settings = {
					ltex = {
						checkFrequency = "save",
					},
				},
			})
		end,

		-- single file mode for typst tinymist
		tinymist = function()
			require("lspconfig").tinymist.setup({
				single_file_support = true,
				root_dir = function()
					return vim.fn.expand("%:p:h") -- use current file's directory
				end,
			})
		end,
	},
})

local cmp = require("cmp")
local cmp_action = lsp_zero.cmp_action()

local has_words_before = function()
	---@diagnostic disable-next-line: deprecated
	if vim.api.nvim_buf_get_option(0, "buftype") == "prompt" then
		return false
	end
	local line, col = unpack(vim.api.nvim_win_get_cursor(0))
	return col ~= 0 and vim.api.nvim_buf_get_text(0, line - 1, 0, line - 1, col, {})[1]:match("^%s*$") == nil
end

local toggle_completion = function()
	if cmp.visible() then
		cmp.close()
	else
		cmp.complete()
	end
end

local cmp_select_behavior = { behavior = cmp.SelectBehavior.Select }

local mappings = cmp.mapping.preset.insert({
	-- `Enter` key to confirm completion
	["<CR>"] = cmp.mapping.confirm({ behavior = cmp.ConfirmBehavior.replace, select = true }),

	["<Tab>"] = vim.schedule_wrap(function(fallback)
		if cmp.visible() and has_words_before() then
			cmp.select_next_item(cmp_select_behavior)
		else
			fallback()
		end
	end),
	["<S-Tab>"] = cmp.mapping.select_prev_item(cmp_select_behavior),
	["<C-n>"] = cmp.mapping.select_next_item(cmp_select_behavior),
	["<C-p>"] = cmp.mapping.select_prev_item(cmp_select_behavior),

	-- Ctrl+Space to trigger completion menu
	["<C-Space>"] = toggle_completion,

	-- Navigate between snippet placeholder
	["<C-f>"] = cmp_action.vim_snippet_jump_forward(),
	["<C-b>"] = cmp_action.vim_snippet_jump_backward(),

	-- Scroll up and down in the completion documentation
	["<C-u>"] = cmp.mapping.scroll_docs(-4),
	["<C-d>"] = cmp.mapping.scroll_docs(4),
})

cmp.setup({
	window = {
		documentation = cmp.config.window.bordered(),
		completion = cmp.config.window.bordered(),
	},
	sources = {
		{ name = "nvim_lsp" },
		{ name = "luasnip" },
	},
	mapping = mappings,
	snippet = {
		expand = function(args)
			vim.snippet.expand(args.body)
		end,
	},
	formatting = {
		fields = { "kind", "abbr", "menu" },
		format = function(entry, vim_item)
			local kind = require("lspkind").cmp_format({
				mode = "symbol_text",
				maxwidth = 70,
			})(entry, vim_item)
			local strings = vim.split(kind.kind, "%s", { trimempty = true })
			kind.kind = " " .. (strings[1] or "") .. " "
			kind.menu = "    (" .. (strings[2] or "") .. ")"
			return kind
		end,
	},
})

local signs = { E = "", W = "", N = "", I = "" }
vim.diagnostic.config({
	signs = {
		text = {
			[vim.diagnostic.severity.E] = signs.E,
			[vim.diagnostic.severity.W] = signs.W,
			[vim.diagnostic.severity.N] = signs.N,
			[vim.diagnostic.severity.I] = signs.I,
		},
	},
})

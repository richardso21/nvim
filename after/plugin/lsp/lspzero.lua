local lsp_zero = require("lsp-zero")

require("luasnip.loaders.from_vscode").lazy_load() -- vscode snippets

-- lsp_attach is where you enable features that only work
-- if there is a language server active in the file
local lsp_attach = function(client, bufnr)
	local opts = { buffer = bufnr }

	vim.keymap.set("n", "gd", "<cmd>lua vim.lsp.buf.definition()<cr>", opts)
	vim.keymap.set("n", "gD", "<cmd>lua vim.lsp.buf.declaration()<cr>", opts)
	vim.keymap.set("n", "gi", "<cmd>lua vim.lsp.buf.implementation()<cr>", opts)
	vim.keymap.set("n", "go", "<cmd>lua vim.lsp.buf.type_definition()<cr>", opts)
	vim.keymap.set("n", "<M-k>", "<cmd>lua vim.lsp.buf.hover()<cr>", opts)
	vim.keymap.set("i", "<M-k>", "<cmd>lua vim.lsp.buf.signature_help()<cr>", opts)
	vim.keymap.set("n", "<leader>ln", "<cmd>lua vim.lsp.buf.rename()<cr>", opts)
	vim.keymap.set("n", "<leader>la", "<cmd>lua vim.lsp.buf.code_action()<cr>", opts)
	vim.keymap.set("n", "<leader>lr", "<cmd>lua vim.lsp.buf.references()<cr>", opts)
	vim.keymap.set("n", "[d", "<cmd>lua vim.diagnostic.goto_prev()<cr>", opts)
	vim.keymap.set("n", "]d", "<cmd>lua vim.diagnostic.goto_next()<cr>", opts)
end

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

local mappings = cmp.mapping.preset.insert({
	-- `Enter` key to confirm completion
	["<CR>"] = cmp.mapping.confirm({ behavior = cmp.ConfirmBehavior.replace, select = false }),

	["<Tab>"] = vim.schedule_wrap(function(fallback)
		if cmp.visible() and has_words_before() then
			cmp.select_next_item({ behavior = cmp.SelectBehavior.Select })
		else
			fallback()
		end
	end),
	["<S-Tab>"] = cmp.mapping.select_prev_item({ behavior = "select" }),

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

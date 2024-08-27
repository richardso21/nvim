---@diagnostic disable: missing-fields
require("neodev").setup({})

local lsp_zero = require("lsp-zero")

local trouble = require("trouble")

require("luasnip.loaders.from_vscode").lazy_load() -- vscode snippets

-- (thank you ThePrimeagen)

lsp_zero.on_attach(function(_, bufnr)
	local opts = { buffer = bufnr, remap = false }
	vim.keymap.set("n", "gd", function()
		vim.lsp.buf.definition()
	end, opts)
	vim.keymap.set("n", "<leader>lw", function()
		vim.lsp.buf.workspace_symbol("")
	end, opts)
	vim.keymap.set("n", "<leader>la", function()
		vim.lsp.buf.code_action()
	end, opts)
	vim.keymap.set("n", "<leader>lr", function()
		trouble.toggle("lsp_references")
	end, opts)
	vim.keymap.set("n", "<leader>ln", function()
		vim.lsp.buf.rename()
	end, opts)
	vim.keymap.set("n", "<leader>ld", function()
		trouble.toggle()
	end, opts)
	vim.keymap.set("n", "[d", function()
		vim.diagnostic.jump({ count = -1, float = true })
	end, opts)
	vim.keymap.set("n", "]d", function()
		vim.diagnostic.jump({ count = 1, float = true })
	end, opts)
	vim.keymap.set("n", "<M-k>", function()
		vim.lsp.buf.hover()
	end, opts)
	vim.keymap.set("i", "<M-k>", function()
		vim.lsp.buf.signature_help()
	end, opts)
end)

vim.keymap.set("n", "<leader>lm", function()
	vim.cmd("Mason")
end)

require("mason").setup({})
require("mason-lspconfig").setup({
	ensure_installed = {},
	handlers = {
		lsp_zero.default_setup,
	},
})

local cmp = require("cmp")
local cmp_select = { behavior = cmp.SelectBehavior.Select }
local cmp_mappings = cmp.mapping.preset.insert({
	["<C-p>"] = cmp.mapping.select_prev_item(cmp_select),
	["<C-n>"] = cmp.mapping.select_next_item(cmp_select),
	["<CR>"] = cmp.mapping.confirm({
		behavior = cmp.ConfirmBehavior.Replace,
		select = true,
	}),
	["<Tab>"] = cmp.mapping.confirm({
		select = true,
	}),
	["<C-Space>"] = cmp.mapping.complete(),
	["<C-u>"] = cmp.mapping.scroll_docs(-4),
	["<C-d>"] = cmp.mapping.scroll_docs(4),
})

-- cmp_mappings['<Tab>'] = nil
cmp_mappings["<S-Tab>"] = nil

cmp.setup({
	sources = {
		{ name = "path" },
		{ name = "nvim_lsp" },
		{ name = "nvim_lua" },
		{ name = "luasnip" },
	},
	-- formatting = lsp_zero.cmp_format(),
	window = {
		completion = {
			col_offset = -3,
			side_padding = 0,
			winhighlight = "Normal:Pmenu,FloatBorder:Pmenu,Search:None",
		},
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
	mapping = cmp_mappings,
})

-- pretty icons in gutter
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

-- python lsp setup
require("lspconfig").pyright.setup({
	settings = {
		pyright = {
			disableOrganizeImports = true, --have isort for that
		},
	},
})

-- clang: 'multiple different client offset_encodings detected'
require("lspconfig").clangd.setup({
	capabilities = require("cmp_nvim_lsp").default_capabilities(),
	cmd = {
		"clangd",
		"--offset-encoding=utf-16",
	},
})

-- supress ltex spam
-- require("lspconfig").ltex.setup({
-- 	settings = {
-- 		ltex = {
-- 			checkFrequency = "save",
-- 		},
-- 	},
-- })

-- single file mode for typst tinymist
require("lspconfig").tinymist.setup({
	single_file_support = true,
	root_dir = function()
		return vim.fn.expand("%:p:h") -- use current file's directory
	end,
})

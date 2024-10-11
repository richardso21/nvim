-- borders on diagnostics
vim.diagnostic.config({
	float = { border = "rounded" },
})

-- vim.opt.signcolumn = "yes"
-- local signs = { E = "", W = "", N = "", I = "" }
-- vim.diagnostic.config({
-- 	signs = {
-- 		text = {
-- 			[vim.diagnostic.severity.E] = signs.E,
-- 			[vim.diagnostic.severity.W] = signs.W,
-- 			[vim.diagnostic.severity.N] = signs.N,
-- 			[vim.diagnostic.severity.I] = signs.I,
-- 		},
-- 	},
-- })

for _, diag in ipairs({ "Error", "Warn", "Info", "Hint" }) do
	vim.fn.sign_define("DiagnosticSign" .. diag, {
		text = "",
		texthl = "DiagnosticSign" .. diag,
		linehl = "",
		numhl = "DiagnosticSign" .. diag,
	})
end

local custom_handlers = {
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
}

local function register_keymaps()
	local lspconfig = require("lspconfig")
	local lsp_attach = function(event)
		local opts = { buffer = event.buf }

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
	lspconfig.util.default_config.capabilities = vim.tbl_deep_extend(
		"force",
		lspconfig.util.default_config.capabilities,
		require("cmp_nvim_lsp").default_capabilities()
	)

	vim.api.nvim_create_autocmd("LspAttach", {
		desc = "LSP actions",
		callback = lsp_attach,
	})
end

return {
	"neovim/nvim-lspconfig",
	dependencies = {
		"hrsh7th/cmp-nvim-lsp",
		"williamboman/mason-lspconfig.nvim",
	},
	cmd = { "LspInfo", "LspInstall", "LspStart" },
	event = { "BufReadPre", "BufNewFile" },
	config = function()
		-- lspconfig
		register_keymaps()

		-- mason-lspconfig
		require("mason-lspconfig").setup({
			handlers = vim.tbl_deep_extend("force", custom_handlers, {
				function(server_name)
					require("lspconfig")[server_name].setup({})
				end,
			}),
		})
	end,
}

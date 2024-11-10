vim.opt.signcolumn = "yes"
local signs = { E = "", W = "", N = "", I = "" }
vim.diagnostic.config({
	-- borders on diagnostics
	float = { border = "rounded" },
	-- custom diagnostic signs
	signs = {
		numhl = {
			[vim.diagnostic.severity.E] = "DiagnosticSignNumHLError",
			[vim.diagnostic.severity.W] = "DiagnosticSignNumHLWarn",
			[vim.diagnostic.severity.N] = "DiagnosticSignNumHLInfo",
			[vim.diagnostic.severity.I] = "DiagnosticSignNumHLHint",
		},
		text = {
			[vim.diagnostic.severity.E] = signs.E,
			[vim.diagnostic.severity.W] = signs.W,
			[vim.diagnostic.severity.N] = signs.N,
			[vim.diagnostic.severity.I] = signs.I,
		},
	},
})

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

	-- take care of jdtls spam
	jdtls = function()
		require("lspconfig").jdtls.setup({
			handlers = {
				["language/status"] = function() end,
				["$/progress"] = function() end,
			},
		})
	end,
}

--- @param params table: options for setup_lspconfig
local function setup_lspconfig(params)
	params = params or {}
	local opts = {
		set_keys = true,
	}
	for k, v in pairs(params) do
		opts[k] = v
	end

	local lspconfig = require("lspconfig")
	local lsp_attach = function(event)
		local map_opts = { buffer = event.buf }
		if opts.set_keys then
			vim.keymap.set("n", "gd", vim.lsp.buf.definition, map_opts)
			vim.keymap.set("n", "gD", vim.lsp.buf.declaration, map_opts)
			vim.keymap.set("n", "gi", vim.lsp.buf.implementation, map_opts)
			vim.keymap.set("n", "go", vim.lsp.buf.type_definition, map_opts)
			vim.keymap.set("n", "<leader>ln", vim.lsp.buf.rename, map_opts)
			vim.keymap.set("n", "<leader>la", vim.lsp.buf.code_action, map_opts)
			vim.keymap.set("n", "<leader>lr", vim.lsp.buf.references, map_opts)
			vim.keymap.set("n", "[d", function()
				vim.diagnostic.jump({ count = -1, float = true })
			end, map_opts)
			vim.keymap.set("n", "]d", function()
				vim.diagnostic.jump({ count = 1, float = true })
			end, map_opts)
			-- vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, opts)
			-- vim.keymap.set("n", "]d", vim.diagnostic.goto_next, opts)
		end
		-- use native lsp hover and signature help instead of lspsaga
		vim.keymap.set("n", "<M-k>", vim.lsp.buf.hover, map_opts)
		vim.keymap.set("i", "<M-k>", vim.lsp.buf.signature_help, map_opts)
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
	{
		"neovim/nvim-lspconfig",
		dependencies = {
			"hrsh7th/cmp-nvim-lsp",
			"williamboman/mason-lspconfig.nvim",
			"nvimdev/lspsaga.nvim",
		},
		cmd = { "LspInfo", "LspInstall", "LspStart" },
		event = { "BufReadPre", "BufNewFile" },
		config = function()
			-- lspconfig
			setup_lspconfig({ set_keys = false })

			-- mason-lspconfig
			require("mason-lspconfig").setup({
				handlers = vim.tbl_deep_extend("force", custom_handlers, {
					function(server_name)
						require("lspconfig")[server_name].setup({})
					end,
				}),
			})
		end,
	},
	{
		"nvimdev/lspsaga.nvim",
		opts = {
			definition = {
				keys = {
					edit = "o",
					vsplit = "t",
					split = "s",
				},
			},
			outline = {
				layout = "float",
			},
			lightbulb = {
				sign = false,
				virtual_text = true,
			},
			ui = {
				code_action = "",
			},
		},
		keys = {
			{ "gd", "<cmd>Lspsaga peek_definition<cr>", desc = "Peek Definition" },
			{ "gy", "<cmd>Lspsaga peek_type_definition<cr>", desc = "Peek Type Definition" },
			{ "gD", "<cmd>Lspsaga goto_definition<cr>", desc = "Goto Definition" },
			{ "gY", "<cmd>Lspsaga goto_type_definition<cr>", desc = "Goto Type Definition" },
			{ "<leader>ln", "<cmd>Lspsaga rename<cr>", desc = "Rename" },
			{ "<leader>lN", "<cmd>Lspsaga rename ++project<cr>", desc = "Project Rename" },
			{ "<leader>ld", "<cmd>Lspsaga show_line_diagnostics<cr>", desc = "Show Line Diagnostics" },
			{ "<leader>lD", "<cmd>Lspsaga show_buf_diagnostics<cr>", desc = "Show Buffer Diagnostics" },
			{ "<leader>la", "<cmd>Lspsaga code_action<cr>", desc = "Code Action" },
			{ "<leader>lr", "<cmd>Lspsaga finder<cr>", desc = "Finder" },
			{ "<leader>ll", "<cmd>Lspsaga outline<cr>", desc = "Outline" },
			{ "[d", "<cmd>Lspsaga diagnostic_jump_prev<cr>", desc = "Prev Diagnostic" },
			{ "]d", "<cmd>Lspsaga diagnostic_jump_next<cr>", desc = "Next Diagnostic" },
		},
	},
}

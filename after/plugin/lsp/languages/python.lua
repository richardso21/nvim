-- python lsp setup
require("lspconfig").pyright.setup({
	settings = {
		pyright = {
			disableOrganizeImports = true, --have isort for that
		},
	},
})

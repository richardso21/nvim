-- supress ltex spam
require("lspconfig").ltex.setup({
	settings = {
		ltex = {
			checkFrequency = "save",
		},
	},
})

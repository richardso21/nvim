require("aerial").setup({
	autojump = true,
})
-- You probably also want to set a keymap to toggle aerial
vim.keymap.set("n", "<leader>oa", "<cmd>AerialToggle<CR>")

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.uv.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable", -- latest stable release
		lazypath,
	})
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
	{
		import = "rso.plugins",
		cond = function()
			return not vim.g.vscode
		end,
	},
	-- plugins for vscode-neovim
	{
		import = "rso.vscode.plugins",
		cond = function()
			return vim.g.vscode
		end,
	},
}, {
	defaults = { lazy = true },
})

vim.keymap.set("n", "<leader>zz", function()
	vim.cmd("Lazy")
end)

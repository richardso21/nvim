vim.g.tex_flavor = "latex"
vim.g.vimtex_view_method = "skim"
-- vim.g.vimtex_view_method = "sioyek"
vim.g.vimtex_compiler_method = "latexmk"
-- vim.opt.conceallevel = 1
-- vim.g.tex_conceal = 'abdmg'

local au_group = vim.api.nvim_create_augroup("vimtex_events", {})

-- autoclean on quit
vim.api.nvim_create_autocmd("User", {
	pattern = "VimtexEventQuit",
	group = au_group,
	command = "VimtexClean",
})

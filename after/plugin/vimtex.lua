vim.g.tex_flavor = "latex"
vim.g.vimtex_view_method = "skim"
vim.g.vimtex_compiler_method = "latexmk"
vim.g.vimtex_quickfix_open_on_warning = 0

-- autoclean on quit
local au_group = vim.api.nvim_create_augroup("vimtex_events", {})
vim.api.nvim_create_autocmd("User", {
	pattern = "VimtexEventQuit",
	group = au_group,
	command = "VimtexClean",
})

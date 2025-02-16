vim.g.termguicolors = true
vim.o.hidden = true

-- disable default statusline for lualine
vim.o.laststatus = 0

-- set custom highlight groups
vim.api.nvim_set_hl(0, "NormalFloat", { link = "Normal" })

local diagnostic_colors = {
	Error = "NightflyRed",
	Warn = "NightflyYellow",
	Info = "NightflyMalibu",
	Hint = "NightflyTurquoise",
}
for diag, hl_group in pairs(diagnostic_colors) do
	local hl_opts = vim.api.nvim_get_hl(0, { name = hl_group })
	vim.api.nvim_set_hl(0, "DiagnosticSignNumHL" .. diag, {
		fg = hl_opts.fg,
		bold = true,
	})
end

-- disable netrw
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- number line
vim.opt.nu = true
vim.opt.relativenumber = true
vim.opt.signcolumn = "yes"

-- highlight current line
vim.opt.cursorline = true

-- column guide
vim.opt.colorcolumn = "80,120"

-- prevent cursor from being all the way up/down
vim.opt.scrolloff = 8

-- spaces >>>> tabs
vim.opt.tabstop = 2
vim.opt.softtabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true
vim.opt.smartindent = true

vim.opt.mousemoveevent = true
vim.opt.mouse = "a"

-- remove `~`
vim.opt.fillchars = { eob = " " }

-- no wraps by default
vim.opt.wrap = false
vim.opt.linebreak = true

-- persistent undo
vim.opt.undofile = true

-- confirm before quit
vim.opt.confirm = true

-- ignore + smart casing for search
vim.opt.ignorecase = true
vim.opt.smartcase = true

-- directory name in title
vim.opt.title = true
vim.opt.titlelen = 0 -- do not shorten title
-- set title string to nvim + name of current workspace directory
vim.opt.titlestring = "nvim " .. vim.fn.fnamemodify(vim.uv.cwd() or "", ":t")

-- disable swap files (I ~usually~ save frequently)
vim.opt.swapfile = false

vim.g.termguicolors = true
vim.o.hidden = true

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
vim.opt.titlestring = "nvim " .. vim.fn.fnamemodify(vim.loop.cwd() or "", ":t")

-- disable swap files (I ~usually~ save frequently)
vim.opt.swapfile = false

-- Fix cursor change on terminal
vim.cmd([[
  au VimEnter,VimResume * set guicursor=n-v-c:block,i-ci-ve:ver25,r-cr:hor20,o:hor50
    \,a:blinkwait700-blinkoff400-blinkon250-Cursor/lCursor
    \,sm:block-blinkwait175-blinkoff150-blinkon175

  au VimLeave,VimSuspend * set guicursor=a:ver25-blinkon250
]])

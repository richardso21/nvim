vim.g.termguicolors = true
vim.o.hidden = true

-- number line
vim.opt.nu = true
vim.opt.relativenumber = true
vim.opt.signcolumn = "yes"

-- highlight current line
vim.opt.cursorline = true

-- column guide
vim.opt.colorcolumn = "80"

-- prevent cursor from being all the way up/down
vim.opt.scrolloff = 8

-- spaces >>>> tabs
vim.opt.tabstop = 2
vim.opt.softtabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true
vim.opt.smartindent = true

-- no wraps
vim.opt.wrap = false

-- Fix cursor change on iTerm
vim.cmd [[
  au VimEnter,VimResume * set guicursor=n-v-c:block,i-ci-ve:ver25,r-cr:hor20,o:hor50
    \,a:blinkwait700-blinkoff400-blinkon250-Cursor/lCursor
    \,sm:block-blinkwait175-blinkoff150-blinkon175

  au VimLeave,VimSuspend * set guicursor=a:ver25-blinkon250
]]

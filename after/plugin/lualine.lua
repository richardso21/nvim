-- Bubbles config for lualine
-- Author: lokesh-krishna
-- MIT license, see LICENSE for more details.

-- don't need to show mode or cmd on command bar
vim.opt.showmode = false
vim.opt.showcmd = false

require('lualine').setup {
  options = {
    theme = 'nightfly',
    component_separators = '|',
    section_separators = { left = '', right = '' },
  },
  sections = {
    lualine_a = {
      { 'mode' },
    },
    lualine_b = { 'filename', 'branch' },
    lualine_c = {
      {
        'diagnostics',
        source = { 'nvim' },
        sections = { 'error' },
      },
      {
        'diagnostics',
        source = { 'nvim' },
        sections = { 'warn' },
      },
    },
    lualine_x = { 'lsp-progress' },
    lualine_y = { 'filetype', 'progress' },
    lualine_z = {
      { 'location' },
    },
  },
  inactive_sections = {
    lualine_a = { 'filename' },
    lualine_b = {},
    lualine_c = {},
    lualine_x = {},
    lualine_y = {},
    lualine_z = { 'location' },
  },
  tabline = {},
  extensions = {},
}

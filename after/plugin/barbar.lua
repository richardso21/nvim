require("barbar").setup {
  -- auto_hide = true,

  icons = {
    diagnostics = {
      [vim.diagnostic.severity.ERROR] = {enabled = true, icon = '!'},
      [vim.diagnostic.severity.WARN] = {enabled = false, icon = '?'},
    },
    inactive = {separator = {left = '', right = ''}},
    pinned = {button = ''},
    separator = {left = '', right = ''},
    maximum_padding = math.huge,
  },

  sidebar_filetypes = {
    NvimTree = true
  }

}

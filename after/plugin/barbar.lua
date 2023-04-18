-- Buffers
vim.keymap.set("n", "K", [[:BufferNext<CR>]])
vim.keymap.set("n", "J", [[:BufferPrevious<CR>]])
vim.keymap.set("n", "L", [[:BufferMoveNext<CR>]])
vim.keymap.set("n", "H", [[:BufferMovePrevious<CR>]])
vim.keymap.set("n", "<leader>qq", [[:BufferClose<CR>]])
vim.keymap.set("n", "<leader>bb", [[:BufferPick<CR>]])
vim.keymap.set("n", "<leader>bq", [[:BufferPickDelete<CR>]])

require("barbar").setup {
  -- auto_hide = true,
  hide = {
    extensions = true
  },

  icons = {
    diagnostics = {
      [vim.diagnostic.severity.ERROR] = { enabled = true, icon = '!' },
      [vim.diagnostic.severity.WARN] = { enabled = false, icon = '?' },
    },
    inactive = { separator = { left = '', right = '' } },
    pinned = { button = '' },
    separator = { left = '', right = '' },
    maximum_padding = math.huge,
  },

  -- sidebar_filetypes = {
  --   NvimTree = true
  -- }

}

-- NvimTree
vim.keymap.set("n", "<leader>e", [[:NvimTreeToggle<CR>]])

vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

require("nvim-tree").setup({
  view = {
    side = "right",
  },
  renderer = {
    group_empty = true,
  },
})

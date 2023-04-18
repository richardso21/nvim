vim.keymap.set("n", "<leader>z", [[:ZenMode<CR>]])

require("zen-mode").setup {
  window = {
    width = 120,
  },
  plugins = {
    alacritty = {
      enabled = true,
      font = "18"
    }
  }
}

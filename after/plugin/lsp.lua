-- Mason menu keybind
vim.keymap.set("n", "<leader>lm", [[:Mason<CR>]])

vim.diagnostic.config({
  virtual_text = true
})

local lsp = require("lsp-zero")

lsp.preset("recommended")

-- lua nvim
require('lspconfig').lua_ls.setup(lsp.nvim_lua_ls())

local cmp = require('cmp')
local cmp_select = { behavior = cmp.SelectBehavior.Select }
local cmp_mappings = lsp.defaults.cmp_mappings({
  ['<C-p>'] = cmp.mapping.select_prev_item(cmp_select),
  ['<C-n>'] = cmp.mapping.select_next_item(cmp_select),
  ['<CR>'] = cmp.mapping.confirm({
    behavior = cmp.ConfirmBehavior.Replace,
    select = true
  }),
  ['<Tab>'] = cmp.mapping.confirm({
    select = true
  }),
  ["<C-Space>"] = cmp.mapping.complete(),
  ["<C-u>"] = cmp.mapping.scroll_docs(-4),
  ["<C-d>"] = cmp.mapping.scroll_docs(4),
})

-- cmp_mappings['<Tab>'] = nil
cmp_mappings['<S-Tab>'] = nil


lsp.setup_nvim_cmp({
  mapping = cmp_mappings,
})


lsp.set_preferences({
  set_lsp_keymaps = { omit = { 'K' } }
})

lsp.on_attach(function(_, bufnr)
  local opts = { buffer = bufnr, remap = false }
  vim.keymap.set("n", "gd", function() vim.lsp.buf.definition() end, opts)
  vim.keymap.set("n", "<C-;>", function() vim.lsp.buf.hover() end, opts)
  vim.keymap.set("n", "<leader>lws", function() vim.lsp.buf.workspace_symbol() end, opts)
  vim.keymap.set("n", "<leader>ld", function() vim.diagnostic.open_float() end, opts)
  vim.keymap.set("n", "[d", function() vim.diagnostic.goto_next() end, opts)
  vim.keymap.set("n", "]d", function() vim.diagnostic.goto_prev() end, opts)
  vim.keymap.set("n", "<leader>la", function() vim.lsp.buf.code_action() end, opts)
  vim.keymap.set("n", "<leader>lf", function() vim.lsp.buf.references() end, opts)
  vim.keymap.set("n", "<leader>ln", function() vim.lsp.buf.rename() end, opts)
  vim.keymap.set("i", "<C-;>", function() vim.lsp.buf.signature_help() end, opts)
  lsp.buffer_autoformat() -- auto format on save
end)

-- envoke lsp zero setup
lsp.setup()

-- envoke fidget (lsp progress) setup
-- require("fidget").setup()

-- setup debugger
require("mason-nvim-dap").setup({
  ensure_installed = { "python" }
})

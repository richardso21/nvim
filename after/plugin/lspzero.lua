require("neodev").setup {}

local lsp_zero = require('lsp-zero')

local trouble = require('trouble')

-- (thank you ThePrimeagen)

lsp_zero.on_attach(function(_, bufnr)
  local opts = { buffer = bufnr, remap = false }
  vim.keymap.set("n", "gd", function() vim.lsp.buf.definition() end, opts)
  vim.keymap.set("n", "<leader>lw", function() vim.lsp.buf.workspace_symbol() end, opts)
  vim.keymap.set("n", "<leader>la", function() vim.lsp.buf.code_action() end, opts)
  vim.keymap.set("n", "<leader>lr", function() trouble.toggle('lsp_references') end, opts)
  vim.keymap.set("n", "<leader>ln", function() vim.lsp.buf.rename() end, opts)
  vim.keymap.set("n", "<leader>ld", function() trouble.toggle() end, opts)
  vim.keymap.set("n", "[d", function() vim.diagnostic.goto_next() end, opts)
  vim.keymap.set("n", "]d", function() vim.diagnostic.goto_prev() end, opts)
  vim.keymap.set("n", "<M-k>", function() vim.lsp.buf.hover() end, opts)
  vim.keymap.set("i", "<M-k>", function() vim.lsp.buf.signature_help() end, opts)

  -- auto-format on save by default
  lsp_zero.buffer_autoformat()
end)

vim.keymap.set("n", "<leader>lm", function() vim.cmd("Mason") end)

require('mason').setup({})
require('mason-lspconfig').setup({
  ensure_installed = {},
  handlers = {
    lsp_zero.default_setup,
  },
})

local cmp = require('cmp')
local cmp_select = { behavior = cmp.SelectBehavior.Select }
local cmp_mappings = cmp.mapping.preset.insert({
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

---@diagnostic disable-next-line: missing-fields
cmp.setup({
  sources = {
    { name = 'path' },
    { name = 'nvim_lsp' },
    { name = 'nvim_lua' },
  },
  formatting = lsp_zero.cmp_format(),
  mapping = cmp_mappings
})

-- pretty icons in gutter
local signs = { Error = "󰅚 ", Warn = "󰀪 ", Hint = "󰌶 ", Info = " " }
for type, icon in pairs(signs) do
  local hl = "DiagnosticSign" .. type
  vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
end

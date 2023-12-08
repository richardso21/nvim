local builtin = require('telescope.builtin')

-- find files
vim.keymap.set('n', '<leader>ff', builtin.find_files, {})

vim.keymap.set('n', '<leader>fp', builtin.oldfiles, {}) -- { only_cwd = true })

-- find git files
vim.keymap.set('n', '<leader>fg', builtin.git_files, {})

-- find text
vim.keymap.set('n', '<leader>ft', function()
  builtin.grep_string({ search = vim.fn.input("Grep Text > ") })
end)

-- find variables
vim.keymap.set('n', '<leader>fv', builtin.treesitter, {})

-- find sessions
vim.keymap.set('n', '<leader>fs', require("auto-session.session-lens").search_session, {})

-- find buffers
vim.keymap.set('n', '<leader>fb', builtin.buffers, {})


-- find HELP!
vim.keymap.set('n', '<leader>fh', builtin.help_tags, {})

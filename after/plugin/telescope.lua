local builtin = require('telescope.builtin')

-- find files
vim.keymap.set('n', '<leader>ff', builtin.find_files, {})

-- find git files
vim.keymap.set('n', '<leader>fg', builtin.git_files, {})

-- find text
vim.keymap.set('n', '<leader>ft', function()
	builtin.grep_string({ search = vim.fn.input("Grep Text > ") })
end)

-- find variables
vim.keymap.set('n', '<leader>fv', builtin.treesitter, {})

-- find buffers
vim.keymap.set('n', '<leader>bs', builtin.buffers, {})

-- find HELP!
vim.keymap.set('n', '<leader>fh', builtin.help_tags, {})


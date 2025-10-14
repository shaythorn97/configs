require('telescope').setup
{
	defaults = 
	{
<<<<<<< HEAD
		file_ignore_patterns = { "build/*", "external/*", "node_modules/*" },
=======
		file_ignore_patterns = { "^build/*", "^external/*" },
>>>>>>> 798b28d6307330272c691760c671c87d691a58f0
	}
}

-- Key mappings
local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})
vim.keymap.set('n', '<leader>fb', builtin.buffers, {})
vim.keymap.set('n', '<leader>fh', builtin.help_tags, {})

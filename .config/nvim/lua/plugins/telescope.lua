local bind = vim.keymap.set
local opts = { silent = true, noremap = true }
local telescope = require('telescope')

telescope.setup({
	defaults = {
		vimgrep_arguments = vimgrep_arguments,
		file_ignore_patterns = { 'node_modules' },
	},
	pickers = {
		find_files = {
			find_command = { 'rg', '--files', '--hidden', '--glob', '!**/.git/*' },
		},
	},
})

bind('n', '<leader>?', require('telescope.builtin').oldfiles, { desc = '[?] Find recently opened files' }, opts)
bind('n', '<leader><space>', require('telescope.builtin').buffers, { desc = '[ ] Find existing buffers' }, opts)
bind('n', '<leader>p', require('telescope.builtin').find_files, { desc = '[S]earch [F]iles' }, opts)
bind('n', '<leader>sw', require('telescope.builtin').grep_string, { desc = '[S]earch current [W]ord' }, opts)
bind('n', '<leader>sg', require('telescope.builtin').live_grep, { desc = '[S]earch by [G]rep' }, opts)
bind('n', '<leader>ds', require('telescope.builtin').diagnostics, { desc = '[S]earch [D]iagnostics' }, opts)
bind('n', '<leader>/', function()
	require('telescope.builtin').current_buffer_fuzzy_find(require('telescope.themes').get_dropdown({
		winblend = 10,
		previewer = false,
	}))
end, { desc = '[/] Fuzzily search in current buffer' }, opts)

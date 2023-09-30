local conform = require('conform')

conform.setup({
	formatters_by_ft = {
		markdown = {
			'mdformat',
		},
		lua = {
			'stylua',
		},
		javascript = {
			'prettier',
		},
		javascriptreact = {
			'prettier',
		},
		typescriptreact = {
			'prettier',
		},
		typescript = {
			'prettier',
		},
		css = {
			'prettier',
		},
		json = {
			'prettier',
		},
		html = {
			'prettier',
		},
	},
	format_on_save = {
		timeout_ms = 500,
		lsp_fallback = true,
	},
})

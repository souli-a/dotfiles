local capabilities = require('cmp_nvim_lsp').default_capabilities()
local lspconfig = require('lspconfig')
local luasnip = require('luasnip')
local cmp = require('cmp')
local mason = require('mason')
local masonlsp = require('mason-lspconfig')
local servers = { 'tsserver', 'emmet_ls', 'cssls', 'lua_ls', 'bashls', 'jsonls', 'html' }

require('luasnip.loaders.from_vscode').lazy_load()

mason.setup({})

masonlsp.setup({
	ensure_installed = servers,
})

for _, lsp in ipairs(servers) do
	lspconfig[lsp].setup({
		capabilities = capabilities,
	})
end

cmp.setup({
	mapping = cmp.mapping.preset.insert({
		['<Enter>'] = cmp.mapping.confirm({ select = true }),
		['<Tab>'] = cmp.mapping(function(fallback)
			if cmp.visible() then
				cmp.select_next_item()
			elseif luasnip.expand_or_jumpable() then
				luasnip.expand_or_jump()
			else
				fallback()
			end
		end, { 'i', 's' }),
		['<S-Tab>'] = cmp.mapping(function(fallback)
			if cmp.visible() then
				cmp.select_prev_item()
			elseif luasnip.jumpable(-1) then
				luasnip.jump(-1)
			else
				fallback()
			end
		end, { 'i', 's' }),
	}),
	snippet = {
		expand = function(args)
			luasnip.lsp_expand(args.body)
		end,
	},
	sources = cmp.config.sources({
		{ name = 'luasnip' },
		{ name = 'buffer' },
		{ name = 'path' },
	}),
})

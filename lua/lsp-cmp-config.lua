local cmp = require'cmp'

cmp.setup({
    snippet = 
	{
        expand = function(args)
            vim.fn["vsnip#anonymous"](args.body)
        end,
    },
    mapping = cmp.mapping.preset.insert(
	{
        ['<cr>'] = cmp.mapping.confirm({ select = true }),
	    ['<tab>'] = cmp.mapping.select_next_item(),
	 	['<s-tab>'] = cmp.mapping.select_prev_item(),
    }),
    sources = cmp.config.sources(
	{
        { name = 'nvim_lsp' },
        { name = 'vsnip' },
        { name = 'buffer' },
		{ name = 'nvim_lsp_signature_help' }
    })
})

local capabilities = require('cmp_nvim_lsp').default_capabilities(vim.lsp.protocol.make_client_capabilities())

require('lspconfig')['clangd'].setup {
    capabilities = capabilities,
	filetypes = { "c", "cpp", "ixx", "cxx", "h" },
}

require('lspconfig')['glsl_analyzer'].setup {
	capabilities = capabilities,
}

require('lspconfig')['cmake'].setup {
    capabilities = capabilities,
}

require('lspconfig')['pyright'].setup {
    capabilities = capabilities
}
-- vim.api.nvim_create_autocmd('LspAttach', 
-- {
	
-- })

-- Key mappings for LSP commands
vim.keymap.set('n', '<leader>e', vim.diagnostic.open_float)
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev)
vim.keymap.set('n', ']d', vim.diagnostic.goto_next)
vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist)

vim.api.nvim_set_keymap('n', '<Leader>gd', ':lua vim.lsp.buf.definition()<CR>', { silent = true })
vim.api.nvim_set_keymap('n', '<Leader>gr', ':lua vim.lsp.buf.references()<CR>', { silent = true })
vim.api.nvim_set_keymap('n', 'K', ':lua vim.lsp.buf.hover()<CR>', { silent = true })
vim.api.nvim_set_keymap('n', '<Leader>gf', ':lua vim.lsp.buf.formatting()<CR>', { silent = true })
vim.api.nvim_set_keymap('n', '<Leader>rn', ':lua vim.lsp.buf.rename()<CR>', { silent = true })
vim.api.nvim_set_keymap('n', '<Leader>s', ':lua vim.lsp.buf.signature_help()<CR>', { silent = true })
vim.api.nvim_set_keymap('n', '<leader>ca', ':lua vim.lsp.buf.code_action()<cr>', { silent = true })

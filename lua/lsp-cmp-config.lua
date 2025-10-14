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
    })
})

local capabilities = require('cmp_nvim_lsp').default_capabilities(vim.lsp.protocol.make_client_capabilities())

-- Setup servers --
local servers = {
    'clangd',
    'gopls',
    'glsl_analyzer',
    'ts_ls', 
    'pyright',
}

for _, server in ipairs(servers) do
    vim.lsp.config(server, {
        capabilities = capabilities,
    })
    vim.lsp.enable(server)
end

-- Key mappings for LSP commands
vim.keymap.set('n', '<leader>e', vim.diagnostic.open_float)
vim.keymap.set('n', '[d',        vim.diagnostic.goto_prev)
vim.keymap.set('n', ']d',        vim.diagnostic.goto_next)
vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist)

vim.api.nvim_set_keymap('n', '<leader>gd', ':lua vim.lsp.buf.definition()<cr>',     { silent = true })
vim.api.nvim_set_keymap('n', '<leader>gr', ':lua vim.lsp.buf.references()<cr>',     { silent = true })
vim.api.nvim_set_keymap('n', 'K',          ':lua vim.lsp.buf.hover()<cr>',          { silent = true })
vim.api.nvim_set_keymap('n', '<leader>gf', ':lua vim.lsp.buf.formatting()<cr>',     { silent = true })
vim.api.nvim_set_keymap('n', '<leader>rn', ':lua vim.lsp.buf.rename()<cr>',         { silent = true })
vim.api.nvim_set_keymap('n', '<leader>s',  ':lua vim.lsp.buf.signature_help()<cr>', { silent = true })
vim.api.nvim_set_keymap('n', '<leader>ca', ':lua vim.lsp.buf.code_action()<cr>',    { silent = true })

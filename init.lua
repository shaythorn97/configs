local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
	{ "nvim-treesitter/nvim-treesitter", build = ":TSUpdate" }, 
    { "neovim/nvim-lspconfig" },
    { "hrsh7th/cmp-nvim-lsp" },
    { "hrsh7th/cmp-buffer" },
    { "hrsh7th/cmp-path" },
    { "hrsh7th/cmp-cmdline" },
    { "hrsh7th/nvim-cmp" },
    { "hrsh7th/cmp-vsnip" },
    { "hrsh7th/vim-vsnip" },
    { "hrsh7th/cmp-nvim-lsp-signature-help" },
    { "nvim-lua/plenary.nvim" },
    { "nvim-telescope/telescope.nvim" },
    { "nvim-telescope/telescope-fzf-native.nvim" },
    { "tpope/vim-fugitive" },
    { "tpope/vim-commentary" },
    { "tpope/vim-dispatch" },
	{ "ellisonleao/gruvbox.nvim" },
	{ "vim-airline/vim-airline" },
	{ "vim-airline/vim-airline-themes" },
	{ "dstein64/vim-startuptime" }
})

vim.opt.number = true
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab= true
vim.opt.breakindent = true
vim.opt.linebreak = true
vim.opt.clipboard = 'unnamedplus'
vim.opt.termguicolors = true
vim.opt.cursorline = true

vim.opt.background = 'dark'
vim.cmd('colorscheme gruvbox')
vim.cmd('highlight Normal guibg=NONE ctermbg=NONE')
vim.cmd('highlight String gui=NONE')
vim.cmd('highlight CursorLineNr guifg=#EBDBB2 guibg=NONE gui=bold')
vim.cmd('highlight CursorLine guibg=NONE')
vim.cmd('AirlineTheme base16_gruvbox_dark_medium') 

vim.g.mapleader = " "
vim.g.maplocalleader = " "
vim.keymap.set('n', '<space>', '<nop>', { noremap = true }, { silent = true })

vim.keymap.set('n', '<leader>;', ':Ex<cr>', { silent = true })
vim.keymap.set('n', '<leader>tt', ':tabnew | term<cr>', { silent = true })
vim.keymap.set('n', '<leader>x', ':ccl<cr>', { silent = true })

vim.cmd[[
  augroup filetypedetect
    au! BufRead,BufNewFile *.vert set filetype=glsl
    au! BufRead,BufNewFile *.frag set filetype=glsl
  augroup END
]]

-- Load lua configs
require('treesitter-config')
require('lsp-cmp-config')
require('telescope-config')

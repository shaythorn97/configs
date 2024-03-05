-- Load plugins using vim-plug
vim.cmd([[call plug#begin('~/.vim/plugged')]])

-- Define plugins
vim.cmd([[Plug 'vim-airline/vim-airline']])
vim.cmd([[Plug 'vim-airline/vim-airline-themes']])
vim.cmd([[Plug 'ellisonleao/gruvbox.nvim']])
vim.cmd([[Plug 'neovim/nvim-lspconfig']])
vim.cmd([[Plug 'hrsh7th/cmp-nvim-lsp']])
vim.cmd([[Plug 'hrsh7th/cmp-buffer']])
vim.cmd([[Plug 'hrsh7th/cmp-path']])
vim.cmd([[Plug 'hrsh7th/cmp-cmdline']])
vim.cmd([[Plug 'hrsh7th/nvim-cmp']])
vim.cmd([[Plug 'hrsh7th/cmp-vsnip']])
vim.cmd([[Plug 'hrsh7th/vim-vsnip']])
vim.cmd([[Plug 'hrsh7th/cmp-nvim-lsp-signature-help']])
vim.cmd([[Plug 'nvim-lua/plenary.nvim']])
vim.cmd([[Plug 'nvim-telescope/telescope.nvim']])
vim.cmd([[Plug 'nvim-telescope/telescope-fzf-native.nvim']])
vim.cmd([[Plug 'tpope/vim-fugitive']])
vim.cmd([[Plug 'tpope/vim-commentary']])
vim.cmd([[Plug 'tpope/vim-dispatch']])
vim.cmd([[Plug 'tikhomirov/vim-glsl']])
vim.cmd([[Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}]])

-- End plugin definition
vim.cmd([[call plug#end()]])

-- Space as LEADER
vim.api.nvim_set_keymap('n', ' ', '<Nop>', {noremap = true})
vim.g.mapleader = ' '

-- Vim commentary
vim.api.nvim_set_keymap('n', '<c-k>', '<cmd>Commentary<cr>', {noremap = true});

-- Set line numbers
vim.opt.number = true

-- Set tab size
vim.opt.tabstop = 4

-- Use spaces instead of tabs
vim.opt.expandtab = true

-- Set indent size
vim.opt.shiftwidth = 4

-- Enable system clipboard integration
vim.opt.clipboard = 'unnamedplus'

-- Set background to dark
vim.opt.background = 'dark'
vim.g.gruvbox_contrast = 'soft'

-- Load gruvbox colorscheme
vim.cmd('colorscheme gruvbox')
vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
vim.g.airline_theme = 'base16_gruvbox_dark_hard'
vim.cmd('highlight String gui=NONE')

-- Netrw let commands

-- Load cmp (completion) configuration
require('cmp_lsp_config')
require 'lspconfig'.cmake.setup{}

-- Load treesitter configuration
require('treesitter_config')

-- Load telescope configuration
require('telescope_config')

-- Set GLSL file type
vim.cmd([[
  augroup filetypes
    autocmd!
    autocmd BufRead,BufNewFile *.glsl,*.vert,*.frag,*.geom set filetype=glsl
  augroup END
]])


-- Build Project
function BuildProject(configuration)
    vim.cmd("wa");
    vim.cmd("Dispatch cmake --build build --config " .. configuration)
end

vim.api.nvim_set_keymap('n', '<c-b>', '<cmd>lua BuildProject("Debug")<CR>', {noremap = true})
vim.api.nvim_set_keymap('i', '<c-b>', '<cmd>lua BuildProject("Debug")<CR>', {noremap = true})

-- Run project
function RunProject()
    -- local run = vim.fn.glob('*.exe')
    vim.cmd("Dispatch! cmake --build build --target run-debug")
end

vim.api.nvim_set_keymap('n', '<f5>', '<cmd>lua RunProject()<cr>', {noremap = true})
vim.api.nvim_set_keymap('i', '<f5>', '<cmd>lua RunProject()<cr>', {noremap = true})

call plug#begin('~/AppData/Local/nvim/plugged')

Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'ellisonleao/gruvbox.nvim'
Plug 'preservim/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'neovim/nvim-lspconfig'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-path'
Plug 'hrsh7th/cmp-cmdline'
Plug 'hrsh7th/nvim-cmp'
Plug 'hrsh7th/cmp-vsnip'
Plug 'hrsh7th/vim-vsnip'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'nvim-telescope/telescope-fzf-native.nvim'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-dispatch'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'akinsho/toggleterm.nvim', {'tag' : '*'}
Plug 'filipdutescu/renamer.nvim', { 'branch': 'master' }

call plug#end()

set number
set tabstop=4
set expandtab
set shiftwidth=4
set clipboard=unnamedplus
set background=dark
colorscheme gruvbox

autocmd VimEnter * NERDTree | wincmd p
autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif
let g:NERDTreeDirArrowExpandable = '+'
let g:NERDTreeDirArrowCollapsible = '-'

lua require('cmp_lsp_config')
lua require('treesitter_config')

lua require("toggleterm").setup()
lua require("renamer").setup()

nnoremap <silent> <F2> <cmd>lua require('renamer').rename()<cr>

" Set filetype for GLSL files
autocmd BufRead,BufNewFile *.glsl set filetype=glsl
autocmd BufRead,BufNewFile *.vert set filetype=glsl
autocmd BufRead,BufNewFile *.frag set filetype=glsl
autocmd BufRead,BufNewFile *.geom set filetype=glsl

nnoremap <C-t> :NERDTreeToggle<CR>

nnoremap <C-h> :bprevious<CR>
nnoremap <C-l> :bnext<CR>

nnoremap <C-s> :w<CR>

nnoremap <C-p> :Telescope find_files<CR>
nnoremap <C-f> :Telescope live_grep<CR>

nnoremap <C-c> :Commentary<CR>
vnoremap <C-c> :Commentary<CR>

nnoremap <silent> gd :lua vim.lsp.buf.definition()<CR>
nnoremap <silent> gi :lua vim.lsp.buf.implementation()<CR>
nnoremap <silent> gr :lua vim.lsp.buf.references()<CR>
nnoremap <silent> K  :lua vim.lsp.buf.hover()<CR>

" Move line up with Ctrl-Up
nnoremap <C-Up> :m-2<CR>
inoremap <C-Up> <Esc>:m-2<CR>i
vnoremap <C-Up> :m'<-2<CR>gv=gv

" Move line down with Ctrl-Down
nnoremap <C-Down> :m+<CR>
inoremap <C-Down> <Esc>:m+<CR>i
vnoremap <C-Down> :m'>+<CR>gv=gv

" Build project
function! BuildProject(configuration)
	:wa
    :cd build
    execute 'Dispatch cmake --build . --config ' . a:configuration
    :cd ..
endfunction

" Run project
function! RunProject()
	:call BuildProject("Debug")
	:cd build/Debug
	:let run = glob('*.exe')
	:echo run
	execute ':Dispatch! start ' . run
	:cd ../..
endfunction

nnoremap <C-b> :call BuildProject("Debug")<CR>
nnoremap <C-A-b> :call BuildProject("Release")<CR>

nnoremap <F5> :call RunProject()<CR>
nnoremap <C-F5> :call RunProject()<CR>
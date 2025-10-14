require('nvim-treesitter.configs').setup {
    ensure_installed = { "rust", "c_sharp", "glsl", "cmake", "ninja", "c", "cpp", "lua", "vim", "vimdoc", "query", "typescript" 
    },
    highlight = {
        enable = true
    }
}

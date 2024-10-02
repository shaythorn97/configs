require('nvim-treesitter.configs').setup {
    ensure_installed = { "rust", "c_sharp", "glsl", "cmake", "ninja", "c", "lua", "vim", "vimdoc", "query" 
    },
    highlight = {
        enable = true
    }
}

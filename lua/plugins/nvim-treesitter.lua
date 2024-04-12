return {
    'nvim-treesitter/nvim-treesitter',
    config = function ()
        require("nvim-treesitter.configs").setup({
            ensure_installed = { 
                "c", "cpp", "javascript", "lua", "vim", "vimdoc", "query",
                "python", "vue", "sql", "typescript",  "java", "kotlin",
                "bash", "json", "html", "xml", "yaml"
            },

            highlight = { enable = true },
            indent = { enable = true },
            rainbow = {
                enable = true,
                extended_mode = true,
                max_file_lines = nil,
            },
            
        })
    end,
}

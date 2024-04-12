require("core.options")
require("core.keymaps")

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
    vim.fn.system({"git", "clone", "--filter=blob:none", "https://github.com/folke/lazy.nvim.git", "--branch=stable", lazypath,})
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
    { import = "plugins" },

    -- LSP
    { 'VonHeikemen/lsp-zero.nvim' },
    { 'hrsh7th/cmp-nvim-lsp' },
    { 'hrsh7th/nvim-cmp' },
    { 'neovim/nvim-lspconfig' },
    { 'L3MON4D3/LuaSnip' },
    { "williamboman/mason.nvim" },
    { "williamboman/mason-lspconfig.nvim" },
    { 'VonHeikemen/lsp-zero.nvim' },
    { "neovim/nvim-lspconfig" },
    {
        "numToStr/Comment.nvim",
        config = function ()
            require("Comment").setup()
        end,
    },
    {
        "windwp/nvim-autopairs",
        event = "InsertEnter",
        config = true
    }
})

-- LSP Config
local mason = require("mason")
local masonLspconfig = require('mason-lspconfig')
local cmp = require('cmp')
local luasnip = require('luasnip')

mason.setup({
    ui = {
        icons = {
            package_installed = "✔",
            package_pending = "➡️",
            package_uninstalled = "✖",
        }
    }
})

masonLspconfig.setup({
    ensure_installed = {},
    handlers = {
        function(server_name)
            require('lspconfig')[server_name].setup({})
        end,
    },
})

cmp.setup({
    sources = {
        {name = 'nvim_lsp'},
    },
    mapping = {
        ['<C-b>'] = cmp.mapping.scroll_docs(-4),
        ['<C-f>'] = cmp.mapping.scroll_docs(4),
        ['<CR>'] = cmp.mapping.confirm({select = true}),
        ['<C-e>'] = cmp.mapping.abort(), -- 取消补全
        ['<Up>'] = cmp.mapping.select_prev_item({behavior = 'select'}),
        ['<Down>'] = cmp.mapping.select_next_item({behavior = 'select'}),
        ['<Tab>'] = cmp.mapping(function(fallback)
            if cmp.visible() then
                cmp.select_next_item()
            elseif luasnip.expandable() then
                luasnip.expand()
            elseif luasnip.expand_or_jumpable() then
                luasnip.expand_or_jump()
            else
                fallback()
            end
        end),
    },
    snippet = {
        expand = function(args)
            luasnip.lsp_expand(args.body)
        end,
    }
})



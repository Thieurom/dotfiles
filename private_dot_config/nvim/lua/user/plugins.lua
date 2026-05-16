local gh = function(repo)
    return "https://github.com/" .. repo
end

vim.api.nvim_create_autocmd("PackChanged", {
    callback = function(event)
        local name = event.data.spec.name
        local kind = event.data.kind

        if name == "nvim-treesitter" and (kind == "install" or kind == "update") then
            vim.cmd.packadd("treesitter-parser-registry")
            vim.cmd.packadd("nvim-treesitter")
            if vim.fn.executable("tree-sitter") == 1 then
                vim.cmd("TSUpdate")
            end
        end
    end,
})

vim.pack.add({
    { src = gh("nvim-tree/nvim-tree.lua") },
    { src = gh("nvim-lua/plenary.nvim") },
    { src = gh("nvim-telescope/telescope.nvim") },
    { src = gh("nvim-tree/nvim-web-devicons") },
    { src = gh("nvim-lualine/lualine.nvim"), version = "a52f078026b27694d2290e34efa61a6e4a690621" },
    { src = gh("akinsho/bufferline.nvim") },
    { src = gh("moll/vim-bbye") },
    { src = gh("windwp/nvim-autopairs") },
    { src = gh("numToStr/Comment.nvim") },
    { src = gh("folke/which-key.nvim") },
    { src = gh("akinsho/toggleterm.nvim") },
    { src = gh("lukas-reineke/indent-blankline.nvim") },

    { src = gh("EdenEast/nightfox.nvim") },
    { src = gh("neanias/everforest-nvim") },
    { src = gh("catppuccin/nvim"), name = "catppuccin" },

    { src = gh("hrsh7th/nvim-cmp") },
    { src = gh("hrsh7th/cmp-buffer") },
    { src = gh("hrsh7th/cmp-path") },
    { src = gh("saadparwaiz1/cmp_luasnip") },
    { src = gh("hrsh7th/cmp-nvim-lsp") },

    { src = gh("L3MON4D3/LuaSnip"), version = "e81cbe6004051c390721d8570a4a0541ceb0df10" },
    { src = gh("rafamadriz/friendly-snippets") },

    { src = gh("neovim/nvim-lspconfig"), version = "b6091272422bb0fbd729f7f5d17a56d37499c54f" },
    { src = gh("williamboman/mason.nvim") },
    { src = gh("williamboman/mason-lspconfig.nvim"), version = "e86a4c84ff35240639643ffed56ee1c4d55f538e" },
    { src = gh("nvimtools/none-ls.nvim") },

    { src = gh("neovim-treesitter/treesitter-parser-registry") },
    { src = gh("neovim-treesitter/nvim-treesitter") },

    { src = gh("lewis6991/gitsigns.nvim") },
}, {
    confirm = false,
    load = true,
})

vim.o.timeout = true
vim.o.timeoutlen = 300

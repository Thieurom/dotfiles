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
    { src = gh("nvim-lua/plenary.nvim") },
    { src = gh("nvim-telescope/telescope.nvim") },
    { src = gh("MunifTanjim/nui.nvim") },
    { src = gh("nvim-tree/nvim-web-devicons") },
    { src = gh("nvim-neo-tree/neo-tree.nvim"), version = "v3.x" },
    { src = gh("nvim-mini/mini.icons") },
    { src = gh("nvim-lualine/lualine.nvim") },
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

    { src = gh("L3MON4D3/LuaSnip") },
    { src = gh("rafamadriz/friendly-snippets") },

    { src = gh("neovim/nvim-lspconfig") },
    { src = gh("williamboman/mason.nvim") },
    { src = gh("williamboman/mason-lspconfig.nvim") },
    { src = gh("WhoIsSethDaniel/mason-tool-installer.nvim") },
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

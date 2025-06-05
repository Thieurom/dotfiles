local fn = vim.fn

-- Automatically install packer
local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
	PACKER_BOOTSTRAP = fn.system({
		"git",
		"clone",
		"--depth",
		"1",
		"https://github.com/wbthomason/packer.nvim",
		install_path,
	})
	print("Installing packer close and reopen Neovim...")
	vim.cmd([[packadd packer.nvim]])
end

-- Autocommand that reloads neovim whenever you save the plugins.lua file
vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]])

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
	return
end

-- Have packer use a popup window
packer.init({
	display = {
		open_fn = function()
			return require("packer.util").float({ border = "rounded" })
		end,
	},
})

-- Install plugins here
return packer.startup(function(use)
    use { "wbthomason/packer.nvim", commit = "ea0cc3c59f67c440c5ff0bbe4fb9420f4350b9a3" } -- Have packer manage itself
    use { "nvim-tree/nvim-tree.lua" }
    use { "nvim-lua/plenary.nvim" }
    use { "nvim-telescope/telescope.nvim" }
    use { "nvim-tree/nvim-web-devicons" }
    use { "nvim-lualine/lualine.nvim", commit = "0c6cca9f2c63dadeb9225c45bc92bb95a151d4af" }
    use { "akinsho/bufferline.nvim", tag = "v4.9.1" }
    use { "moll/vim-bbye" }
    use { "windwp/nvim-autopairs" }
    use { "numToStr/Comment.nvim" }
    use { "goolord/alpha-nvim", commit = "a35468cd72645dbd52c0624ceead5f301c566dff" }
    use {
        "folke/which-key.nvim",
        config = function()
            vim.o.timeout = true
            vim.o.timeoutlen = 300
        end
    }
    use { "akinsho/toggleterm.nvim" }

    -- Colorschemes
    use { "EdenEast/nightfox.nvim" }
    use { "neanias/everforest-nvim" }
    use { "catppuccin/nvim", as = "catppuccin" }

    -- cmp plugins
    use { "hrsh7th/nvim-cmp" } -- The completion plugin
    use { "hrsh7th/cmp-buffer" } -- buffer completions
    use { "hrsh7th/cmp-path" } -- path completions
    use { "saadparwaiz1/cmp_luasnip" } -- snippet completions
    use { "hrsh7th/cmp-nvim-lsp" }

    -- snippets
    use { "L3MON4D3/LuaSnip", tag = "v2.4.0" }
    use { "rafamadriz/friendly-snippets" } -- a bunch of snippets to use

    -- LSP
    use { "neovim/nvim-lspconfig", tag = "v2.2.0" } -- enable LSP
    use { "williamboman/mason.nvim", tag = "v2.0.0" }
    use { "williamboman/mason-lspconfig.nvim", tag = "v2.0.0" }
    use { "nvimtools/none-ls.nvim", commit = "db2a48b79cfcdab8baa5d3f37f21c78b6705c62e" } -- for formatters and linters

    -- Treesitter
    use { "nvim-treesitter/nvim-treesitter", tag = "v0.10.0" }

    -- Git
    use { "lewis6991/gitsigns.nvim" }

    if PACKER_BOOTSTRAP then
        require("packer").sync()
    end
end)


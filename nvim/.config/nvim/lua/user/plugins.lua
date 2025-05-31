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
    use { "wbthomason/packer.nvim", commit = "6afb67460283f0e990d35d229fd38fdc04063e0a" } -- Have packer manage itself
    use { "nvim-tree/nvim-tree.lua" }
    use { "nvim-lua/plenary.nvim" }
    use { "nvim-telescope/telescope.nvim" }
    use { "nvim-tree/nvim-web-devicons" }
    use { "nvim-lualine/lualine.nvim", commit = "a52f078026b27694d2290e34efa61a6e4a690621" }
    use { "akinsho/bufferline.nvim", commit = "99f0932365b34e22549ff58e1bea388465d15e99" }
    use { "moll/vim-bbye" }
    use { "windwp/nvim-autopairs" }
    use { "numToStr/Comment.nvim" }
    use {
        "folke/which-key.nvim",
        config = function()
            vim.o.timeout = true
            vim.o.timeoutlen = 300
        end
    }

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
    use { "L3MON4D3/LuaSnip", commit = "e81cbe6004051c390721d8570a4a0541ceb0df10" }
    use { "rafamadriz/friendly-snippets" } -- a bunch of snippets to use

    -- LSP
    use { "neovim/nvim-lspconfig", commit = "b6091272422bb0fbd729f7f5d17a56d37499c54f" } -- enable LSP
    use { "williamboman/mason.nvim" }
    use { "williamboman/mason-lspconfig.nvim", commit = "e86a4c84ff35240639643ffed56ee1c4d55f538e" }
    use { "jose-elias-alvarez/null-ls.nvim" } -- for formatters and linters

    -- Treesitter
    use { "nvim-treesitter/nvim-treesitter", commit = "4fd6d9dc175f367cdcec87630d8a3950ba7daef4" }

    -- Git
    use { "lewis6991/gitsigns.nvim" }

    if PACKER_BOOTSTRAP then
        require("packer").sync()
    end
end)


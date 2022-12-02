-- luacheck: globals vim

return require("packer").startup(function(use)
	-- Packer can manage itself
	use("wbthomason/packer.nvim")
	use({
		"lewis6991/impatient.nvim",
		config = function()
			require("impatient").enable_profile()
		end,
	})

	use({
		"folke/tokyonight.nvim",
		-- config = function()
		-- 	vim.cmd.colorscheme("tokyonight")
		-- end,
	})
	use({
		"EdenEast/nightfox.nvim",
		-- config = function()
		-- 	vim.cmd.colorscheme("nightfox")
		-- end,
	})
	use({
		"ellisonleao/gruvbox.nvim",
		config = function()
			vim.cmd.colorscheme("gruvbox")
		end,
	})

	use({
		"lewis6991/gitsigns.nvim",
		tag = "release",
		config = function()
			require("gitsigns").setup()
		end,
	})

	use("nvim-treesitter/nvim-treesitter")
	use("windwp/nvim-autopairs")
	use({
		"numToStr/Comment.nvim",
		config = function()
			require("Comment").setup()
		end,
	})

	use({
		"nvim-tree/nvim-tree.lua",
		requires = { "nvim-tree/nvim-web-devicons" },
		config = function()
			require("nvim-tree").setup()
		end,
	})

	use({
		"nvim-lualine/lualine.nvim",
		requires = { "kyazdani42/nvim-web-devicons" },
		config = function()
			require("lualine").setup()
		end,
	})

	use("RRethy/vim-illuminate")

	use({
		"nvim-telescope/telescope.nvim",
		tag = "0.1.0",
		requires = { "nvim-lua/plenary.nvim" },
	})

	use("hrsh7th/nvim-cmp")
	use("hrsh7th/cmp-buffer")
	use("hrsh7th/cmp-path")
	use("saadparwaiz1/cmp_luasnip")
	use("hrsh7th/cmp-nvim-lsp")

	use("neovim/nvim-lspconfig")
	use("jose-elias-alvarez/null-ls.nvim")
	use({
		"L3MON4D3/LuaSnip",
		tag = "v1.1.0",
	})
	use("rafamadriz/friendly-snippets")

	use({
		"folke/trouble.nvim",
		requires = "kyazdani42/nvim-web-devicons",
		config = function()
			require("trouble").setup()
		end,
	})
end)

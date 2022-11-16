return require('packer').startup(function(use)

  -- Packer can manage itself
  use 'wbthomason/packer.nvim'
  -- use 'lewis6991/impatient.nvim'
  use 'folke/tokyonight.nvim'

  use {
    'lewis6991/gitsigns.nvim',
    tag = 'release',
  }

  use 'nvim-treesitter/nvim-treesitter'
  use 'windwp/nvim-autopairs'
  use 'numToStr/Comment.nvim'

  use {
    'nvim-tree/nvim-tree.lua',
    requires = {'nvim-tree/nvim-web-devicons' },
  }

  use {
    'nvim-lualine/lualine.nvim',
    requires = { 'kyazdani42/nvim-web-devicons' },
  }

  use 'RRethy/vim-illuminate'

  use {
    'nvim-telescope/telescope.nvim',
    tag = '0.1.0',
    requires = { 'nvim-lua/plenary.nvim' },
  }

  use 'hrsh7th/nvim-cmp'
  use 'hrsh7th/cmp-buffer'
  use 'hrsh7th/cmp-path'
  use 'saadparwaiz1/cmp_luasnip'
  use 'hrsh7th/cmp-nvim-lsp'
  use 'hrsh7th/cmp-nvim-lua'


  use 'neovim/nvim-lspconfig'
  use 'jose-elias-alvarez/null-ls.nvim'
  use 'williamboman/mason.nvim'
  use 'williamboman/mason-lspconfig.nvim'
  use { 
    'L3MON4D3/LuaSnip',
    tag = 'v1.1.0',
  }
  use 'rafamadriz/friendly-snippets'

end)

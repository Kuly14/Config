vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
  use 'wbthomason/packer.nvim'
  use {
    'nvim-telescope/telescope.nvim', tag = '0.1.4',
    requires = { {'nvim-lua/plenary.nvim'} }
  }
  use('nvim-treesitter/nvim-treesitter', {run =  ':TSUpdate'})
  use('nvim-treesitter/playground')
  use('theprimeagen/harpoon')
  use('mbbill/undotree')
  use('scalameta/nvim-metals')
  use('airblade/vim-gitgutter')
  use { 'ellisonleao/gruvbox.nvim' }
  use {'lervag/vimtex', lazy = false }
  use {
    'SirVer/ultisnips',
    config = function()
        vim.g.UltiSnipsExpandTrigger = '<tab>'
        vim.g.UltiSnipsJumpForwardTrigger = '<c-b>'
        vim.g.UltiSnipsJumpBackwardTrigger = '<c-z>'
        vim.g.UltiSnipsSnippetDirectories = { 'UltiSnips' }
    end
  }

  -- use('bluz71/vim-nightfly-colors')
  -- use("folke/tokyonight.nvim")
  -- use("bluz71/vim-nightfly-colors")
  use {
      'numToStr/Comment.nvim',
      config = function()
          require('Comment').setup()
      end
  }
  use {
  'VonHeikemen/lsp-zero.nvim',
  branch = 'v3.x',
  requires = {
    {'williamboman/mason.nvim'},
    {'williamboman/mason-lspconfig.nvim'},
    {'neovim/nvim-lspconfig'},
    {'hrsh7th/nvim-cmp'},
    {'hrsh7th/cmp-nvim-lsp'},
    {'L3MON4D3/LuaSnip'},
  }

}

  end)

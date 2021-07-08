return require('packer').startup(function()
    
  -- Packer can manage itself as an optional plugin
  use {'wbthomason/packer.nvim', opt = true}

  -- Color scheme
  use { 'sainnhe/gruvbox-material' }
  use { 'sainnhe/sonokai' }
  use {'folke/tokyonight.nvim'}

  -- Fuzzy finder
  use {
      'nvim-telescope/telescope.nvim',
      requires = {{'nvim-lua/popup.nvim'}, {'nvim-lua/plenary.nvim'}}
  }
  use {
        "nvim-telescope/telescope-fzy-native.nvim",
    }

  -- LSP and completion
  use { 'neovim/nvim-lspconfig' }
  use { 'nvim-lua/completion-nvim' }
  use { 'hrsh7th/nvim-compe' }
  use { 'kabouzeid/nvim-lspinstall' }

  --dap debugger
  use { 'mfussenegger/nvim-dap'}

  --jdtls LSP
  use { 'mfussenegger/nvim-jdtls' }
   
  --Nerd tree and commenter
  use { 'kyazdani42/nvim-web-devicons' }
  use {
        'kyazdani42/nvim-tree.lua',
        commit = "fd7f60e242205ea9efc9649101c81a07d5f458bb",
        config = function()
          require("config.nvimtree").config()
        end,
    }

  --use { 'preservim/nerdtree' }
  use { 'preservim/nerdcommenter' }
  use { 'tiagofumo/vim-nerdtree-syntax-highlight' }

  --auto pairs
  use {"lukas-reineke/indent-blankline.nvim"}
  use {
	"windwp/nvim-autopairs"
	}
  --use { 'Raimondi/delimitMate' }
  
  --treesitter
  use {"nvim-treesitter/nvim-treesitter", run = ":TSUpdate"}
  use {'nvim-treesitter/nvim-treesitter-textobjects'}
  use { 'nvim-treesitter/playground' }
  
  --ui stuff and navigation
  use { 'glepnir/galaxyline.nvim' }
  use { 'mhinz/vim-startify' }
  use { 'liuchengxu/vim-which-key' }
  use { 'psliwka/vim-smoothie' }
  use {'kevinhwang91/nvim-hlslens'}

  -- Vim dispatch
  --use { 'tpope/vim-dispatch' }

  -- Fugitive for Git
  use { 'tpope/vim-fugitive' }

  --Rich presence
  use { 'andweeb/presence.nvim'}

end)

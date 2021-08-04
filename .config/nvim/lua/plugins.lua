return require('packer').startup(function()
  -- Packer can manage itself as an optional plugin
  use {'wbthomason/packer.nvim', opt = true}

  -- Color scheme
  use { 'sainnhe/gruvbox-material' }
  use { 'sainnhe/sonokai' }
  use {'folke/tokyonight.nvim'}

  use {'norcalli/nvim-colorizer.lua'}
  -- Fuzzy finder
  use {
      'nvim-telescope/telescope.nvim',
      requires = {{'nvim-lua/popup.nvim'}, {'nvim-lua/plenary.nvim'}}
  }
  use {
        "nvim-telescope/telescope-fzy-native.nvim",
    }
  --wild af wildmenu
  use { 'gelguy/wilder.nvim' }

  --snippets
  use { 'L3MON4D3/LuaSnip' }
  use { 'SirVer/ultisnips' }

  -- LSP and completion
  use { 'neovim/nvim-lspconfig' }
  --use { 'nvim-lua/completion-nvim' }
  use { 'hrsh7th/nvim-compe' }
  use { 'kabouzeid/nvim-lspinstall' }

  --dap debugger
  use { 'mfussenegger/nvim-dap'}

  --jdtls LSP
  use { 'mfussenegger/nvim-jdtls' }

  --icons
  use { 'kyazdani42/nvim-web-devicons' }
  --use{ 'yamatsum/nvim-nonicons' }

  --tree and commenter
  use {
        'kyazdani42/nvim-tree.lua',
        config = function()
          require("config.nvimtree").config()
        end,
    }
  use { 'preservim/nerdcommenter' }

  --indent stuff
  use {"lukas-reineke/indent-blankline.nvim"}
  use {	"windwp/nvim-autopairs" }

  --treesitter
  use {"nvim-treesitter/nvim-treesitter", run = ":TSUpdate"}
  use {'nvim-treesitter/nvim-treesitter-textobjects'}
  use { 'nvim-treesitter/playground' }

  --ui stuff and navigation
  use { 'glepnir/galaxyline.nvim' }
  use { 'mhinz/vim-startify' }
  use { 'psliwka/vim-smoothie' }
  use {'kevinhwang91/nvim-hlslens'}
  use { 'Xuyuanp/scrollbar.nvim' }
  use { 'romgrk/barbar.nvim' }

  use { 'liuchengxu/vim-which-key' }
  use {
    'AckslD/nvim-whichkey-setup.lua',
    requires = {'liuchengxu/vim-which-key'},
}


  use {'p00f/cphelper.nvim', rocks = 'http', requires = 'nvim-lua/plenary.nvim'}

  -- Vim dispatch
  --use { 'tpope/vim-dispatch' }

  -- Fugitive for Git
  use { 'tpope/vim-fugitive' }

  --Rich presence
  use { 'andweeb/presence.nvim'}

  --terminal
  use{ 'akinsho/nvim-toggleterm.lua' }

end)

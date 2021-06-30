return require('packer').startup(function()
    
  -- Packer can manage itself as an optional plugin
  use {'wbthomason/packer.nvim', opt = true}

  -- Color scheme
  use { 'sainnhe/gruvbox-material' }
  use { 'sainnhe/sonokai' }

  -- Fuzzy finder
  use {
      'nvim-telescope/telescope.nvim',
      requires = {{'nvim-lua/popup.nvim'}, {'nvim-lua/plenary.nvim'}}
  }

  -- LSP and completion
  use { 'neovim/nvim-lspconfig' }
  use { 'nvim-lua/completion-nvim' }

  --jdtls LSP
  use { 'mfussenegger/nvim-jdtls' }
  
  -- Lua development
  --use { 'tjdevries/nlua.nvim' }
   
  --Nerd tree and commenter
  use { 'preservim/nerdtree' }
  use { 'preservim/nerdcommenter' }

  --auto pairs
  use { 'jiangmiao/auto-pairs' }
  
  --treesitter
  use {"nvim-treesitter/nvim-treesitter", run = ":TSUpdate"}
  use {'nvim-treesitter/nvim-treesitter-textobjects'}
  use { 'nvim-treesitter/playground' }
  
  --galaxyline.nvim
  use { 'glepnir/galaxyline.nvim' }

  -- Vim dispatch
  --use { 'tpope/vim-dispatch' }

  -- Fugitive for Git
  --use { 'tpope/vim-fugitive' }

end)

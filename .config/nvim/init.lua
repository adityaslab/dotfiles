--require('lv-galaxyline')
require('config')
require('lv-treesitter')

-- Map leader to space key
vim.g.mapleader = ' '

local fn = vim.fn
local execute = vim.api.nvim_command

-- Sensible defaults
require('settings')

-- Key mappings
require('keymappings')

--auto install of packer.nvim
local install_path = fn.stdpath('data')..'/site/pack/packer/opt/packer.nvim'
if fn.empty(fn.glob(install_path)) > 0 then
  execute('!git clone https://github.com/wbthomason/packer.nvim '..install_path)
end
vim.cmd [[packadd packer.nvim]]
vim.cmd 'autocmd BufWritePost plugins.lua PackerCompile' -- Auto compile when there are changes in plugins.lua

vim.cmd 'let g:neovide_cursor_antialiasing=v:true'

--LSP
require('lsp')
require('lspinstall')

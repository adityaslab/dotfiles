local utils = require('utils')

--Escape remap
utils.map('i', 'jk', '<Esc>')
utils.map('i', 'jj', '<Esc>')
utils.map('i', 'kj', '<Esc>')

--windows movement
vim.api.nvim_set_keymap('n', '<C-h>', '<C-w>h', {silent = true})
vim.api.nvim_set_keymap('n', '<C-j>', '<C-w>j', {silent = true})
vim.api.nvim_set_keymap('n', '<C-k>', '<C-w>k', {silent = true})
vim.api.nvim_set_keymap('n', '<C-l>', '<C-w>l', {silent = true})

vim.cmd([[tnoremap <Esc> <C-\><C-n>]])


-- resize with arrows
vim.api.nvim_set_keymap('n', '<C-r>=', ':resize -5<CR>', {silent = true})
vim.api.nvim_set_keymap('n', '<C-r>-', ':resize +5<CR>', {silent = true})
vim.api.nvim_set_keymap('n', '<C-r><', ':vertical resize -5<CR>', {silent = true})
vim.api.nvim_set_keymap('n', '<C-r>>', ':vertical resize +5<CR>', {silent = true})


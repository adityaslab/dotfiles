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
vim.cmd 'inoremap { {<CR>}<Esc>ko'

--leader key+ l to toggle highlight
vim.cmd ([[nnoremap <silent> <leader>l :noh<CR>]])

-- resize with arrows
vim.api.nvim_set_keymap('n', '<C-r>=', ':resize -5<CR>', {silent = true})
vim.api.nvim_set_keymap('n', '<C-r>-', ':resize +5<CR>', {silent = true})
vim.api.nvim_set_keymap('n', '<C-r><', ':vertical resize -5<CR>', {silent = true})
vim.api.nvim_set_keymap('n', '<C-r>>', ':vertical resize +5<CR>', {silent = true})

-- Tab switch buffer
vim.api.nvim_set_keymap("n", "<TAB>", ":bnext<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<S-TAB>", ":bprevious<CR>", { noremap = true, silent = true })


--telescope keybinds
vim.cmd[[ 
    nnoremap <leader>ff <cmd>lua require('telescope.builtin').find_files()<cr>
    nnoremap <leader>fg <cmd>lua require('telescope.builtin').live_grep()<cr>
    nnoremap <leader>fb <cmd>lua require('telescope.builtin').buffers()<cr>
    nnoremap <leader>fh <cmd>lua require('telescope.builtin').help_tags()<cr>
    nnoremap <leader>fs <cmd>lua require('telescope.builtin').grep_string()<cr>

    nnoremap <leader>fv <cmd>lua require('config.telescope').nconf()<cr>
    nnoremap <leader>fc <cmd>lua require('config.telescope').browse_code()<cr>

]]

--nvim tree keybinds
vim.cmd[[
    nnoremap <C-n> :NvimTreeToggle<CR>
    nnoremap <leader>r :NvimTreeRefresh<CR>
    nnoremap <leader>n :NvimTreeFindFile<CR>
]]

local utils = require('utils')

--Escape remap
utils.map('i', 'jk', '<Esc>')
utils.map('i', 'jj', '<Esc>')
utils.map('i', 'kj', '<Esc>')
utils.map('i', '<C>', '<Esc>')
utils.map('v', '<C>', '<Esc>')

--windows movement
vim.api.nvim_set_keymap('n', '<C-h>', '<C-w>h', {silent = true})
vim.api.nvim_set_keymap('n', '<C-j>', '<C-w>j', {silent = true})
vim.api.nvim_set_keymap('n', '<C-k>', '<C-w>k', {silent = true})
vim.api.nvim_set_keymap('n', '<C-l>', '<C-w>l', {silent = true})

vim.cmd([[tnoremap <Esc> <C-\><C-n>]])
--vim.cmd 'inoremap { {<CR>}<Esc>ko'

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

--terminal
vim.api.nvim_set_keymap('n','t',':ToggleTerm<CR>',{silent = true})

--telescope keybinds
vim.cmd[[ 
    nnoremap <leader>fd <cmd>lua require('telescope.builtin').file_browser()<cr>
    nnoremap <leader>ff <cmd>lua require('telescope.builtin').find_files()<cr>
    nnoremap <leader>fg <cmd>lua require('telescope.builtin').live_grep()<cr>
    nnoremap <leader>fb <cmd>lua require('telescope.builtin').buffers()<cr>
    nnoremap <leader>fh <cmd>lua require('telescope.builtin').help_tags()<cr>

    nnoremap <leader>fv <cmd>lua require('config.telescope').nconf()<cr>
    nnoremap <leader>fc <cmd>lua require('config.telescope').browse_code()<cr>
    nnoremap <leader>fh <cmd>lua require('config.telescope').browse_home()<cr>

    nnoremap <A-CR> <cmd>lua require('telescope.builtin').lsp_code_actions(require('telescope.themes').get_ivy({winblend = 10,layout_strategy='bottom_pane',layout_config={height=0.25}}))<cr>

]]

--nvim tree keybinds
vim.cmd[[
    nnoremap <C-n> :NvimTreeToggle<CR>
    nnoremap <leader>R :NvimTreeRefresh<CR>
    nnoremap <leader>n :NvimTreeFindFile<CR>
]]

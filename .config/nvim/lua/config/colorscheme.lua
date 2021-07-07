local utils = require('utils')
local cmd = vim.cmd

utils.opt('o', 'termguicolors', true)
cmd[[let g:sonokai_style ='andromeda']]
cmd[[let g:sonokai_enable_italic = 1]]
cmd[[let g:sonokai_disable_italic_comment = 1]]


cmd 'colorscheme sonokai'


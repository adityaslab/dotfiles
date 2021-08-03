local utils = require('utils')
local cmd = vim.cmd

utils.opt('o', 'termguicolors', true)
--cmd[[let g:sonokai_style ='andromeda']]
--cmd[[let g:sonokai_enable_italic = 1]]
--cmd[[let g:sonokai_disable_italic_comment = 1]]

vim.g.tokyonight_style = "storm"
vim.g.tokyonight_italic_functions = true
vim.g.tokyonight_sidebars = { "qf", "vista_kind", "terminal", "packer" }

-- Change the "hint" color to the "orange" color, and make the "error" color bright red
vim.g.tokyonight_colors = { hint = "orange", error = "#ff0000" }


cmd 'colorscheme tokyonight' --sonokai, tokyonight, gruvbox-material

require'nvim-web-devicons'.setup {
 -- your personnal icons can go here (to override)
 -- DevIcon will be appended to `name`
 override = {
  zsh = {
    icon = "",
    color = "#428850",
    name = "Zsh"
  }
 };
 -- globally enable default icons (default to false)
 -- will get overriden by `get_icons` option
 default = true;
}

local status_ok, telescope = pcall(require, "telescope")
if not status_ok then
  return
end
local actions = require "telescope.actions"
-- if O.plugin.trouble.active then
--     local trouble = require("trouble.providers.telescope")
-- end
-- Global remapping
------------------------------
-- '--color=never',
telescope.setup {
  defaults = {
    find_command = {
      "rg",
      "--no-heading",
      "--with-filename",
      "--line-number",
      "--column",
      "--smart-case",
    },
    prompt_prefix = " ",
    selection_caret = " ",
    entry_prefix = "  ",
    initial_mode = "insert",
    selection_strategy = "reset",
    sorting_strategy = "descending",
    layout_strategy = "horizontal",
    layout_config = {
      width = 0.75,
      prompt_position = "bottom",
      preview_cutoff = 120,
      horizontal = { mirror = false },
      vertical = { mirror = false },
    },
    file_sorter = require("telescope.sorters").get_fzy_sorter,
    file_ignore_patterns = {},
    generic_sorter = require("telescope.sorters").get_generic_fuzzy_sorter,
    --shorten_path = true,
    path_display = {'shorten'},
    winblend = 0,
    border = {},
    borderchars = { "─", "│", "─", "│", "╭", "╮", "╯", "╰" },
    color_devicons = true,
    use_less = true,
    set_env = { ["COLORTERM"] = "truecolor" }, -- default = nil,
    file_previewer = require("telescope.previewers").vim_buffer_cat.new,
    grep_previewer = require("telescope.previewers").vim_buffer_vimgrep.new,
    qflist_previewer = require("telescope.previewers").vim_buffer_qflist.new,

    -- Developer configurations: Not meant for general override
    buffer_previewer_maker = require("telescope.previewers").buffer_previewer_maker,
    mappings = {
      i = {
        ["<c-d>"] = require("telescope.actions").delete_buffer,
        ["<C-c>"] = actions.close,
        ["<C-j>"] = actions.move_selection_next,
        ["<C-k>"] = actions.move_selection_previous,
        -- ["<c-t>"] = trouble.open_with_trouble,
        ["<C-q>"] = actions.smart_send_to_qflist + actions.open_qflist,
        -- To disable a keymap, put [map] = false
        -- So, to not map "<C-n>", just put
        -- ["<c-x>"] = false,
        -- ["<esc>"] = actions.close,

        -- Otherwise, just set the mapping to the function that you want it to be.
        -- ["<C-i>"] = actions.select_horizontal,

        -- Add up multiple actions
        ["<CR>"] = actions.select_default + actions.center,

        -- You can perform as many actions in a row as you like
        -- ["<CR>"] = actions.select_default + actions.center + my_cool_custom_action,
      },
      n = {
        ["<C-j>"] = actions.move_selection_next,
        ["<C-k>"] = actions.move_selection_previous,
        -- ["<c-t>"] = trouble.open_with_trouble,
        ["<C-q>"] = actions.smart_send_to_qflist + actions.open_qflist,
        -- ["<C-i>"] = my_cool_custom_action,
      },
    },
  },
  extensions = {
    fzy_native = {
      override_generic_sorter = false,
      override_file_sorter = true,
    },
  },
}


local finders = require'telescope.finders'
local sorters = require'telescope.sorters'
local pickers = require'telescope.pickers'
require('jdtls.ui').pick_one_async = function(items, prompt, label_fn, cb)
  local opts = {}
  pickers.new(opts, {
    prompt_title = prompt,
    finder    = finders.new_table {
      results = items,
      entry_maker = function(entry)
        return {
          value = entry,
          display = label_fn(entry),
          ordinal = label_fn(entry),
        }
      end,
    },
    sorter = sorters.get_generic_fuzzy_sorter(),
    attach_mappings = function(prompt_bufnr)
      actions.select_default:replace(function()
        local selection = actions.get_selected_entry(prompt_bufnr)
        actions.close(prompt_bufnr)

        cb(selection.value)
      end)

      return true
    end,
  }):find()
end


require('telescope').load_extension('fzy_native')

local M = {}

function M.nconf()
    require('telescope.builtin').file_browser {
        prompt_title = ' NVim Config Browse',
        --shorten_path = false,
        path_display ={'shorten'},
        cwd = '~/.config/nvim',
        layout_strategy = 'horizontal',
        layout_config = {preview_width = 0.65, width = .75}
    }
end

function M.browse_code()
    require('telescope.builtin').find_files {
        prompt_title = ' Browse ~/Doc/code',
        --shorten_path = false,
        path_display = {'shorten'},
        cwd = '~/Documents/code',
        layout_strategy = 'flex',
        layout_config = {height = 0.7, width = 0.65}
    }
end

function M.browse_home()
    require('telescope.builtin').find_files {
        prompt_title = ' Browse ~',
        --shorten_path = false,
        path_display = {'shorten'},
        cwd = '~',
        layout_strategy = 'flex',
        layout_config = {height = 0.7, width = 0.65}
    }
end


return M

local settings = require('core.settings')
local actions = require('telescope.actions')
local state = require('telescope.actions.state')

local borders = {
  single  = { '─', '│', '─', '│', '┌', '┐', '┘', '└' },
  rounded = { '─', '│', '─', '│', '╭', '╮', '╯', '╰' },
  shadow  = { ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ' },
  double  = { '═', '║', '═', '║', '╔', '╗', '╝', '╚' },
  solid   = { '━', '┃', '━', '┃', '┏', '┓', '┛', '┗' },
}

local layout_config = {
  horizontal = {
    prompt_position = 'top',
    preview_width = 0.55,
    results_width = 0.8,
  },
  vertical = {
    mirror = false,
  },
  width = 0.87,
  height = 0.80,
  preview_cutoff = 120,
}

local pickers = {
  colorscheme = {
    enable_preview = true,
    attach_mappings = function(prompt_bufnr, map)
      map('i', '<CR>', function()
        local theme = state.get_selected_entry().value
        settings.add({ theme = theme })
        vim.defer_fn(function() vim.cmd('colorscheme ' .. theme) end, 0)
        actions.close(prompt_bufnr)
      end)
      return true
    end,
  },
}

require('telescope').setup {
  defaults = {
    prompt_prefix = ' > ',
    selection_caret = ' > ',
    path_display = { 'smart' },
    entry_prefix = '  ',
    initial_mode = 'insert',
    selection_strategy = 'reset',
    sorting_strategy = 'ascending',
    layout_strategy = 'horizontal',
    borderchars = borders[settings.get().window_border],
    layout_config = layout_config,
  },
  pickers = pickers,
}

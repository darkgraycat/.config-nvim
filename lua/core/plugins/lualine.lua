local settings = require('core.settings').get()

local separators = {
  solid = { { left = ' ', right = ' ' }, { left = ' ', right = ' ' } },
  arrow = { { left = '', right = '' }, { left = '', right = '' } },
  round = { { left = '', right = '' }, { left = '', right = '' } },
  cutted = { { left = '\\', right = '/' }, { left = '', right = '' } }
}

require('lualine').setup {
  options = {
    icons_enabled = true,
    theme = settings.lualine_theme or 'auto',
    padding = 2,
    component_separators = separators[settings.lualine_style][1],
    section_separators = separators[settings.lualine_style][2],
  },
  sections = {
    lualine_a = { 'mode' },
    lualine_b = { 'branch', 'diff', 'diagnostics' },
    lualine_c = { { 'filename', path = 2 } },
    lualine_x = { 'encoding', 'fileformat', 'filetype' },
    lualine_y = { 'progress' },
    lualine_z = { 'location' }
  },
  tabline = {
    lualine_a = { 'buffers' },
    lualine_b = { 'selectioncount' },
    lualine_c = { 'searchcount' },
    lualine_z = { 'tabs' },
    lualine_y = { 'datetime' },
  },
}

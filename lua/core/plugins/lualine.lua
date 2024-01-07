local settings = require('core.settings')

local separators_styles = {
  solid = { { left = ' ', right = ' ' }, { left = ' ', right = ' ' } },
  arrow = { { left = '', right = '' }, { left = '', right = '' } },
  round = { { left = '', right = '' }, { left = '', right = '' } },
  cutted = { { left = '\\', right = '/' }, { left = '', right = '' } }
}
local style = separators_styles[settings.get().lualine_style]
local theme = settings.get().lualine_theme

require('lualine').setup {
  options = {
    icons_enabled = true,
    theme = theme or 'auto',
    component_separators = style[1],
    section_separators = style[2],
  },
  sections = {
    lualine_a = { 'mode' },
    lualine_b = { 'branch', 'diff', 'diagnostics' },
    lualine_c = { { 'filename', path = 1 } },
    lualine_x = { 'encoding', 'fileformat', 'filetype' },
    lualine_y = { 'progress' },
    lualine_z = { 'location' }
  },
  tabline = {
    lualine_a = { 'buffers' },
    lualine_z = { 'tabs' },
  },
}

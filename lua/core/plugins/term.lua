local term = require('toggleterm')
local settings = require('core.settings').get()

term.setup({
  size = 20,
  direction = 'float',
  open_mapping = [[<c-\>]],
  float_opts = { border = settings.window_border },
  winblend = 3,
})

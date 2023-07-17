local term = require('toggleterm')
local settings = require('core.functions').load_json('settings')

term.setup({
	size = 20,
  direction = 'float',
  open_mapping = [[<c-\>]],
  float_opts = { border = settings.window_border },
  winblend = 3,
})

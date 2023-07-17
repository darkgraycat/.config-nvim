local settings = require('core.functions').load_json('settings')

local vim_opts = {
  termguicolors = true,
  signcolumn = 'yes',
  backspace = 'indent,eol,start',
	mouse = 'a',
	showcmd = true,
	laststatus = 2,
	autowrite = true,
	cursorline = true,
	autoread = true,
	shiftround = true,
	scrolloff = 8,
	autoindent = true,
	expandtab = true,
	number = settings.shownumbers,
	relativenumber = settings.showrelativenumbers,
	tabstop = settings.tabwidth,
	shiftwidth = settings.tabwidth,
	wrap = settings.wrap,
  ignorecase = true,
  smartcase = true,
}

for k, v in pairs(vim_opts) do
	vim.opt[k] = v
end

vim.cmd('colorscheme ' .. settings.theme)

local fn = require('core.functions')

local function apply(settings)
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
end

local function get()
  return fn.load_json('settings')
end

local function set(table)
  apply(table)
  fn.save_json(table, 'settings')
end

local function init()
  apply(get())
end

local function add(table)
  local settings = get()
  for key, value in pairs(table) do
    settings[key] = value
  end
  set(settings)
end

return {
  set =  set,
  get = get,
  add = add,
  init = init,
}

require('nvim_comment').setup()
require('nvim-autopairs').setup()
require('which-key').setup()
require('ufo').setup({
  provider_selector = function(bufnr, filetype, buftype)
    return { 'treesitter', 'indent' }
  end
})

require('indent_blankline').setup({
  char = '▏',
  space_char_blankline = ' ',
  show_current_context = true,
  show_current_context_start = true,
})

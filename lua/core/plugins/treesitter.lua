require('nvim-treesitter.configs').setup {
  ensure_installed = { "vim", "lua", "rust", "javascript", "markdown", "markdown_inline" },
  sync_install = false,
  auto_install = true,
  highlight = {
    enable = true
  }
}

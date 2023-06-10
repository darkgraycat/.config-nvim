ColorsThemeCurrent = 'horizon'

function ColorsSetTheme(theme)
    ColorsThemeCurrent = theme or ColorsThemeCurrent
    vim.cmd.colorscheme(ColorsThemeCurrent)

    vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
    vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
end

ColorsSetTheme()

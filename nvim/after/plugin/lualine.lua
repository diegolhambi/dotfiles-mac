require('lualine').setup({
    options = {
        theme = 'gruvbox',
        section_separators = '',
        component_separators = ''
    },
    sections = {
        lualine_b = { 'branch', 'diagnostics' },
        lualine_c = { { 'filename', path = 1 } },
        lualine_x = { 'diff' }
    },
    inactive_sections = {
        lualine_c = { { 'filename', path = 1 } }
    }
})

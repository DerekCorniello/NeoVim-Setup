local lualine = require('lualine')
local customtheme = require 'lualine.themes.ayu_dark'
customtheme.normal.b.bg = '#0c0c0c'
customtheme.normal.c.bg = '#0c0c0c'
customtheme.normal.b.fg = '#c8c8c8'
customtheme.normal.c.fg = '#c8c8c8'

local config = {
    options = {
        theme = customtheme,
        component_separators = { left = "", right = "" },
        section_separators = { left = "", right = "" },
        globalstatus = true,
        refresh = {
            statusline = 100,
        },
    },
    sections = {
        lualine_a = {
            { "fancy_mode", width = 7 }
        },
        lualine_b = {
            { "fancy_branch" },
            { "fancy_macro" },
        },
        lualine_c = {
            {
                "filename",
                path = 3,
                file_status = true,
                symbols = {
                    modified = '[Not Saved]',
                    readonly = '[Read Only]',
                }
            }
        },
        lualine_x = {
            { "fancy_diagnostics" },
            { "fancy_diff" },
            { "fancy_lsp_servers" }
        },
        lualine_y = {
            { "fancy_filetype", ts_icon = "" }
        },
        lualine_z = {
            { "fancy_searchcount", timeout = 500 },
            { "fancy_location" },
        },
    }
}

lualine.setup(config)

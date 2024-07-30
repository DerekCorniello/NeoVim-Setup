local lualine = require('lualine')

local config = {
    options = {
        theme = "auto",
        component_separators = { left = "", right = "" },
        section_separators = { left = "", right = "" },
        globalstatus = true,
        refresh = {
            statusline = 100,
        },
    },
    sections = {
        lualine_a = {
            { "fancy_mode", width = 7
            }
        },
        lualine_b = {
            { "fancy_branch" },
            { "fancy_diff" },
        },
        lualine_c = {
            { "filename", path = 1 }
        },
        lualine_x = {
            { "fancy_macro" },
            { "fancy_diagnostics" },
            { "fancy_searchcount" },
            { "fancy_location" },
        },
        lualine_y = {
            { "fancy_filetype", ts_icon = "" }
        },
        lualine_z = {
            { "fancy_lsp_servers" }
        },
    }
}

lualine.setup(config)

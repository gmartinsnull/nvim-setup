require("lualine").setup {
    options = {
        icons_enabled = true,
        component_separators = "|",
        section_separators = "",
    },
    sections = {
        lualine_x = {
            {
                require("noice").api.status.mode.get,
                cond = require("noice").api.status.mode.has,
                color = { fg = "white" },
            },
            {
                require("noice").api.status.command.get,
                cond = require("noice").api.status.command.has,
                color = { fg = "white" },
            },
        },
        lualine_a = {
            {
                "buffers",
                buffers_color = {
                    -- Same values as the general color option can be used here.
                    active = { fg = "#2a2a2a", bg = "#ffa500" }, -- Color for active buffer
                    inactive = { fg = "#ffa500", bg = "#0000000" },
                },
                symbols = {
                    modified = ' ●', -- Text to show when the buffer is modified
                    alternate_file = '# ', -- Text to show to identify the alternate file
                    directory = '', -- Text to show when the buffer is a directory
                },
            },
        },
    },
}

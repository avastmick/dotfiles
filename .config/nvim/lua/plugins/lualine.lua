-- Fancier statusline
return {
    "nvim-lualine/lualine.nvim",
    config = function()
        local colorscheme = require("helpers.colorscheme")
        local lualine_theme = colorscheme == "default" and "auto" or colorscheme
        -- Silly, but I like it
        local os_icon
        if vim.fn.has("macunix") then
            os_icon = ""
        else
            os_icon = ""
        end

        -- Trouble integration
        local trouble = require("trouble")
        local symbols = trouble.statusline({
            mode = "lsp_document_symbols",
            groups = {},
            title = false,
            filter = { range = true },
            format = "{kind_icon}{symbol.name:Normal}",
        })

        require("lualine").setup({
            options = {
                icons_enabled = true,
                theme = lualine_theme,
                component_separators = "|",
                section_separators = "",
            },
            sections = {
                lualine_a = { "mode" },
                lualine_b = { {
                    'branch',
                    icon = '',
                    'diagnostics',
                } },
                lualine_c = { {
                    'filename',
                    path = 1,
                    { symbols = { symbols.get, cond = symbols.has } },
                } },
                lualine_x = { "encoding", { "fileformat", symbols = { unix = os_icon } }, "filetype" },
                lualine_y = { "progress" },
                lualine_z = { "location" },
            },
        })
    end,

}

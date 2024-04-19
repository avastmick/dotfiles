-- Fancier statusline
--
return {
    "nvim-lualine/lualine.nvim",
    config = function()
        local colorscheme = require("helpers.colorscheme")
        local lualine_theme = colorscheme == "default" and "auto" or colorscheme

        local os_icon
        if vim.fn.has("macunix") then
            os_icon = ""
        else
            os_icon = ""
        end

        require("lualine").setup({
            options = {
                icons_enabled = true,
                theme = lualine_theme,
                globalstatus = true,
                component_separators = ' ',
                section_separators = { left = "", right = "" },
            },
            sections = {
                lualine_a = { 'mode' },
                lualine_b = {
                    {
                        'filename',
                        path = 1,
                        symbols = {
                            modified = '●',
                            alternate_file = '#',
                            directory = '',
                        },
                    },
                    {
                        'branch',
                        icon = '',
                    },
                },
                lualine_c = { {
                    'diagnostics',

                    -- Table of diagnostic sources, available sources are:
                    --   'nvim_lsp', 'nvim_diagnostic', 'nvim_workspace_diagnostic', 'coc', 'ale', 'vim_lsp'.
                    -- or a function that returns a table as such:
                    --   { error=error_cnt, warn=warn_cnt, info=info_cnt, hint=hint_cnt }
                    sources = { 'nvim_workspace_diagnostic' },

                    -- Displays diagnostics for the defined severity types
                    sections = { 'error', 'warn', 'info', 'hint' },

                    diagnostics_color = {
                        -- Same values as the general color option can be used here.
                        error = 'DiagnosticError', -- Changes diagnostics' error color.
                        warn  = 'DiagnosticWarn',  -- Changes diagnostics' warn color.
                        info  = 'DiagnosticInfo',  -- Changes diagnostics' info color.
                        hint  = 'DiagnosticHint',  -- Changes diagnostics' hint color.
                    },
                    symbols = { error = " ", warn = " ", hint = "󱩎 ", info = " " },
                    colored = true,          -- Displays diagnostics status in color if set to true.
                    update_in_insert = true, -- Update diagnostics in insert mode.
                    always_visible = false,  -- Show diagnostics even if there are none.
                } },
                lualine_x = { "encoding", { "fileformat", symbols = { unix = os_icon } }, "filetype" },
                lualine_y = { "progress" },
                lualine_z = { "location" },
            },
        })
    end,

}

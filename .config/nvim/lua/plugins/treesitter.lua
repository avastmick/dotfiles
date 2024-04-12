-- Highlight, edit, and navigate code
return {
    {
        "nvim-treesitter/nvim-treesitter",
        -- Install
        build = function()
            pcall(require("nvim-treesitter.install").update({ with_sync = true }))
        end,
        dependencies = {
            -- "nvim-treesitter/nvim-treesitter-context",
            "nvim-treesitter/nvim-treesitter-textobjects",
            "nushell/tree-sitter-nu",
        },
        config = function()
            require("nvim-treesitter.configs").setup({
                -- Add languages to be installed here that you want installed for treesitter
                ensure_installed = { "bash", "c", "cpp", "go", "lua", "markdown", "markdown_inline", "python", "regex", "rust", "vimdoc", "vim" },
                sync_install = false,
                auto_install = true,
                ignore_install = {},

                highlight = { enable = true },
                indent = { enable = true, disable = { "python" } },
                incremental_selection = {
                    enable = true,
                    keymaps = {
                        init_selection = "<c-space>",
                        node_incremental = "<c-space>",
                        scope_incremental = "<c-s>",
                        node_decremental = "<c-backspace>",
                    },
                },
                textobjects = {
                    select = {
                        enable = true,
                        lookahead = true, -- Automatically jump forward to textobj, similar to targets.vim
                        keymaps = {
                            -- You can use the capture groups defined in textobjects.scm
                            ["aa"] = "@parameter.outer",
                            ["ia"] = "@parameter.inner",
                            ["af"] = "@function.outer",
                            ["if"] = "@function.inner",
                            ["ac"] = "@class.outer",
                            ["ic"] = "@class.inner",
                        },
                    },
                    move = {
                        enable = true,
                        set_jumps = true, -- whether to set jumps in the jumplist
                        goto_next_start = {
                            ["]m"] = "@function.outer",
                            ["]]"] = "@class.outer",
                        },
                        goto_next_end = {
                            ["]M"] = "@function.outer",
                            ["]["] = "@class.outer",
                        },
                        goto_previous_start = {
                            ["[m"] = "@function.outer",
                            ["[["] = "@class.outer",
                        },
                        goto_previous_end = {
                            ["[M"] = "@function.outer",
                            ["[]"] = "@class.outer",
                        },
                    },
                },
                modules = {},
            })
            -- Treesitter context - Currently broken with ugly white line separator that I cannot remove
            -- May not be due to plugin, but an issue with another
            -- require 'treesitter-context'.setup({
            --     enable = false,         -- Enable this plugin (Can be enabled/disabled later via commands)
            --     max_lines = 9,          -- How many lines the window should span. Values <= 0 mean no limit.
            --     min_window_height = 20, -- Minimum editor window height to enable context. Values <= 0 mean no limit.
            --     line_numbers = true,
            --     multiline_threshold = 9,
            --     trim_scope = 'inner', -- Which context lines to discard if `max_lines` is exceeded. Choices: 'inner', 'outer'
            --     mode = 'cursor',      -- Line used to calculate context. Choices: 'cursor', 'topline'
            --     -- -- Separator between context and content. Should be a single character string, like '-'.
            --     -- -- When separator is set, the context will only show up when there are at least 2 lines above cursorline.
            --     separator = nil,
            --     zindex = 20,     -- The Z-index of the context window
            --     on_attach = nil, -- (fun(buf: integer): boolean) return false to disable attaching

            --     -- Cannot have the following AND the treesitter context plugin enable = false
            --     -- vim.api.nvim_set_hl(0, 'TreesitterContextBottom', { gui = 'underline', guisp = 'Grey' }),
            --     -- vim.api.nvim_set_hl(0, 'TreesitterContextLineNumberBottom', { gui = 'underline', guisp = 'Grey' }),

            -- })
        end,
    },
}

return {
    "folke/noice.nvim",
    event = "VeryLazy",
    opts = {
        -- add any options here
    },
    dependencies = {
        -- if you lazy-load any plugin below, make sure to add proper `module="..."` entries
        "MunifTanjim/nui.nvim",
    },
    config = function()
        require('noice').setup({
            -- Ensure background is set to transparent
            views = {
                mini = {
                    win_options = {
                        -- Ensure transparent background for mini
                        winblend = 0
                    }
                },
            },
            presets = {
                lsp_doc_border = true, -- Default is false, which leads to no border on LSP hover
            },
            lsp = {
                -- override markdown rendering so that **cmp** and other plugins use **Treesitter**
                override = {
                    ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
                    ["vim.lsp.util.stylize_markdown"] = true,
                    ["cmp.entry.get_documentation"] = true, -- requires hrsh7th/nvim-cmp
                },
            },
        })
    end
}

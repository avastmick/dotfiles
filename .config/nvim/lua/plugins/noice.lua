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
            }
        })
    end
}

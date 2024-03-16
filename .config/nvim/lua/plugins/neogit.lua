return {
    "NeogitOrg/neogit",
    dependencies = {
        "nvim-lua/plenary.nvim",         -- required
        "sindrets/diffview.nvim",        -- optional - Diff integration

        "nvim-telescope/telescope.nvim", -- optional
    },
    config = function()
        vim.keymap.set("n", "<leader>gs", vim.cmd.Neogit)
        local neogit = require("neogit")
        neogit.setup {
            -- Setup neogit with the options you want
        }
    end
}

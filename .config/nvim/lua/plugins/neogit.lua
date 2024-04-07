return {
    "NeogitOrg/neogit",
    dependencies = {
        "nvim-lua/plenary.nvim",         -- required
        "sindrets/diffview.nvim",        -- optional - Diff integration

        "nvim-telescope/telescope.nvim", -- optional
    },
    config = function()
        local map = require("helpers.keys").map
        map("n", "<leader>gs", vim.cmd.Neogit, "Toggle git status in Neogit")
        local neogit = require("neogit")
        neogit.setup {
            -- Setup neogit with the options you want
        }
    end
}

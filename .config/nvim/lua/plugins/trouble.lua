return {
    {
        "folke/trouble.nvim",
        dependencies = { "nvim-tree/nvim-web-devicons" },
        config = function()
            require("trouble").setup({
                icons = true,
                position = "bottom", -- in [ "left", "right", "bottom"]
                height = 5,          -- height of the trouble list when position is top or bottom
                padding = false,     -- Add padding to the list
            })

            local map = require("helpers.keys").map
            map("n", "<leader>tt", function()
                require("trouble").toggle()
            end, "Toggle trouble pane")

            map("n", "<leader>tn", function()
                require("trouble").next({ skip_groups = true, jump = true });
            end, "Next trouble item")

            map("n", "<leader>tp", function()
                require("trouble").previous({ skip_groups = true, jump = true });
            end, "Previous trouble item")
        end
    },
}

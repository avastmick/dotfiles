return {
    "folke/todo-comments.nvim",
    requires = { "nvim-lua/plenary.nvim" },
    opts = {},
    config = function()
        require("todo-comments").setup({})
    end
}

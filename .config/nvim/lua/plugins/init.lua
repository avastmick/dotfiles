return {

    {
        "nvim-lua/plenary.nvim",
        name = "plenary"
    },
    -- Commenting things out.
    "tpope/vim-commentary",

    -- Undo tree.
    "mbbill/undotree",

    -- GitHub copilot integration.
    {
        "github/copilot.vim",
        -- Turn off copilot by default.
        vim.cmd(':Copilot disable')
    },

    -- Vim tutorials and games.
    "theprimeagen/vim-be-good",
}

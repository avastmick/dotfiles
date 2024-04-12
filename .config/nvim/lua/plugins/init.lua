return {
    {
        "nvim-lua/plenary.nvim",
        name = "plenary"
    },

    -- Start screen.
    {
        'goolord/alpha-nvim',
        dependencies = { 'nvim-tree/nvim-web-devicons' },
        config = function()
            require 'alpha'.setup(require 'alpha.themes.startify'.config)
        end
    },

    -- Commenting things out.
    "tpope/vim-commentary",

    -- Undo tree.
    "mbbill/undotree",

    -- GitHub copilot integration.
    "github/copilot.vim",

    -- Vim tutorials and games.
    "theprimeagen/vim-be-good",
}

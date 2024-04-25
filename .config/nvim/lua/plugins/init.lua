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

    -- Vim tutorials
    -- I like the idea of hardtime, but right now the new keyboard and
    -- trying to fix my awful typing is enough new to learn. Add back later.
    -- {
    --     "m4xshen/hardtime.nvim",
    --     dependencies = { "MunifTanjim/nui.nvim", "nvim-lua/plenary.nvim" },
    --     opts = {}
    -- },
    "theprimeagen/vim-be-good",
}

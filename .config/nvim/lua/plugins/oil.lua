return {
    'stevearc/oil.nvim',
    dependencies = {
        { 'nvim-treesitter/nvim-treesitter' },
        { 'nvim-tree/nvim-web-devicons',    lazy = true },
    },
    opts = {
        default_file_explorer = false,
        view_options = {
            show_hidden = true,
            is_always_hidden = function(name, _)
                return vim.startswith(name, '.DS_Store')
            end,
        },
    },

    config = function(_, opts)
        local map = require("helpers.keys").map
        local oil = require('oil')
        oil.setup(opts)
        map('n', '-', oil.open_float, "Open parent directory")
    end
}

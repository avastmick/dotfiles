-- This file can be loaded by calling `lua require('plugins')` from your init.vim
--
-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
    -- Packer can manage itself
    -- TODO: Packer is no longer maintained. Look at options for replacement.
    use 'wbthomason/packer.nvim'
    -- Finding stuff
    use {
        'nvim-telescope/telescope.nvim', tag = '0.1.5',
        requires = { { 'nvim-lua/plenary.nvim' } }
    }
    use("theprimeagen/harpoon")
    use({
        "folke/trouble.nvim",
        config = function()
            require("trouble").setup {
                icons = true,
                -- Using defaults
            }
        end
    })

    -- Treesitter
    use {
        'nvim-treesitter/nvim-treesitter',
        run = function()
            local ts_update = require('nvim-treesitter.install').update({ with_sync = true })
            ts_update()
        end, }
    use("nvim-treesitter/playground")
    use("nvim-treesitter/nvim-treesitter-context");
    -- Color scheme
    use("ellisonleao/gruvbox.nvim")
    -- statusline
    use('ojroques/nvim-hardline')
    use("mbbill/undotree")
    use("tpope/vim-fugitive")
    use("tpope/vim-commentary")

    use {
        'VonHeikemen/lsp-zero.nvim',
        branch = 'v1.x',
        requires = {
            -- LSP Support
            { 'neovim/nvim-lspconfig' },
            { 'williamboman/mason.nvim' },
            { 'williamboman/mason-lspconfig.nvim' },

            -- Autocompletion
            { 'hrsh7th/nvim-cmp' },
            { 'hrsh7th/cmp-buffer' },
            { 'hrsh7th/cmp-path' },
            { 'saadparwaiz1/cmp_luasnip' },
            { 'hrsh7th/cmp-nvim-lsp' },
            { 'hrsh7th/cmp-nvim-lua' },

            -- Snippets
            { 'L3MON4D3/LuaSnip' },
            { 'rafamadriz/friendly-snippets' },
        }
    }

    use({
        'folke/todo-comments.nvim',
        requires = { { 'nvim-lua/plenary.nvim' } }
    })

    use("github/copilot.vim")
    -- marks manager
    use("chentoast/marks.nvim")
    use("eandrju/cellular-automaton.nvim")
end)

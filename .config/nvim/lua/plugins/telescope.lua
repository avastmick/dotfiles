-- Telescope fuzzy finding (all the things)
return {
    {
        "nvim-telescope/telescope.nvim",
        branch = "0.1.x",
        dependencies = {
            "nvim-lua/plenary.nvim",
            -- Fuzzy Finder Algorithm which requires local dependencies to be built. Only load if `make` is available
            { "nvim-telescope/telescope-fzf-native.nvim", build = "make", cond = vim.fn.executable("make") == 1 },
            -- File Browser
            "nvim-telescope/telescope-file-browser.nvim",
        },
        config = function()
            require("telescope").setup({
                defaults = {
                    mappings = {
                        i = {
                            ["<C-u>"] = false,
                            ["<C-d>"] = false,
                            ["<C-j>"] = require("telescope.actions").move_selection_next,
                            ["<C-k>"] = require("telescope.actions").move_selection_previous,
                        },
                    },
                },
                pickers = {
                    buffers = {
                        mappings = {
                            i = {
                                ["<C-d>"] = require("telescope.actions").delete_buffer,
                            }
                        }
                    },
                    find_files = {
                        hidden = true
                    }
                },
                extensions = {
                    file_browser = {
                        -- disables netrw and use telescope-file-browser in its place
                        hijack_netrw = true,
                    },
                },
            })
            require("telescope").load_extension("file_browser")
            require("telescope").load_extension("noice")

            -- Enable telescope fzf native, if installed
            pcall(require("telescope").load_extension, "fzf")

            local map = require("helpers.keys").map

            map('n', '<leader>ff', require("telescope.builtin").find_files, "Fuzzy find files")
            map("n", "<leader>fo", require("telescope.builtin").oldfiles, "Find (recently) opened files")
            map("n", "<leader>fs", require("telescope.builtin").lsp_document_symbols, "Find Symbols in current buffer")
            map("n", "<leader>fw", require("telescope.builtin").grep_string, "Find current word in project")
            map("n", "<leader>fb", ":Telescope file_browser path=%:p:h select_buffer=true<CR>",
                "File browser opened in current directory path")

            map("n", "<leader>b", require("telescope.builtin").buffers, "View open buffers")
            map("n", "<leader>/", function()
                require("telescope.builtin").current_buffer_fuzzy_find(require("telescope.themes").get_dropdown({
                    winblend = 0,
                    previewer = false,
                }))
            end, "Search in current buffer")

            map("n", "<leader>sk", require("telescope.builtin").keymaps, "Search keymaps")
            map("n", "<leader>sh", require("telescope.builtin").help_tags, "Search help")
            map("n", "<leader>sg", require("telescope.builtin").live_grep, "Search with grep in current directory path")
            map("n", "<leader>sd", require("telescope.builtin").diagnostics, "Search current project diagnostics")
        end,
    },
}

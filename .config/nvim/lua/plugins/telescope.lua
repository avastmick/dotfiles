-- Telescope fuzzy finding (all the things)
return {
    {
        "nvim-telescope/telescope.nvim",
        branch = "0.1.x",
        dependencies = {
            "nvim-lua/plenary.nvim",
            -- Fuzzy Finder Algorithm which requires local dependencies to be built. Only load if `make` is available
            { "nvim-telescope/telescope-fzf-native.nvim", build = "make", cond = vim.fn.executable("make") == 1 },
        },
        config = function()
            require("telescope").setup({
                defaults = {
                    mappings = {
                        i = {
                            ["<C-u>"] = false,
                            ["<C-d>"] = false,
                        },
                    },
                },
                pickers = {
                    buffers = {
                        mappings = {
                            i = {
                                ["<c-d>"] = require("telescope.actions").delete_buffer,
                            }
                        }
                    }
                },
                extensions = {
                    file_browser = {
                        -- disables netrw and use telescope-file-browser in its place
                        hijack_netrw = true,
                    },
                },
            })
            require("telescope").load_extension "file_browser"

            -- Enable telescope fzf native, if installed
            pcall(require("telescope").load_extension, "fzf")

            local map = require("helpers.keys").map
            map("n", "<leader>of", require("telescope.builtin").oldfiles, "Recently opened")
            map('n', '<leader>pf', require("telescope.builtin").find_files, {})
            map("n", "<leader>bf", require("telescope.builtin").buffers, "Open buffers")
            map("n", "<leader>/", function()
                -- You can pass additional configuration to telescope to change theme, layout, etc.
                require("telescope.builtin").current_buffer_fuzzy_find(require("telescope.themes").get_dropdown({
                    winblend = 0,
                    previewer = false,
                }))
            end, "Search in current buffer")

            map("n", "<leader>sk", require("telescope.builtin").keymaps, "Search keymaps")
            map("n", "<leader>sh", require("telescope.builtin").help_tags, "Help")
            map("n", "<leader>sw", require("telescope.builtin").grep_string, "Current word")
            map("n", "<leader>sg", require("telescope.builtin").live_grep, "Grep")
            map("n", "<leader>sd", require("telescope.builtin").diagnostics, "Diagnostics")

            -- Map to use Meta key (Alt) instead of Ctrl
            map("n", "<M-f>", require("telescope.builtin").find_files, "Files")
            map("n", "<M-b>", require("telescope.builtin").buffers, "Open buffers")
        end,
    },
}

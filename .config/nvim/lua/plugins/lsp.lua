-- LSP Configuration & Plugins
return {
    {
        "neovim/nvim-lspconfig",
        dependencies = {
            "williamboman/mason.nvim",
            "williamboman/mason-lspconfig.nvim",
            {
                "j-hui/fidget.nvim",
                tag = "v1.4.0",
                event = "LspAttach",
            },
            "folke/neodev.nvim",
            "RRethy/vim-illuminate",
            "hrsh7th/cmp-nvim-lsp",
        },
        config = function()
            -- Set up Mason before anything else
            require("mason").setup()
            require("mason-lspconfig").setup({
                ensure_installed = {
                    "lua_ls",
                    "pylsp",
                    "jsonls",
                },
                automatic_installation = true,
                -- Explicitly limit to rust-analyzer
                rust_analyzer = function()
                    return true
                end,
            })

            -- Quick access via keymap
            require("helpers.keys").map("n", "<leader>M", "<cmd>Mason<cr>", "Show Mason")

            -- Neodev setup before LSP config
            require("neodev").setup()

            -- Turn on LSP status information
            require("fidget").setup({
                -- Need to set the fidget window to be transparent
                notification = {
                    window = {
                        winblend = 0,
                        max_width = 70,
                        max_height = 0,
                        relative = "editor",
                    },
                },
            })

            -- Set up cool signs for diagnostics
            local signs = { Error = " ", Warn = " ", Hint = "󱩎 ", Info = " " }
            for type, icon in pairs(signs) do
                local hl = "DiagnosticSign" .. type
                vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
            end

            -- Diagnostic config
            local config = {
                virtual_text = true,
                signs = {
                    active = signs,
                },
                update_in_insert = true,
                underline = true,
                severity_sort = true,
                float = {
                    focusable = true,
                    style = "minimal",
                    border = "rounded",
                    source = "always",
                    header = "",
                    prefix = "",
                },
            }
            vim.diagnostic.config(config)

            -- This function gets run when an LSP connects to a particular buffer.
            local on_attach = function(client, bufnr)
                local lsp_map = require("helpers.keys").lsp_map

                lsp_map("<leader>lr", vim.lsp.buf.rename, bufnr, "Rename symbol")
                lsp_map("<leader>la", vim.lsp.buf.code_action, bufnr, "Code action")
                lsp_map("<leader>ld", vim.lsp.buf.type_definition, bufnr, "Type definition")
                lsp_map("<leader>ls", require("telescope.builtin").lsp_document_symbols, bufnr, "Document symbols")

                lsp_map("gd", vim.lsp.buf.definition, bufnr, "Goto Definition")
                lsp_map("gr", require("telescope.builtin").lsp_references, bufnr, "Goto References")
                lsp_map("gI", vim.lsp.buf.implementation, bufnr, "Goto Implementation")
                lsp_map("gD", vim.lsp.buf.declaration, bufnr, "Goto Declaration")

                -- Create a command `:Format` local to the LSP buffer
                vim.api.nvim_buf_create_user_command(bufnr, "Format", function(_)
                    vim.lsp.buf.format()
                end, { desc = "Format current buffer with LSP" })

                lsp_map("<leader>F", "<cmd>Format<cr>", bufnr, "Format")

                -- Attach and configure vim-illuminate
                require("illuminate").on_attach(client)
            end


            -- nvim-cmp supports additional completion capabilities, so broadcast that to servers
            local capabilities = vim.lsp.protocol.make_client_capabilities()
            capabilities = require("cmp_nvim_lsp").default_capabilities(capabilities)

            -- Lua
            require("lspconfig")["lua_ls"].setup({
                on_attach = on_attach,
                capabilities = capabilities,
                settings = {
                    Lua = {
                        completion = {
                            callSnippet = "Replace",
                        },
                        diagnostics = {
                            globals = { "vim" },
                        },
                        workspace = {
                            library = {
                                [vim.fn.expand("$VIMRUNTIME/lua")] = true,
                                [vim.fn.stdpath("config") .. "/lua"] = true,
                            },
                        },
                    },
                },
            })

            -- Python
            require("lspconfig")["pylsp"].setup({
                on_attach = on_attach,
                capabilities = capabilities,
                settings = {
                    pylsp = {
                        plugins = {
                            flake8 = {
                                enabled = true,
                                maxLineLength = 88, -- Black's line length
                            },
                            -- Disable plugins overlapping with flake8
                            pycodestyle = {
                                enabled = false,
                            },
                            mccabe = {
                                enabled = false,
                            },
                            pyflakes = {
                                enabled = false,
                            },
                            -- Use Black as the formatter
                            autopep8 = {
                                enabled = false,
                            },
                        },
                    },
                },
            })

            -- JSON
            require("lspconfig")["jsonls"].setup({
                on_attach = on_attach,
                capabilities = capabilities,
                settings = {
                    jsonls = {
                        cmd = { "vscode-json-language-server", "--stdio" },
                        filetypes = { "json", "jsonc" },
                        init_options = {
                            provideFormatter = true,
                        },
                    },
                },
            })
            ---
            -------------------------------------------------------------------
            -- Rust specific config - only runs when Rust LSP is running.
            -------------------------------------------------------------------
            vim.g.rustaceanvim = {

                -- Plugin configuration
                tools = {
                    -- Configure hover panes
                    float_win_config = {
                        border = {
                            { "╭", "FloatBorder" },
                            { "─", "FloatBorder" },
                            { "╮", "FloatBorder" },
                            { "│", "FloatBorder" },
                            { "╯", "FloatBorder" },
                            { "─", "FloatBorder" },
                            { "╰", "FloatBorder" },
                            { "│", "FloatBorder" },
                        },
                        max_width = nil,
                        max_height = nil,
                        auto_focus = false,
                    },
                },
                server = {
                    on_attach = function(_, bufnr)
                        local lsp_map = require("helpers.keys").lsp_map

                        lsp_map("<leader>la", function() vim.cmd.RustLsp { 'codeAction' } end, bufnr,
                            "(Rust) Code action")
                        lsp_map("<leader>lr", vim.lsp.buf.rename, bufnr, "Rename symbol")
                        lsp_map("<leader>ld", vim.lsp.buf.type_definition, bufnr, "Type definition")
                        lsp_map("<leader>ls", require("telescope.builtin").lsp_document_symbols, bufnr,
                            "Document symbols")

                        lsp_map("<leader>F", "<cmd>Format<cr>", bufnr, "Format")

                        lsp_map("K", function() vim.cmd.RustLsp { 'hover', 'actions' } end, bufnr,
                            "(Rust) Hover documentation")
                        lsp_map("gd", require("telescope.builtin").lsp_definitions, bufnr, "Goto Definition")
                        lsp_map("gr", require("telescope.builtin").lsp_references, bufnr, "Goto References")
                        lsp_map("gI", vim.lsp.buf.implementation, bufnr, "Goto Implementation")
                        lsp_map("gD", vim.lsp.buf.declaration, bufnr, "Goto Declaration")
                    end,
                    default_settings = {
                        -- rust-analyzer language server configuration
                        ['rust-analyzer'] = {
                        },
                    },
                }
            }
            -------------------------------------------------------------------
        end,
    },
}

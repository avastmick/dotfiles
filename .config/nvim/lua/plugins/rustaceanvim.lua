-- Rust specific configuration
-- Note that I DO NOT use the LSP for Rust.
-- See: https://github.com/mrcjkb/rustaceanvim for more details.
return {
    'mrcjkb/rustaceanvim',
    version = '^4',
    ft = { 'rust' },
    config = function()
        local bufnr = vim.api.nvim_get_current_buf()
        -- Rust LSP mappings
        -- Code action
        vim.keymap.set(
            "n",
            "<leader>la",
            function()
                vim.cmd.RustLsp('codeAction') -- supports rust-analyzer's grouping
                -- or vim.lsp.buf.codeAction() if you don't want grouping.
            end,
            { silent = true, buffer = bufnr }
        )
        -- Rename
        vim.keymap.set(
            "n",
            "<leader>lr",
            function()
                vim.cmd.RustLsp('rename')
                -- or vim.lsp.buf.rename() if you don't want grouping.
            end,
            { silent = true, buffer = bufnr }
        )

        -- Standard LSP mappings
        -- Goto definition
        vim.keymap.set(
            "n",
            "gd",
            function()
                vim.lsp.buf.definition()
            end,
            { silent = true, buffer = bufnr }
        )
        -- Goto references
        vim.keymap.set(
            "n",
            "gr",
            function()
                require("telescope.builtin").lsp_references()
            end,
            { silent = true, buffer = bufnr }
        )
        -- Hover
        vim.keymap.set(
            "n",
            "K",
            function()
                vim.lsp.buf.hover()
            end,
            { silent = true, buffer = bufnr }
        )
    end,
}

-- The following are the original LSP mappings for reference. Those with a "*" are implemented above.
--
--    * vim.keymap.set("<leader>lr", vim.lsp.buf.rename, bufnr, "Rename symbol")
--    * vim.keymap.set("<leader>la", vim.lsp.buf.code_action, bufnr, "Code action")
--     vim.keymap.set("<leader>ld", vim.lsp.buf.type_definition, bufnr, "Type definition")
--     vim.keymap.set("<leader>ls", require("telescope.builtin").lsp_document_symbols, bufnr, "Document symbols")

--    * vim.keymap.set("gd", vim.lsp.buf.definition, bufnr, "Goto Definition")
--    * vim.keymap.set("gr", require("telescope.builtin").lsp_references, bufnr, "Goto References")
--     vim.keymap.set("gI", vim.lsp.buf.implementation, bufnr, "Goto Implementation")
--     vim.keymap.set("K", vim.lsp.buf.hover, bufnr, "Hover Documentation")
--     vim.keymap.set("gD", vim.lsp.buf.declaration, bufnr, "Goto Declaration")

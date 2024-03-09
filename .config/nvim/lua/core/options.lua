local opts = {
    guicursor = "n:block,i:ver75-Cursor",
    -- tabs
    shiftwidth = 4,
    tabstop = 4,
    expandtab = true,
    -- wrap
    wrap = true,
    termguicolors = true,
    -- line numbering
    nu = true,
    relativenumber = true,
}

-- Set options from table
for opt, val in pairs(opts) do
    vim.o[opt] = val
end

-- Configure Netrw
vim.g.netrw_banner = 0    -- Disables the Netrw banner. Press 'I' to toggle.
vim.g.netrw_liststyle = 3 -- Sets the view to treeview.

-- Colourscheme set-up
local colorscheme = require("helpers.colorscheme")
vim.cmd.colorscheme(colorscheme)

-- Format on save
vim.cmd [[autocmd BufWritePre * lua vim.lsp.buf.format()]]

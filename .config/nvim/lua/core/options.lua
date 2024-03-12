local opts = {
    guicursor = "n:block,i:ver75-Cursor",
    scrolloff = 8,
    signcolumn = "yes",
    updatetime = 50,
    -- tabs
    shiftwidth = 4,
    tabstop = 4,
    expandtab = true,
    smartindent = true,
    -- wrap
    wrap = true,
    -- colours
    termguicolors = true,
    -- line numbering
    nu = true,
    relativenumber = true,
    -- showmode off as using lua-line
    showmode = false,
    -- swap /undo
    swapfile = false,
    backup = false,
    undodir = os.getenv("HOME") .. "/.vim/undodir",
    undofile = true,
}

-- Set options from table
for opt, val in pairs(opts) do
    vim.o[opt] = val
end

-- Configure Netrw
vim.g.netrw_banner = 0    -- Disables the Netrw banner. Press 'I' to toggle.
vim.g.netrw_liststyle = 3 -- Sets the view to treeview.

-- Colourscheme set-up
vim.o.termguicolors = true
local colorscheme = require("helpers.colorscheme")
vim.cmd.colorscheme(colorscheme)

-- Format on save
vim.cmd [[autocmd BufWritePre * lua vim.lsp.buf.format()]]

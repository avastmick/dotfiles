-- Fetch and setup colorscheme if available, otherwise just return 'default'
-- This should prevent Neovim from complaining about missing colorschemes on first boot
local function get_if_available(name, opts)
    local lua_ok, colorscheme = pcall(require, name)
    if lua_ok then
        colorscheme.setup(opts)
        return name
    end

    local vim_ok, _ = pcall(vim.cmd.colorscheme, name)
    if vim_ok then
        return name
    end

    return "default"
end

-- Uncomment the colorscheme to use

-- Catppuccin
local colorscheme = get_if_available('catppuccin', {
    --                             -- light ----------------> dark
    flavour = "macchiato",         -- latte, frappe, macchiato, mocha
    transparent_background = true, -- disables setting the background color.
    background = {                 -- :h background
        light = "latte",
        dark = "macchiato",
    },
    show_end_of_buffer = true, -- shows the '~' characters after the end of buffers
    term_colors = true,        -- sets terminal colors (e.g. `g:terminal_color_0`)
    custom_highlights = function(colors)
        return {
            CursorLineNr = { fg = colors.flamingo },
            CursorLine = { bg = colors.none },
        }
    end,
})

return colorscheme

return {
    "shortcuts/no-neck-pain.nvim",
    version = "*",
    opts = {},
    config = function()
        require("no-neck-pain").setup({
            width = 160,
            autocmds = {
                -- When `true`, enables the plugin when you start Neovim.
                enableOnVimEnter = true,
                -- When `true`, enables the plugin when you enter a new Tab.
                enableOnTabEnter = true,
                -- When `true`, reloads the plugin configuration after a colorscheme change.
                reloadOnColorSchemeChange = false,
                -- When `true`, entering one of no-neck-pain side buffer will automatically skip it and go to the next available buffer.
                skipEnteringNoNeckPainBuffer = true,
            },
            mappings = {
                -- When `true`, creates all the mappings that are not set to `false`.
                --- @type boolean
                enabled = true,
                -- Sets a global mapping to Neovim, which allows you to toggle the plugin.
                -- When `false`, the mapping is not created.
                --- @type string
                toggle = "<Leader>zn",
                -- Sets a global mapping to Neovim, which allows you to toggle the left side buffer.
                -- When `false`, the mapping is not created.
                --- @type string
                toggleLeftSide = "<Leader>zql",
                -- Sets a global mapping to Neovim, which allows you to toggle the right side buffer.
                -- When `false`, the mapping is not created.
                --- @type string
                toggleRightSide = "<Leader>zqr",
                -- Sets a global mapping to Neovim, which allows you to increase the width (+5) of the main window.
                -- When `false`, the mapping is not created.
                --- @type string | { mapping: string, value: number }
                widthUp = "<Leader>z=",
                -- Sets a global mapping to Neovim, which allows you to decrease the width (-5) of the main window.
                -- When `false`, the mapping is not created.
                --- @type string | { mapping: string, value: number }
                widthDown = "<Leader>z-",
                -- Sets a global mapping to Neovim, which allows you to toggle the scratchPad feature.
                -- When `false`, the mapping is not created.
                --- @type string
                scratchPad = "<Leader>zs",
            },
            buffers = {
                -- When `true`, the side buffers will be named `no-neck-pain-left` and `no-neck-pain-right` respectively.
                --- @type boolean
                setNames = false,
                -- Leverages the side buffers as notepads, which work like any Neovim buffer and automatically saves its content at the given `location`.
                -- note: quitting an unsaved scratchPad buffer is non-blocking, and the content is still saved.
                --- see |NoNeckPain.bufferOptionsScratchPad|
                scratchPad = NoNeckPain.bufferOptionsScratchPad,
                -- colors to apply to both side buffers, for buffer scopped options @see |NoNeckPain.bufferOptions|
                --- see |NoNeckPain.bufferOptionsColors|
                colors = NoNeckPain.bufferOptionsColors,
                -- Vim buffer-scoped options: any `vim.bo` options is accepted here.
                --- @see NoNeckPain.bufferOptionsBo `:h NoNeckPain.bufferOptionsBo`
                bo = NoNeckPain.bufferOptionsBo,
                -- Vim window-scoped options: any `vim.wo` options is accepted here.
                --- @see NoNeckPain.bufferOptionsWo `:h NoNeckPain.bufferOptionsWo`
                wo = {
                    NoNeckPain.bufferOptionsWo,
                    fillchars = "eob: ",
                },
                --- Options applied to the `left` buffer, options defined here overrides the `buffers` ones.
                --- @see NoNeckPain.bufferOptions `:h NoNeckPain.bufferOptions`
                left = {
                    NoNeckPain.bufferOptions,
                    enabled = true,
                },
                --- Options applied to the `right` buffer, options defined here overrides the `buffers` ones.
                --- @see NoNeckPain.bufferOptions `:h NoNeckPain.bufferOptions`
                right = {
                    NoNeckPain.bufferOptions,
                    enabled = true,
                },

            },
        })
        NoNeckPain.bufferOptions = {
            -- When `false`, the buffer won't be created.
            --- @type boolean
            enabled = false,
            --- @see NoNeckPain.bufferOptionsColors `:h NoNeckPain.bufferOptionsColors`
            colors = NoNeckPain.bufferOptionsColors,
            --- @see NoNeckPain.bufferOptionsBo `:h NoNeckPain.bufferOptionsBo`
            bo = NoNeckPain.bufferOptionsBo,
            --- @see NoNeckPain.bufferOptionsWo `:h NoNeckPain.bufferOptionsWo`
            wo = NoNeckPain.bufferOptionsWo,
            --- @see NoNeckPain.bufferOptionsScratchPad `:h NoNeckPain.bufferOptionsScratchPad`
            scratchPad = NoNeckPain.bufferOptionsScratchPad,
        }

        NoNeckPain.bufferOptionsWo = {
            --- @type boolean
            cursorline = false,
            --- @type boolean
            cursorcolumn = false,
            --- @type string
            colorcolumn = "0",
            --- @type boolean
            number = false,
            --- @type boolean
            relativenumber = false,
            --- @type boolean
            foldenable = false,
            --- @type boolean
            list = false,
            --- @type boolean
            wrap = true,
            --- @type boolean
            linebreak = true,
        }

        NoNeckPain.bufferOptionsBo = {
            --- @type string
            filetype = "no-neck-pain",
            --- @type string
            buftype = "nofile",
            --- @type string
            bufhidden = "hide",
            --- @type boolean
            buflisted = false,
            --- @type boolean
            swapfile = false,
        }

        --- NoNeckPain's scratchPad buffer options.
        ---
        --- Leverages the side buffers as notepads, which work like any Neovim buffer and automatically saves its content at the given `location`.
        --- note: quitting an unsaved scratchPad buffer is non-blocking, and the content is still saved.
        ---
        ---@type table
        ---Default values:
        ---@eval return MiniDoc.afterlines_to_code(MiniDoc.current.eval_section)
        NoNeckPain.bufferOptionsScratchPad = {
            -- When `true`, automatically sets the following options to the side buffers:
            -- - `autowriteall`
            -- - `autoread`.
            --- @type boolean
            enabled = false,
            -- The path to the file to save the scratchPad content to and load it in the buffer.
            --- @type string?
            --- @example: `~/notes.norg`
            pathToFile = "",
        }
    end
}

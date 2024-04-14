return {

    "ggandor/leap.nvim",

    config = function()
        -- FIXME there is a clash with the 'S' keymap
        require('leap').create_default_mappings()
    end

}

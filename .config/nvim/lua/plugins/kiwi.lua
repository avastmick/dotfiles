return {
    'serenevoid/kiwi.nvim',
    dependencies = {
        "nvim-lua/plenary.nvim"
    },
    opts = {
        {
            name = "work",
            path = "/Users/avastmick/notes/edu-docs"
        },
        {
            name = "personal",
            path = "/Users/avastmick/notes/local-notes"
        }
    },
    keys = {
        { "<leader>kw", ":lua require(\"kiwi\").open_wiki_index(\"work\")<cr>",     desc = "Open Work Wiki index" },
        { "<leader>kp", ":lua require(\"kiwi\").open_wiki_index(\"personal\")<cr>", desc = "Open Personal Wiki index" },
        { "T",          ":lua require(\"kiwi\").todo.toggle()<cr>",                 desc = "Toggle Markdown Task" }
    },
    lazy = true
}

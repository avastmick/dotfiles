-- Custom key mappings
-- Author: Avastmick
--
-- The leader is set to space. Done in core/lazy.lua

-- Help makes annotation of keymaps easier and consistent
local map = require("helpers.keys").map

map("v", "J", ":m '>+1<CR>gv=gv", "Move visual selected block down with 'J'")
map("v", "K", ":m '<-2<cr>gv=gv", "Move visual selected block down with 'K'")
map("n", "J", "mzJ`z", "Joins two lines")
map("n", "<C-d>", "<C-d>zz", "Move down the page with centered cursor")
map("n", "<C-u>", "<C-u>zz", "Move up the page with centered cursor")
map("n", "n", "nzzzv", "Next search item")
map("n", "N", "Nzzzv", "Next previous item")

map("x", "<leader>p", [["_dP]], "Puts without overwrite of current register")

map({ "n", "v" }, "<leader>y", [["+y]], "yank to system clipboard")
map("n", "<leader>Y", [["+Y]], "yank line to system clipboard")

map({ "n", "v" }, "<leader>d", [["_d]], "Delete to the blackhole register")

map("i", "jk", "<Esc>", "'jk' to <Esc>")
map("t", "jk", [[<C-\><C-n>]], "'jk' to <Esc>")

map("n", "Q", "<nop>", "'Q' to no operation (normally it's exit)")
--
map("n", "<Esc>", function() vim.cmd("noh") end, "Clear search highlighting")
map("n", "<C-c>", function() vim.cmd("noh") end, "Clear search highlighting")


map("n", "<C-k>", "<cmd>cnext<CR>zz", "Goto next quickfix item")
map("n", "<C-j>", "<cmd>cprev<CR>zz", "Goto previous quickfix item")
map("n", "<leader>k", "<cmd>lnext<CR>zz", "Goto next location")
map("n", "<leader>j", "<cmd>lprev<CR>zz", "Goto previous location")

map("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]], "Search and replace on current word")

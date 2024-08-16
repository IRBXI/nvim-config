require "nvchad.mappings"

-- add yours here

local map = vim.keymap.set

map("i", "jk", "<ESC>")
map("n", "<leader>gsj", "<cmd> GoTagAdd json <CR>")
map("n", "<leader>gsy", "<cmd> GoTagAdd yaml <CR>")

-- map({ "n", "i", "v" }, "<C-s>", "<cmd> w <cr>")

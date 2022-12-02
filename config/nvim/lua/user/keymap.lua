-- luacheck: globals vim
local keymap = vim.keymap.set
local opts = { silent = true }

--keymap("", "<Space>", "<Nop>", opts)
vim.g.mapleader = ","
-- Comment
--
keymap("n", "<leader>e", ":NvimTreeToggle<CR>", opts)

local telescope_builtin = require("telescope.builtin")
keymap("n", "<leader>ff", telescope_builtin.find_files, {})
keymap("n", "<leader>fg", telescope_builtin.live_grep, {})

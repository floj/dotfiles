-- luacheck: globals vim
local keymap = vim.keymap.set
local opts = { silent = true }

--keymap("", "<Space>", "<Nop>", opts)
vim.g.mapleader = ","
keymap("n", "<leader>e", "<cmd>NvimTreeToggle<cr>", opts)

local telescope_builtin = require("telescope.builtin")
keymap("n", "<leader>ff", telescope_builtin.find_files, {})
keymap("n", "<leader>fg", telescope_builtin.live_grep, {})

-- trouble.nvim
keymap("n", "<leader>xx", "<cmd>TroubleToggle<cr>", { silent = true, noremap = true })
-- keymap("n", "<leader>xq", "<cmd>TroubleToggle quickfix<cr>", { silent = true, noremap = true })
-- keymap.set("n", "<leader>xw", "<cmd>TroubleToggle workspace_diagnostics<cr>", { silent = true, noremap = true })
-- keymap.set("n", "<leader>xd", "<cmd>TroubleToggle document_diagnostics<cr>", { silent = true, noremap = true })
-- keymap.set("n", "<leader>xl", "<cmd>TroubleToggle loclist<cr>", { silent = true, noremap = true })
-- keymap.set("n", "gR", "<cmd>TroubleToggle lsp_references<cr>", { silent = true, noremap = true })

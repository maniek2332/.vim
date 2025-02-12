vim.api.nvim_set_keymap("n", "go", "o<Esc>", {desc="Add blank line below"})
vim.api.nvim_set_keymap("n", "gO", "O<Esc>", {desc="Add blank line above"})

vim.api.nvim_set_keymap("n", "<A-h>", "gT", {desc="Previous tab"})
vim.api.nvim_set_keymap("n", "<A-l>", "gt", {desc="Next tab"})

vim.api.nvim_set_keymap("n", "<C-h>", "<C-w>h", {desc="Goto left window"})
vim.api.nvim_set_keymap("n", "<C-l>", "<C-w>l", {desc="Goto right window"})
vim.api.nvim_set_keymap("n", "<C-j>", "<C-w>j", {desc="Goto bottom window"})
vim.api.nvim_set_keymap("n", "<C-k>", "<C-w>k", {desc="Goto top window"})

vim.api.nvim_set_keymap("n", "<C-w><C-t>", ":tabnew %<CR>", {desc="Copy window to new tab"})

vim.api.nvim_set_keymap("n", "<F5>", ':lua require("config.launchers").show_launcher()<CR>', {desc="Launcher test!"})
vim.api.nvim_set_keymap("n", "g<F5>", ':lua require("config.launchers").show_launcher({mode = "debug"})<CR>', {desc="Launcher test!"})

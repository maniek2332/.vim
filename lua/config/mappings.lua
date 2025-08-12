vim.api.nvim_set_keymap("n", "go", "o<Esc>", {desc="Add blank line below"})
vim.api.nvim_set_keymap("n", "gO", "O<Esc>", {desc="Add blank line above"})

vim.api.nvim_set_keymap("n", "<A-9>", "gT", {desc="Previous tab"})
vim.api.nvim_set_keymap("n", "<A-0>", "gt", {desc="Next tab"})

vim.api.nvim_set_keymap("n", "<C-A-h>", "gT", {desc="Previous tab"})
vim.api.nvim_set_keymap("n", "<C-A-l>", "gt", {desc="Next tab"})

vim.keymap.set("n", "<A-H>", function() require("smart-splits").resize_left() end, {desc="Resize to left"})
vim.keymap.set("n", "<A-L>", function() require("smart-splits").resize_right() end, {desc="Resize to right"})
vim.keymap.set("n", "<A-J>", function() require("smart-splits").resize_down() end, {desc="Resize bottom"})
vim.keymap.set("n", "<A-K>", function() require("smart-splits").resize_up() end, {desc="Resize up"})

vim.keymap.set("n", "<A-h>", function() require("smart-splits").move_cursor_left() end, {desc="Goto left window/tmux pane"})
vim.keymap.set("n", "<A-l>", function() require("smart-splits").move_cursor_right() end, {desc="Goto right window/tmux pane"})
vim.keymap.set("n", "<A-j>", function() require("smart-splits").move_cursor_down() end, {desc="Goto bottom window/tmux pane"})
vim.keymap.set("n", "<A-k>", function() require("smart-splits").move_cursor_up() end, {desc="Goto top window/tmux pane"})
vim.keymap.set("n", "<A-\\>", function() require("smart-splits").move_cursor_previous() end, {desc="Goto previous window/tmux pane"})

vim.keymap.set("n", "<C-w><C-t>", function() vim.cmd('tab sb ' .. vim.api.nvim_buf_get_number(0)) end, {desc="Copy window to new tab"})

vim.api.nvim_set_keymap("n", "<F5>", ':lua require("config.launchers").show_launcher()<CR>', {desc="Launcher test!"})
vim.api.nvim_set_keymap("n", "g<F5>", ':lua require("config.launchers").show_launcher({mode = "debug"})<CR>', {desc="Launcher test!"})

-- Copilot completions
--
-- TAG:copilot.lua
-- TAG:copilot
-- TAG:completion
-- URL:https://github.com/zbirenbaum/copilot.lua

return {
  {
    'zbirenbaum/copilot.lua',
    enabled = false,
    cmd = 'Copilot',
    event = 'InsertEnter',
    opts = {
      suggestion = {
        enabled = true,
        auto_trigger = true,
        keymap = {
          accept = "<C-f>",
          accept_word = false,
          accept_line = false,
          next = "<C-.>",
          prev = "<C-,>",
          dismiss = "<C-;>",
        },
      },
      filetypes = {
        yaml = true,
      },
    },
  },
}

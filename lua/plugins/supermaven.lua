-- Copilot completions
--
-- TAG:supermaven
-- TAG:copilot
-- TAG:completion
-- URL:https://github.com/supermaven-inc/supermaven-nvim

return {
  {
    'supermaven-inc/supermaven-nvim',
    config = function()
      require("supermaven-nvim").setup({
        keymaps = {
          accept_suggestion = "<C-f>",
          clear_suggestion = "<C-;>",
          accept_word = "<C-j>",
        },
        log_level = "info", -- set to "off" to disable logging completely
      })
    end,
  },
}

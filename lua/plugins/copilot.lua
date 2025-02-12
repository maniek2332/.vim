-- Copilot completions
--
-- TAG:copilot.lua
-- TAG:copilot
-- TAG:completion

return {
  {
    'zbirenbaum/copilot.lua',
    cmd = 'Copilot',
    event = 'InsertEnter',
    opts = {
      suggestion = {
        enabled = true,
        auto_trigger = true,
      },
      filetypes = {
        yaml = true,
      },
    },
  },
}

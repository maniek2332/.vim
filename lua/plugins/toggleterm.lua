-- Neovim's internal terminal manipulation plugin
--
-- TAG:toggleterm
-- TAG:terminal
-- TAG:ui-window

return {
  {
    'akinsho/toggleterm.nvim',
    version = "*",
    opts = {
      open_mapping = [[<C-Enter>]],
      shell = 'xonsh',
    }
  },
}

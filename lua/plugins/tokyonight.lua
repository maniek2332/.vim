-- Colorscheme plugin, includes customization for DAP colors and
-- different background colors for active and inactive windows.
--
-- TAG:tokyonight
-- TAG:colorscheme
-- TAG:visuals

return {
  {
    "folke/tokyonight.nvim",
    enabled = true,
    config = function(_, opts)
      require('tokyonight').setup({})
      vim.cmd([[colorscheme tokyonight-moon]])

      -- TODO try to com up with a better place for configuring those colors
      vim.api.nvim_set_hl(0, 'DapBreakpoint', { ctermbg = 0, fg = '#993939', bg = '#31353f' })
      vim.api.nvim_set_hl(0, 'DapLogPoint', { ctermbg = 0, fg = '#61afef', bg = '#31353f' })
      vim.api.nvim_set_hl(0, 'DapStopped', { ctermbg = 0, fg = '#98c379', bg = '#31353f' })
      vim.api.nvim_set_hl(0, 'DapBreakpointLine', { ctermbg = 0, bg = '#31353f' })
      vim.api.nvim_set_hl(0, 'DapLogPointLine', { ctermbg = 0, bg = '#31353f' })
      vim.api.nvim_set_hl(0, 'DapStoppedLine', { ctermbg = 0, bg = '#31353f' })
      vim.cmd([[highlight LineNr guibg=NONE]])

      -- Background for inactive windows
      vim.cmd([[highlight NormalNC guibg=#222229]])

      -- Background for unfocused windows (via WM)
      vim.api.nvim_create_autocmd(
        {"FocusLost", "FocusGained"},
        {
          callback = function(args)
            if args.event == "FocusLost" then
              -- vim.cmd([[highlight Normal guibg=#222229]])
              vim.cmd([[highlight Normal guibg=#323239]])
              vim.cmd([[highlight NormalNC guibg=#323239]])
            else
              vim.cmd([[highlight Normal guibg=#1a1b26]])
              vim.cmd([[highlight NormalNC guibg=#222229]])
            end
          end
        }
      )
    end,
  },
}

-- Window for navigating through code structure (classes, functions, etc).
--
-- TAG:aerial
-- TAG:navigation
-- TAG:ui-window

return {
  {
    'stevearc/aerial.nvim',
    dependencies = {
       "nvim-treesitter/nvim-treesitter",
       "nvim-tree/nvim-web-devicons"
    },
    opts = {},
    keys = {
      {
        "<leader>AA", "<cmd>AerialNavOpen<CR>",
        desc = "Show Aerial Nav"
      },
    },
  },
}

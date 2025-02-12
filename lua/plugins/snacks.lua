-- Collection of miscellaneous small plugins
--
-- TAG:snacks
-- TAG:visuals

return {
  {
    "folke/snacks.nvim",
    priority = 1000,
    lazy = false,
    ---@type snacks.Config
    opts = {
      scroll = { enabled = true },
    },
  }
}

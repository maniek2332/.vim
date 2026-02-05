-- Welcome screen with LRU files, project files, and more
--
-- TAG:alpha
-- TAG:startscreen
-- URL:https://github.com/goolord/alpha-nvim

return {
  {
    "goolord/alpha-nvim",
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    config = function()
      local startify = require("alpha.themes.startify")
      startify.file_icons.provider = "devicons"
      require("alpha").setup(
        startify.config
      )
    end,
  },
}

-- Plugin for showing git status and performing git operations (commit, push etc.).
--
-- TAG:neogit
-- TAG:git
-- TAG:ui-window

return {
  {
    "NeogitOrg/neogit",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "sindrets/diffview.nvim",
      "nvim-telescope/telescope.nvim",
    },
    config = true,
    keys = {
      {
        "<Leader>GG", function()
          require("neogit").open({kind="floating"})
        end,
        desc = "Open Neogit in a floating window",
      },
      {
        "<Leader>Gt", function()
          require("neogit").open({kind="tab"})
        end,
        desc = "Open Neogit in a new tab",
      },
      {
        "<Leader>Gv", function()
          require("neogit").open({kind="auto"})
        end,
        desc = "Open Neogit in a vertical split",
      },
    },
  },
}

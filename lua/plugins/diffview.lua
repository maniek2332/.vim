-- Show sidebar with details on file changes and conflicts.
--
-- TAG:diffview
-- TAG:git
-- TAG:ui-window

return {
  {
    "sindrets/diffview.nvim",
    config = true,
    cmd = {"DiffviewOpen", "DiffviewClose", "DiffviewToggleFiles", "DiffviewFocusFiles", "DiffviewRefresh"},
    opts = {
      enhanced_diff_hl = true,
    },
    keys = {
      {
        "<Leader>DD", "<cmd>DiffviewOpen<CR>",
        desc = "Open diff view",
      },
      {
        "<Leader>Dq", "<cmd>DiffviewClose<CR>",
        desc = "Close diff view",
      },
    },
  },
}

-- Show (in sign column) information about git added/changed/removes lines.
--
-- TAG:gitsigns
-- TAG:git
-- TAG:signcolumn
-- TAG:visuals

return {
  {
    "lewis6991/gitsigns.nvim",
    event = "BufRead",
    opts = {},
    keys = {
      {
        "]c", function()
          local gitsigns = require("gitsigns")
          if vim.wo.diff then
            vim.cmd.normal({']c', bang = true})
          else
            gitsigns.nav_hunk('next')
          end
        end,
        desc = "Next change (or git hunk)",
      },
      {
        "[c", function()
          local gitsigns = require("gitsigns")
          if vim.wo.diff then
            vim.cmd.normal({'[c', bang = true})
          else
            gitsigns.nav_hunk('prev')
          end
        end,
        desc = "Previous change (or git hunk)",
      },
      {
        "<Leader>hs", function()
          require("gitsigns").stage_hunk()
        end,
        desc = "Stage hunk",
      },
      {
        "<Leader>hs", function()
          require("gitsigns").stage_hunk({vim.fn.line('.'), vim.fn.line('v')})
        end,
        mode = {"v"},
        desc = "Stage hunk",
      },
      {
        "<Leader>hr", function()
          require("gitsigns").reset_hunk()
        end,
        desc = "Reset hunk",
      },
      {
        "<Leader>hr", function()
          require("gitsigns").reset_hunk({vim.fn.line('.'), vim.fn.line('v')})
        end,
        mode = {"v"},
        desc = "Reset hunk",
      },
      {
        "<Leader>hu", function()
          require("gitsigns").undo_stage_hunk()
        end,
        desc = "Undo stage hunk",
      },
      {
        "<Leader>hp", function()
          require("gitsigns").preview_hunk()
        end,
        desc = "Preview hunk",
      },
      {
        "<Leader>hp", function()
          require("gitsigns").preview_hunk()
        end,
        desc = "Preview hunk",
      },
      {
        "<Leader>hb", function()
          require("gitsigns").blame_line({full=true})
        end,
        desc = "Show line blame",
      },
      {
        "<Leader>htb", function()
          require("gitsigns").toggle_current_line_blame()
        end,
        desc = "Toggle current line blame",
      },
      {
        "<Leader>hd", function()
          require("gitsigns").diffthis()
        end,
        desc = "Diff this",
      },
    }
  },
}

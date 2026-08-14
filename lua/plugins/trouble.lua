-- Quickfix-like list of diagnostics and locations. Makes navigation though the quickfix list
-- much easier.
--
-- TAG:trouble
-- TAG:diagnostics
-- TAG:quickfix
-- TAG:ui-window

return {
  {
    "folke/trouble.nvim",
    opts = {}, -- for default options, refer to the configuration section for custom setup.
    config = function(_, opts)
      require("trouble").setup(opts)
      vim.api.nvim_create_autocmd("QuickFixCmdPost", {
        callback = function()
          vim.cmd([[Trouble qflist open]])
        end,
      })
    end,
    cmd = "Trouble",
    keys = {
      {
        "<leader>xx",
        "<cmd>Trouble diagnostics toggle<cr>",
        desc = "Diagnostics (Trouble)",
      },
      {
        "<leader>xX",
        "<cmd>Trouble diagnostics toggle filter.buf=0<cr>",
        desc = "Buffer Diagnostics (Trouble)",
      },
      {
        "<leader>cs",
        "<cmd>Trouble symbols toggle focus=false<cr>",
        desc = "Symbols (Trouble)",
      },
      {
        "<leader>cl",
        "<cmd>Trouble lsp toggle focus=false win.position=right<cr>",
        desc = "LSP Definitions / references / ... (Trouble)",
      },
      {
        "<leader>xL",
        "<cmd>Trouble loclist toggle<cr>",
        desc = "Location List (Trouble)",
      },
      {
        "<leader>xQ",
        "<cmd>Trouble qflist toggle<cr>",
        desc = "Quickfix List (Trouble)",
      },
      {
        "<leader>xs",
        function() require("trouble").open({ mode = "snacks" }) end,
        desc = "Open last Snacks results (content)",
      },
      {
        "<leader>xS",
        function() require("trouble").open({ mode = "snacks_files" }) end,
        desc = "Open last Snacks results (files)",
      },
      {
        "<C-A-j>",
        function()
          require("trouble").next({ skip_groups = true, jump = true })
        end,
        desc = "Next Trouble",
      },
      {
        "<Tab>",
        function()
          require("trouble").next({ skip_groups = true, jump = true })
        end,
        desc = "Next Trouble",
      },
      {
        "<C-A-k>",
        function()
          require("trouble").prev({ skip_groups = true, jump = true })
        end,
        desc = "Previous Trouble",
      },
      {
        "<S-Tab>",
        function()
          require("trouble").prev({ skip_groups = true, jump = true })
        end,
        desc = "Previous Trouble",
      },
    },
  },
}

-- Plugin for running tests.
--
-- TAG:neotest
-- TAG:testing
-- TAG:debugging
-- TAG:ui-window

return {
  {
    "nvim-neotest/neotest",
    dependencies = {
      "nvim-neotest/nvim-nio",
      "nvim-lua/plenary.nvim",
      "antoinemadec/FixCursorHold.nvim",
      "nvim-treesitter/nvim-treesitter",
      "nvim-neotest/neotest-python",
    },
    config = function()
      require("neotest").setup({
        adapters = {
          require("neotest-python")({
            dap = { justMyCode = false },
          }),
        },
      })
    end,
    keys = {
      {
        "<Leader>tt", function()
          require("neotest").run.run()
        end,
        desc = "Run current test function",
      },
      {
        "<Leader>tT", function()
          require("neotest").run.run({strategy = "dap"})
        end,
        desc = "Debug current test function (with DAP)",
      },
      {
        "<Leader>tf", function()
          require("neotest").run.run(vim.fn.expand("%"))
        end,
        desc = "Run current test file",
      },
      {
        "<Leader>tF", function()
          require("neotest").run.run({vim.fn.expand("%"), strategy = "dap"})
        end,
        desc = "Debug current test file (with DAP)",
      },
      {
        "<Leader>tr", function()
          require("neotest").run.run_last()
        end,
        desc = "Rerun last test function",
      },
      {
        "<Leader>tR", function()
          require("neotest").run.run_last({strategy = "dap"})
        end,
        desc = "Debug last test function (with DAP)",
      },
      {
        "<Leader>to", function()
          require("neotest").output.open()
        end,
        desc = "Open test output window",
      },
      {
        "<Leader>tO", function()
          require("neotest").output_panel.toggle()
        end,
        desc = "Open test output panel",
      },
      {
        "<Leader>tS", function()
          require("neotest").summary.toggle()
        end,
        desc = "Open tests tree panel",
      },
      {
        "<Leader>ta", function()
          require("neotest").run.attach()
        end,
        desc = "Attach to test",
      },
    },
  },
}

-- Lint files using old-school linters like `mypy`, `flake8`, `eslint`, etc.
--
-- URL:https://github.com/mfussenegger/nvim-lint
-- TAG:lint
-- TAG:diagnostics

return {
  {
    "mfussenegger/nvim-lint",
    config = function()
      local nvim_lint = require("lint")
      nvim_lint.linters_by_ft = {
        python = { "mypy" },
        lua = { "luacheck" },
      }
      nvim_lint.linters.mypy.cmd = "uvx"
      nvim_lint.linters.mypy.args = { "mypy", "--show-column-numbers", "--show-error-end", "--hide-error-context", "--no-color-output", "--no-error-summary", "--no-pretty" }

      vim.api.nvim_create_autocmd(
        "BufWritePost",
        {
          callback = function()
            require("lint").try_lint()
          end
        }
      )
    end,
  }
}

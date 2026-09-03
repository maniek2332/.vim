-- Collection of miscellaneous small plugins
--
-- TAG:snacks
-- TAG:visuals

local function picker_environment_files(opts)
  local path
  if vim.env.VIRTUAL_ENV then
    path = vim.env.VIRTUAL_ENV
  else
    vim.notify("No virtualenv found", vim.log.levels.WARN)
    return
  end

  Snacks.picker.grep({
    ignored = true,
    dirs = { path },
  })
end

local picker_smart_opts = {
  filter = { cwd = true },
}

return {
  {
    "folke/snacks.nvim",
    priority = 1000,
    lazy = false,
    ---@type snacks.Config
    opts = function(_, opts)
      return vim.tbl_deep_extend("force", opts or {}, {
        scroll = {
          enabled = false
        },
        picker = {
          actions = require("trouble.sources.snacks").actions,
          win = {
            input = {
              keys = {
                ["<a-q>"] = {
                  "trouble_open",
                  mode = { "n", "i" },
                },
                ["<a-Q>"] = {
                  "qflist",
                  mode = { "n", "i" },
                },
              },
            },
          },
        },
      })
    end,
    keys = {
      -- File Navigation
      { "<C-p>p", function() Snacks.picker.smart(picker_smart_opts) end, desc = "Find files/buffers (smart)" },
      { "<C-p><C-p>", function() Snacks.picker.smart(picker_smart_opts) end, desc = "Find files/buffers (smart)" },
      { "<C-p>,", function() Snacks.picker() end, desc = "Snacks builtin pickers" },
      { "<C-p>b", function() Snacks.picker.buffers() end, desc = "Pick buffers" },
      { "<C-p>o", function() Snacks.picker.recent() end, desc = "Pick from previously opened files" },
      { "<C-p>O", function() Snacks.picker.files() end, desc = "Find files" },

      -- Search
      { "<C-p>F", function() Snacks.picker.grep() end, desc = "Live grep" },

      -- Help & Tags
      { "<C-p>h", function() Snacks.picker.help() end, desc = "Pick help tags" },
      { "<C-p>t", function() Snacks.picker.treesitter() end, desc = "Pick current buffer tags" },
      { "<C-p>T", function() Snacks.picker.tags() end, desc = "Pick tags (global)" },

      -- Git
      { "<C-p>g", function() Snacks.picker.git_status() end, desc = "Pick files from git status" },
      { "<C-p>G", function() Snacks.picker.git_files() end, desc = "Pick files tracked by git" },
      { "<C-p>c", function() Snacks.picker.git_log_file() end, desc = "Pick git commits for current buffer" },
      { "<C-p>c", function() Snacks.picker.git_log_line() end, desc = "Pick git commits for selected lines", mode = "v" },

      -- Quickfix & Location List
      { "<C-p>q", function() Snacks.picker.pick("qflist") end, desc = "Pick from quickfix list" },
      { "<C-p>w", function() Snacks.picker.loclist() end, desc = "Pick from loclist" },

      -- Picker Management
      { "<C-p><Enter>", function() Snacks.picker.resume() end, desc = "Resume last picker" },

      -- Marks & Diagnostics
      { "<C-p>m", function() Snacks.picker.marks() end, desc = "Pick from marks" },
      { "<C-p>E", function() Snacks.picker.diagnostics() end, desc = "Pick from diagnostics" },

      -- LSP (Telescope equivalents)
      { "<Backspace>r", function() Snacks.picker.lsp_references() end, desc = "Show LSP references" },
      { "<C-p>s", function() Snacks.picker.lsp_symbols() end, desc = "Show LSP document symbols" },
      { "<C-p>S", function() Snacks.picker.lsp_workspace_symbols() end, desc = "Show LSP workspace symbols" },

      -- LSP Extended (Snacks-only)
      { "<C-p>d", function() Snacks.picker.lsp_definitions() end, desc = "LSP definitions" },
      { "<C-p>i", function() Snacks.picker.lsp_implementations() end, desc = "LSP implementations" },

      -- Search Extended (Snacks-only)
      { "<C-p>*", function() Snacks.picker.grep_word() end, desc = "Grep word under cursor" },
      { "<C-p>/", function() Snacks.picker.lines() end, desc = "Search lines in current buffer" },

      -- Utilities (Snacks-only)
      { "<C-p>;", function() Snacks.picker.commands() end, desc = "Browse commands" },
      { "<C-p>k", function() Snacks.picker.keymaps() end, desc = "Browse keymaps" },
      { "<C-p>C", function() Snacks.picker.colorschemes() end, desc = "Preview colorschemes" },
      { "<C-p>n", "<CMD>Noice pick<CR>", desc = "View notifications" },

      -- External Tools (Snacks-only, if available)
      -- { "<C-p>pr", function() Snacks.picker.gh_pr() end, desc = "GitHub pull requests" },
      -- { "<C-p>is", function() Snacks.picker.gh_issue() end, desc = "GitHub issues" },
      -- { "<C-p>z", function() Snacks.picker.zoxide() end, desc = "Zoxide directory navigation" },

      { "<C-p>v", picker_environment_files, desc = "Search in virtualenv files" },
    },
  }
}

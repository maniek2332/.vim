-- File explorer which behaves like vim buffer window - allows editing file names with
-- regular editing commands, deleting files by deleting lines, creating files by adding new line.
-- Includes plugin for git status.
--
-- TAG:oil
-- TAG:file-explorer
-- TAG:git

return {
  {
    'stevearc/oil.nvim',
    ---@module 'oil'
    ---@type oil.SetupOpts
    opts = {
      default_file_explorer = true,
      columns = {"icon", "size"},
      keymaps = {
        ["g?"] = "actions.show_help",
        ["<CR>"] = "actions.select",
        ["<C-v>"] = { "actions.select", opts = { vertical = true }, desc = "Open the entry in a vertical split" },
        ["<C-s>"] = { "actions.select", opts = { horizontal = true }, desc = "Open the entry in a horizontal split" },
        ["<C-t>"] = { "actions.select", opts = { tab = true }, desc = "Open the entry in new tab" },
        ["<C-;>"] = "actions.preview",
        ["<C-c>"] = "actions.close",
        ["<C-l>"] = "actions.refresh",
        ["-"] = "actions.parent",
        ["_"] = "actions.open_cwd",
        ["`"] = "actions.cd",
        ["~"] = { "actions.cd", opts = { scope = "tab" }, desc = ":tcd to the current oil directory" },
        ["gs"] = "actions.change_sort",
        ["gx"] = "actions.open_external",
        ["g."] = "actions.toggle_hidden",
        ["g\\"] = "actions.toggle_trash",
      },
      use_default_keymaps = false,
      win_options = {
        signcolumn = "yes:2",
      },
    },
    dependencies = {
      "nvim-tree/nvim-web-devicons",
    },
    cmd = { "Oil" },
    keys = {
      {
        "<C-->", "<CMD>Oil<CR>", desc="Open file explorer (Oil)",
      },
    },
  },
  {
    'refractalize/oil-git-status.nvim',
    ---@module 'oil-git-status'
    dependencies = {
      'stevearc/oil.nvim',
    },
    config = true
  },
}

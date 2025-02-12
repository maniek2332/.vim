-- Automatycally trigger buffer save on certain events.
--
-- TAG:autosave

return {
  {
    "https://git.sr.ht/~nedia/auto-save.nvim",
    event = { "BufReadPre" },
    opts = {
      events = { "InsertLeave", "BufLeave", "WinLeave", "TabLeave", "FocusLost" },
      silent = false,
      exclude_ft = { 'neo-tree', 'oil' },
    },
  },
}

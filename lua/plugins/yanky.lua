-- Helper plugin for pasting text and cycling through the yank history.
--
-- TAG:yanky
-- TAG:editing
-- TAG:clipboard

return {
  {
    'gbprod/yanky.nvim',
    opts = {},
    keys = {
      {
        "p", "<Plug>(YankyPutAfter)",
        mode = {"n", "x"},
      },
      {
        "P", "<Plug>(YankyPutBefore)",
        mode = {"n", "x"},
      },
      {
        "gp", "<Plug>(YankyGPutAfter)",
        mode = {"n", "x"},
      },
      {
        "gP", "<Plug>(YankyGPutBefore)",
        mode = {"n", "x"},
      },
      {
        "]p", "<Plug>(YankyPutIndentAfterLinewise)",
        mode = {"n"},
      },
      {
        "]P", "<Plug>(YankyPutIndentBeforeLinewise)",
        mode = {"n"},
      },
      {
        "<Leader>p", "<Plug>(YankyPreviousEntry)",
      },
      {
        "<A-p>", "<Plug>(YankyPreviousEntry)",
      },
      {
        "<Leader>n", "<Plug>(YankyNextEntry)",
      },
      {
        "<A-n>", "<Plug>(YankyNextEntry)",
      },
    },
  },
}

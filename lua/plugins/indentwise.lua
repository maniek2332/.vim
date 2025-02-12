-- Jump between code with specific indentation levels.
--
-- TAG:indentwise
-- TAG:indent
-- TAG:jumping

return {
  {
    "jeetsukumaran/vim-indentwise",
    event = "VeryLazy",
    init = function()
      -- prevent setting default keymaps
      vim.g.indentwise_suppress_keymaps = 0
    end,
    config = false,
    keys = {
      {
        "[-", "<Plug>(IndentWisePreviousLesserIndent)",
        desc = "Move to previous indent on lower level.",
      },
      {
        "[=", "<Plug>(IndentWisePreviousEqualIndent)",
        desc = "Move to previous indent on same level.",
      },
      {
        "[+", "<Plug>(IndentWisePreviousGreaterIndent)",
        desc = "Move to previous indent on higher level.",
      },
      {
        "]-", "<Plug>(IndentWiseNextLesserIndent)",
        desc = "Move to next indent on lower level.",
      },
      {
        "]=", "<Plug>(IndentWiseNextEqualIndent)",
        desc = "Move to next indent on equal level.",
      },
      {
        "]+", "<Plug>(IndentWiseNextGreaterIndent)",
        desc = "Move to next indent on higher level.",
      },
      {
        "[_", "<Plug>(IndentWisePreviousAbsoluteIndent)",
        desc = "Move to next indent on lower level.",
      },
      {
        "]_", "<Plug>(IndentWiseNextAbsoluteIndent)",
        desc = "Move to X indent.",
      },
      {
        "[%", "<Plug>(IndentWiseBlockScopeBoundaryBegin)",
        desc = "Move to X indent.",
      },
      {
        "]%", "<Plug>(IndentWiseBlockScopeBoundaryEnd)",
        desc = "Move to X indent.",
      },
    },
  },
}

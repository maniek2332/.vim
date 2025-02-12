-- Plugin for automatic generation of ctags files.
--
-- TAG:gutentags
-- TAG:tags
-- TAG:ctags
-- TAG:completion

return {
  {
    "ludovicchabant/vim-gutentags",
    event = { "BufWrite" },
    config = function(_, opts)
      vim.g.gutentags_ctags_exclude = {'.mypy_cache', '.pytest_cache', '.git'}
    end
  },
}

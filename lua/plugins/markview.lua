-- Makes markdown files looking much nicer.
--
-- TAG:markview
-- TAG:markdown
-- TAG:visuals

return {
  {
    "OXY2DEV/markview.nvim",
    opts = {
      preview = {
        modes = { "n", "no", "c" },
        hybrid_modes = { "n" },
        callbacks = {
          on_enable = function (_, win)
            vim.wo[win].conceallevel = 2;
            vim.wo[win].conecalcursor = "c";
          end
        }
      }
    }
  },
}

-- Highlight current scope (indent) in the code and provide text objects for it.
--
-- TAG:mini.indentscope
-- TAG:visuals
-- TAG:scope
-- TAG:textobjects

return {
  {
    'echasnovski/mini.indentscope',
    version = '*',
    config = function()
      require('mini.indentscope').setup()
    end,
  },
}

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
      require('mini.indentscope').setup({
        draw = {
          delay = 100, -- Delay in milliseconds before drawing the scope
          animation = require('mini.indentscope').gen_animation.none(), -- No animation
        },
        symbol = '│', -- Character used to represent the scope
        options = {
          try_as_border = true, -- Try to use the symbol as a border
        },
      })
      --
      vim.api.nvim_create_autocmd('FileType', {
        pattern = { 'help', 'alpha', 'dashboard', 'lazy', 'mason', 'neo-tree', 'oil', 'minifiles', 'snacks_terminal' },
        callback = function()
          vim.b.miniindentscope_disable = true
        end,
      })
    end,
  },
}

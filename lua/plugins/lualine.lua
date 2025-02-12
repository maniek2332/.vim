-- Plugin adding better statusline.
--
-- TAG:lualine
-- TAG:visuals

local function running_thing_status()
  local dap = require("dap")
  if dap ~= nil then
    local status = dap.status()
    if status ~= "" then
      return "DAP active"
    end
  end

  return ""
end

return {
  {
    "nvim-lualine/lualine.nvim",
    main = 'lualine',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    opts = {
      theme = "monokai-pro",
      sections = {
        lualine_a = {
          {
            running_thing_status,
            color = { gui = "bold" },
          },
          "mode",
        },
      },
      extensions = { "lazy", "oil", "trouble" },
    },
  },
}

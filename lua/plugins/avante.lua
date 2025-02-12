-- LLM powered chatbot and assistant.
--
-- TAG:avante
-- TAG:llm
-- TAG:assistant
-- TAG:ui-window
-- URL:https://github.com/yetone/avante.nvim

return {
  {
    "yetone/avante.nvim",
    event = "VeryLazy",
    lazy = false,
    version = '*', -- Set this to "*" to always pull the latest release version, or set it to false to update to the latest code changes.
    -- if you want to build from source then do `make BUILD_FROM_SOURCE=true`
    build = "make",
    dependencies = {
      "stevearc/dressing.nvim",
      "nvim-lua/plenary.nvim",
      "MunifTanjim/nui.nvim",
      "nvim-telescope/telescope.nvim", -- for file_selector provider telescope
      "hrsh7th/nvim-cmp", -- autocompletion for avante commands and mentions
      "nvim-tree/nvim-web-devicons", -- or echasnovski/mini.icons
      "zbirenbaum/copilot.lua", -- for providers='copilot'
    },
    -- commands = {"Avante*"},
    opts = {
      mappings = {
        ask = "<leader>Aa",
        edit = "<leader>Ae",
        refresh = "<leader>Ar",
        find = "<leader>Af",
      },
    },
  },
}

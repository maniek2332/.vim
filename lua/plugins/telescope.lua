-- Window for jumping to places (files, buffers, search results, etc.)
--
-- TAG:telescope
-- TAG:search
-- TAG:ui-window

return {
  {
    'nvim-telescope/telescope.nvim',
    dependencies = {
      'nvim-lua/plenary.nvim',
      'folke/trouble.nvim',
      {
        'nvim-telescope/telescope-fzf-native.nvim',
        build = 'cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release',
      },
    },
    config = function(_, opts)
      local telescope = require("telescope")
      local actions = require("telescope.actions")
      local action_layout = require("telescope.actions.layout")
      local trouble = require("trouble.sources.telescope")
      telescope.setup(
        {
          pickers = {
            find_files = {
              hidden = true,
            },
          },
          defaults = {
              layout_strategy = "bottom_pane",
              layout_config = { height = 0.4 },
              cache_picker = {
                num_pickers = 20,
                ignore_empty_prompt = true,
              },
            mappings = {
              i = {
                ["<C-x>"] = trouble.open,
                ["<A-a>"] = action_layout.cycle_layout_next,
                ["<A-s>"] = action_layout.toggle_preview,
                ["<C-s>"] = actions.select_horizontal,
              },
              n = {
                ["<C-x>"] = trouble.open,
                ["<A-a>"] = action_layout.cycle_layout_next,
                ["<A-s>"] = action_layout.toggle_preview,
                ["<C-s>"] = actions.select_horizontal,
              },
            },
            cycle_layout_list = {
              { layout_strategy = "bottom_pane", layout_config = { height = 0.85 } },
              { layout_strategy = "bottom_pane", layout_config = { height = 0.4 } },
            },
          },
        }
      )
      telescope.load_extension('fzf')
    end,
    cmd = 'Telescope',
    keys = {
      {
        "<C-p>p", "<CMD>Telescope find_files<CR>",
        desc="Find files",
      },
      {
        "<C-p><C-p>", "<CMD>Telescope find_files<CR>",
        desc="Find files",
      },
      {
        "<C-p>,", "<CMD>Telescope builtin<cr>",
        desc="Telescope builtin pickers",
      },
      {
        "<C-p>F", ":Telescope live_grep<cr>",
        desc="Live grep",
      },
      {
        "<C-p>b", ":Telescope buffers<cr>",
        desc="Pick buffers",
      },
      {
        "<C-p>h", ":Telescope help_tags<cr>",
        desc="Pick help tags",
      },
      {
        "<C-p>t", ":Telescope current_buffer_tags<cr>",
        desc="Pick current buffer tags",
      },
      {
        "<C-p>T", ":Telescope tags<cr>",
        desc="Pick tags (global)",
      },
      {
        "<C-p>g", ":Telescope git_status<cr>",
        desc="Pick files from git status",
      },
      {
        "<C-p>G", ":Telescope git_files<cr>",
        desc="Pick files tracked by git",
      },
      {
        "<C-p><Enter>", ":Telescope resume<cr>",
        desc="Resume last picker",
      },
      {
        "<C-p><C-Enter>", ":Telescope pickers<cr>",
        desc="Pick from previously used pickers",
      },
      {
        "<C-p>c", ":Telescope git_bcommits<cr>",
        desc="Pick git commits for current buffer",
      },
      {
        "<C-p>c", ":Telescope git_bcommits_range<cr>",
        desc="Pick git commits for selected lines",
        mode = "v",
      },
      {
        "<C-p>q", ":Telescope quickfix<cr>",
        desc="Pick from quickfix list",
      },
      {
        "<C-p>Q", ":Telescope quickfixhistory<cr>",
        desc="Pick from quickfix history",
      },
      {
        "<C-p>w", ":Telescope loclist<cr>",
        desc="Pick from loclist",
      },
      {
        "<C-p>o", ":Telescope oldfiles<cr>",
        desc="Pick from previously opened files",
      },
      {
        "<C-p>m", ":Telescope marks<cr>",
        desc="Pick from marks",
      },
      {
        "<C-p>E", ":Telescope diagnostics<cr>",
        desc="Pick from diagnostics",
      },
      {
        "<Backspace>r", ":Telescope lsp_references<CR>",
        desc="Show LSP references",
      },

      {
        "<C-p>s", ":Telescope lsp_document_symbols<CR>",
        desc="Show LSP document symbols",
      },
      {
        "<C-p>S", ":Telescope lsp_dynamic_workspace_symbols<CR>",
        desc="Show LSP workspace symbols",
      },
    },
  },
}
